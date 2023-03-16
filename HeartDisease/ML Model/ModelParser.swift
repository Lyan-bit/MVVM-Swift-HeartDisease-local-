import Foundation
import TensorFlowLite

typealias FileInfo = (name: String, extension: String)

enum ModelFile {
  static let modelInfo: FileInfo = (name: "Heart_model_13F", extension: "tflite")
}

class ModelParser {

    private var interpreter: Interpreter
    
    init?(modelFileInfo: FileInfo, threadCount: Int = 1) {
        let modelFilename = modelFileInfo.name

        guard let modelPath = Bundle.main.path(
          forResource: modelFilename,
          ofType: modelFileInfo.extension
        ) else {
          print("Failed to load the model file")
          return nil
        }
        do {
            interpreter = try Interpreter(modelPath: modelPath)
        } catch _
        {
            print("Failed to create the interpreter")
            return nil
        }
    }
    
    func runModel(withInput1 input1: Float,
                  withInput2 input2: Float,
                  withInput3 input3: Float,
                  withInput4 input4: Float,
                  withInput5 input5: Float,
                  withInput6 input6: Float,
                  withInput7 input7: Float,
                  withInput8 input8: Float,
                  withInput9 input9: Float,
                  withInput10 input10: Float,
                  withInput11 input11: Float,
                  withInput12 input12: Float,
                  withInput13 input13: Float) -> String? {
        do {
            try interpreter.allocateTensors()
            var data = [Float] (arrayLiteral: input1, input2, input3, input4, input5, input6,
                                input7, input8, input9, input10, input11, input12, input13)
            let buffer: UnsafeMutableBufferPointer<Float> = UnsafeMutableBufferPointer(start: &data, count: 13)
            try interpreter.copy(Data(buffer: buffer), toInputAt: 0)
            try interpreter.invoke()
            let outputTensor = try interpreter.output(at: 0)
            let results: [Float32] =
            [Float32](unsafeData: outputTensor.data) ?? []
            print(results)
            
           var result = ""
            if results[0] > results[1] {
                result = "Negative"
            } else {
                result = "Positive"
            }
            return result
        }
        catch {
              print(error)
              return nil
        }
    }
}
    
extension Array {
  init?(unsafeData: Data) {
    guard unsafeData.count % MemoryLayout<Element>.stride == 0
          else { return nil }
    #if swift(>=5.0)
    self = unsafeData.withUnsafeBytes {
      .init($0.bindMemory(to: Element.self))
    }
    #else
    self = unsafeData.withUnsafeBytes {
      .init(UnsafeBufferPointer<Element>(
        start: $0,
        count: unsafeData.count / MemoryLayout<Element>.stride
      ))
    }
    #endif  // swift(>=5.0)
  }
}

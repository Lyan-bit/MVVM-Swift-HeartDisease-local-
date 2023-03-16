import Foundation
import Darwin
import Combine
import SwiftUI
import CoreLocation

class ClassificationViewModel : ObservableObject {
    static var instance : ClassificationViewModel? = nil
    var fileSystem : FileAccessor = FileAccessor()
    private var crudvm : HeartDiseaseViewModel = HeartDiseaseViewModel.getInstance()

    private var modelParser : ModelParser? = ModelParser(modelFileInfo: ModelFile.modelInfo)

  static func getInstance() -> ClassificationViewModel
  { if instance == nil {
      instance = ClassificationViewModel()
    }
    return instance!
  }
    func classifyHeartDisease(x : String) -> String {
        guard let heartDisease = crudvm.getHeartDiseaseByPK(val: x)
    else {
    return "Please selsect valid id"
    }

    guard let result = self.modelParser?.runModel(
        withInput1: Float((heartDisease.age - 29) / (77 - 29)),
        withInput2: Float(heartDisease.sex),
        withInput3: Float((heartDisease.cp - 0) / (3 - 0)),
        withInput4: Float((heartDisease.trestbps - 94) / (200 - 94)),
        withInput5: Float((heartDisease.chol - 126) / (564 - 126)),
        withInput6: Float(heartDisease.fbs),
        withInput7: Float((heartDisease.restecg - 0) / (2 - 0)),
        withInput8: Float((heartDisease.thalach - 71) / (202 - 71)),
        withInput9: Float(heartDisease.exang),
        withInput10: Float((heartDisease.oldpeak - 0) / (Int(6.2) - 0)),
        withInput11: Float((heartDisease.slope - 0) / (2 - 0)),
        withInput12: Float((heartDisease.ca - 0) / (4 - 0)),
        withInput13: Float((heartDisease.thal - 0) / (3 - 0))
    ) else{
    return "Error"
    }

    heartDisease.outcome = result
        crudvm.persistHeartDisease(x: heartDisease)

    return result
    }

    func cancelClassifyHeartDisease() {
    //cancel function
    }
}

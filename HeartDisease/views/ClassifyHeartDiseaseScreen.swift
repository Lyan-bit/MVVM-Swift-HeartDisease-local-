import Foundation
import SwiftUI

struct ClassifyHeartDiseaseScreen: View {
    @State var objectId: String = ""
    @ObservedObject var model : HeartDiseaseViewModel
    @ObservedObject var classification : ClassificationViewModel
    
    @State var result = ""

    var body: some View {
  	NavigationView {
  		ScrollView {
        VStack {
             HStack (spacing: 20) {
             	Text("id:").bold()
             	Divider()
                Picker("Select a object", selection: $objectId) {
                  ForEach(model.currentHeartDiseases) { Text($0.id).tag($0.id) }
                }.pickerStyle(.menu)
             }.frame(width: 200, height: 30).border(Color.gray)
                        
             VStack (spacing: 20) {
             	Text("Result:").bold()
                Text("\(result)")
             }.frame(width: 200, height: 60).border(Color.gray)
             
             HStack (spacing: 20) {
                Button(action: { result = self.classification.classifyHeartDisease(x: objectId) } ) { Text("Classify") }
				Button(action: {self.classification.cancelClassifyHeartDisease() } ) { Text("Cancel") }
		     }.buttonStyle(.bordered)
        }.onAppear(perform:
        	{ objectId = model.currentHeartDisease?.id ?? "id" 
        	  model.listHeartDisease()
        	})
        }.navigationTitle("classifyHeartDisease")
      }
    }
}

struct ClassifyHeartDiseaseScreen_Previews: PreviewProvider {
    static var previews: some View {
        ClassifyHeartDiseaseScreen(model: HeartDiseaseViewModel.getInstance(), classification: ClassificationViewModel.getInstance())
    }
}


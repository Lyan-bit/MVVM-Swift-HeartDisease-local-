
import SwiftUI

struct DeleteHeartDiseaseScreen: View {
    @State var objectId: String = ""
    @ObservedObject var model : HeartDiseaseViewModel
    
    var body: some View {
  	NavigationView {
  		ScrollView {
      VStack(spacing: 20) {
            HStack (spacing: 20) {
             	Text("id:").bold()
             	Divider()
		        Picker("HeartDisease", selection: $objectId) { 
		        	ForEach(model.currentHeartDiseases) { Text($0.id).tag($0.id) }
		        }.pickerStyle(.menu)
		    }.frame(width: 200, height: 30).border(Color.gray)

        HStack(spacing: 20) {
            Button(action: { self.model.deleteHeartDisease(id: objectId) } ) { Text("Delete") }
			Button(action: { self.model.cancelDeleteHeartDisease() } ) { Text("Cancel") }
        }.buttonStyle(.bordered)
      }.padding(.top).onAppear(perform:
        {   objectId = model.currentHeartDisease?.id ?? "id" 
        	model.listHeartDisease()
        })
        }.navigationTitle("Delete HeartDisease")
       }
    } 
}

struct DeleteHeartDiseaseScreen_Previews: PreviewProvider {
    static var previews: some View {
        DeleteHeartDiseaseScreen(model: HeartDiseaseViewModel.getInstance())
    }
}


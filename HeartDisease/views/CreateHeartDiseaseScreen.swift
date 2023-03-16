
import SwiftUI

struct CreateHeartDiseaseScreen: View {
 
  @State var bean : HeartDiseaseVO = HeartDiseaseVO()
  @ObservedObject var model : HeartDiseaseViewModel

  var body: some View {
  	NavigationView {
  		ScrollView {
  	VStack(spacing: 20) {

  VStack(spacing: 20) {
		HStack (spacing: 20) {
		 Text("Id:").bold()
		 TextField("Id", text: $bean.id).textFieldStyle(RoundedBorderTextFieldStyle())
	}.frame(width: 200, height: 30).border(Color.gray)

		HStack (spacing: 20) {
		Text("Age:").bold()
		TextField("Age", value: $bean.age, format: .number).keyboardType(.decimalPad).textFieldStyle(RoundedBorderTextFieldStyle())
	}.frame(width: 200, height: 30).border(Color.gray)

		HStack (spacing: 20) {
		Text("Sex:").bold()
		TextField("Sex", value: $bean.sex, format: .number).keyboardType(.decimalPad).textFieldStyle(RoundedBorderTextFieldStyle())
	}.frame(width: 200, height: 30).border(Color.gray)

		HStack (spacing: 20) {
		Text("Cp:").bold()
		TextField("Cp", value: $bean.cp, format: .number).keyboardType(.decimalPad).textFieldStyle(RoundedBorderTextFieldStyle())
	}.frame(width: 200, height: 30).border(Color.gray)

		HStack (spacing: 20) {
		Text("Trestbps:").bold()
		TextField("Trestbps", value: $bean.trestbps, format: .number).keyboardType(.decimalPad).textFieldStyle(RoundedBorderTextFieldStyle())
	}.frame(width: 200, height: 30).border(Color.gray)

		HStack (spacing: 20) {
		Text("Chol:").bold()
		TextField("Chol", value: $bean.chol, format: .number).keyboardType(.decimalPad).textFieldStyle(RoundedBorderTextFieldStyle())
	}.frame(width: 200, height: 30).border(Color.gray)

		HStack (spacing: 20) {
		Text("Fbs:").bold()
		TextField("Fbs", value: $bean.fbs, format: .number).keyboardType(.decimalPad).textFieldStyle(RoundedBorderTextFieldStyle())
	}.frame(width: 200, height: 30).border(Color.gray)

		HStack (spacing: 20) {
		Text("Restecg:").bold()
		TextField("Restecg", value: $bean.restecg, format: .number).keyboardType(.decimalPad).textFieldStyle(RoundedBorderTextFieldStyle())
	}.frame(width: 200, height: 30).border(Color.gray)

	}
	VStack(spacing: 20) {
		HStack (spacing: 20) {
		 Text("Thalach:").bold()
		 TextField("Thalach", value: $bean.thalach, format: .number).keyboardType(.decimalPad).textFieldStyle(RoundedBorderTextFieldStyle())
		 }.frame(width: 200, height: 30).border(Color.gray)

		HStack (spacing: 20) {
		 Text("Exang:").bold()
		 TextField("Exang", value: $bean.exang, format: .number).keyboardType(.decimalPad).textFieldStyle(RoundedBorderTextFieldStyle())
		 }.frame(width: 200, height: 30).border(Color.gray)

		HStack (spacing: 20) {
		 Text("Oldpeak:").bold()
		 TextField("Oldpeak", value: $bean.oldpeak, format: .number).keyboardType(.decimalPad).textFieldStyle(RoundedBorderTextFieldStyle())
		 }.frame(width: 200, height: 30).border(Color.gray)

		HStack (spacing: 20) {
		 Text("Slope:").bold()
		 TextField("Slope", value: $bean.slope, format: .number).keyboardType(.decimalPad).textFieldStyle(RoundedBorderTextFieldStyle())
		 }.frame(width: 200, height: 30).border(Color.gray)

		HStack (spacing: 20) {
		 Text("Ca:").bold()
		 TextField("Ca", value: $bean.ca, format: .number).keyboardType(.decimalPad).textFieldStyle(RoundedBorderTextFieldStyle())
		 }.frame(width: 200, height: 30).border(Color.gray)

		HStack (spacing: 20) {
		 Text("Thal:").bold()
		 TextField("Thal", value: $bean.thal, format: .number).keyboardType(.decimalPad).textFieldStyle(RoundedBorderTextFieldStyle())
		 }.frame(width: 200, height: 30).border(Color.gray)

		HStack (spacing: 20)  {
		  Text("Outcome:").bold()
		  TextField("Outcome", text: $bean.outcome).textFieldStyle(RoundedBorderTextFieldStyle())
		  }.frame(width: 200, height: 30).border(Color.gray)

}

      HStack(spacing: 20) {
        Button(action: { 
        	self.model.createHeartDisease(x: bean)
        } ) { Text("Create") }
        Button(action: { self.model.cancelCreateHeartDisease() } ) { Text("Cancel") }
      }.buttonStyle(.bordered)
    }.padding(.top)
     }.navigationTitle("Create HeartDisease")
    }
  }
}

struct CreateHeartDiseaseScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateHeartDiseaseScreen(model: HeartDiseaseViewModel.getInstance())
    }
}


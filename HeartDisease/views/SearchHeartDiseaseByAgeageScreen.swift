
import SwiftUI

struct SearchHeartDiseaseByAgeageScreen: View {
    @State var age: Int = 0
    @ObservedObject var model : HeartDiseaseViewModel
    @State var bean : [HeartDiseaseVO] = [HeartDiseaseVO] ()
    
    var body: some View {
  	NavigationView { 
      VStack(alignment: HorizontalAlignment.center, spacing: 20) {
      	 Spacer()
      	
		 HStack (spacing: 20) {
		  	Text("age:").bold()
		  	Divider()
	        Picker("HeartDisease", selection: $age) { 
	        	ForEach(model.currentHeartDiseases) { Text(String($0.age)).tag(String($0.age)) }
	        }.pickerStyle(.menu)
	 	 }.frame(width: 200, height: 30).border(Color.gray)
       
		HStack(spacing: 20) {
	        Button(action: { bean = self.model.searchByHeartDiseaseage(val: age) } ) { Text("Search") }
	        Button(action: { self.model.cancelSearchHeartDiseaseByAge() } ) { Text("Cancel") }
	      }.buttonStyle(.bordered)
    
		List(bean) { instance in 
			ListHeartDiseaseRowScreen(instance: instance) }
		    
		Spacer()
	
    }.onAppear(perform:
    	{   age = model.currentHeartDisease?.age ?? age 
    		model.listHeartDisease()
    	})
     .navigationTitle("Search by age")
    }
  }
}

struct SearchHeartDiseaseByAgeageScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchHeartDiseaseByAgeageScreen(model: HeartDiseaseViewModel.getInstance())
    }
}

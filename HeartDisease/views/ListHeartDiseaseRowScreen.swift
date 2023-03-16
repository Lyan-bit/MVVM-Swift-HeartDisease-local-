
import SwiftUI

struct ListHeartDiseaseRowScreen: View {
    
    var instance : HeartDiseaseVO
    @ObservedObject var model : HeartDiseaseViewModel = HeartDiseaseViewModel.getInstance()

      var body: some View { 
      	ScrollView {
    VStack {
        HStack  {
          Text(String(instance.id)).bold()
          Text(String(instance.age))
          Text(String(instance.sex))
          Text(String(instance.cp))
          Text(String(instance.trestbps))
          Text(String(instance.chol))
          Text(String(instance.fbs))
          Text(String(instance.restecg))
	    }
        HStack {
          Text(String(instance.thalach))
          Text(String(instance.exang))
          Text(String(instance.oldpeak))
          Text(String(instance.slope))
          Text(String(instance.ca))
          Text(String(instance.thal))
          Text(String(instance.outcome))
        }
}.onAppear()
          { model.setSelectedHeartDisease(x: instance) 
          }
        }
      }
    }

    struct ListHeartDiseaseRowScreen_Previews: PreviewProvider {
      static var previews: some View {
        ListHeartDiseaseRowScreen(instance: HeartDiseaseVO(x: heartDiseaseAllInstances[0]))
      }
    }


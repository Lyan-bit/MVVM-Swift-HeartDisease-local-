
import Foundation

class HeartDiseaseBean {
	
  var errorList : [String] = [String]()

  init() {
  	 //init
  }

  func resetData() { 
  	errorList = [String]()
  }

  func isCreateHeartDiseaseError(heartDisease: HeartDiseaseVO) -> Bool { 
  	resetData() 
  	if heartDisease.id == "" {
  		errorList.append("id cannot be empty")
  	}
  	if heartDisease.age != 0 {
	  		errorList.append("age cannot be zero")
	  	}
  	if heartDisease.sex != 0 {
	  		errorList.append("sex cannot be zero")
	  	}
  	if heartDisease.cp != 0 {
	  		errorList.append("cp cannot be zero")
	  	}
  	if heartDisease.trestbps != 0 {
	  		errorList.append("trestbps cannot be zero")
	  	}
  	if heartDisease.chol != 0 {
	  		errorList.append("chol cannot be zero")
	  	}
  	if heartDisease.fbs != 0 {
	  		errorList.append("fbs cannot be zero")
	  	}
  	if heartDisease.restecg != 0 {
	  		errorList.append("restecg cannot be zero")
	  	}
  	if heartDisease.thalach != 0 {
	  		errorList.append("thalach cannot be zero")
	  	}
  	if heartDisease.exang != 0 {
	  		errorList.append("exang cannot be zero")
	  	}
  	if heartDisease.oldpeak != 0 {
	  		errorList.append("oldpeak cannot be zero")
	  	}
  	if heartDisease.slope != 0 {
	  		errorList.append("slope cannot be zero")
	  	}
  	if heartDisease.ca != 0 {
	  		errorList.append("ca cannot be zero")
	  	}
  	if heartDisease.thal != 0 {
	  		errorList.append("thal cannot be zero")
	  	}
  	if heartDisease.outcome == "" {
  		errorList.append("outcome cannot be empty")
  	}

    return errorList.count > 0
  }

  func isEditHeartDiseaseError() -> Bool
    { return false }
          
  func isListHeartDiseaseError() -> Bool {
    resetData() 
    return false
  }
  
   func isDeleteHeartDiseaseerror() -> Bool
     { return false }

  func errors() -> String {
    var res : String = ""
    for (_,x) in errorList.enumerated()
    { res = res + x + ", " }
    return res
  }

}

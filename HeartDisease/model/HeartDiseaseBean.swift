
import Foundation

class HeartDiseaseBean {
	
  var errorList : [String] = [String]()

  init() {
  	 //init
  }

  func resetData() { 
  	errorList = [String]()
  }

  func isCreateHeartDiseaseError(id: String, age: Int, sex: Int, cp: Int, trestbps: Int, chol: Int, fbs: Int, restecg: Int, thalach: Int, exang: Int, oldpeak: Int, slope: Int, ca: Int, thal: Int, outcome: String) -> Bool { 
  	resetData() 
  	if id == "" {
  		errorList.append("id cannot be empty")
  	}
  	if age != 0 {
	  		errorList.append("age cannot be zero")
	  	}
  	if sex != 0 {
	  		errorList.append("sex cannot be zero")
	  	}
  	if cp != 0 {
	  		errorList.append("cp cannot be zero")
	  	}
  	if trestbps != 0 {
	  		errorList.append("trestbps cannot be zero")
	  	}
  	if chol != 0 {
	  		errorList.append("chol cannot be zero")
	  	}
  	if fbs != 0 {
	  		errorList.append("fbs cannot be zero")
	  	}
  	if restecg != 0 {
	  		errorList.append("restecg cannot be zero")
	  	}
  	if thalach != 0 {
	  		errorList.append("thalach cannot be zero")
	  	}
  	if exang != 0 {
	  		errorList.append("exang cannot be zero")
	  	}
  	if oldpeak != 0 {
	  		errorList.append("oldpeak cannot be zero")
	  	}
  	if slope != 0 {
	  		errorList.append("slope cannot be zero")
	  	}
  	if ca != 0 {
	  		errorList.append("ca cannot be zero")
	  	}
  	if thal != 0 {
	  		errorList.append("thal cannot be zero")
	  	}
  	if outcome == "" {
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


import Foundation

class HeartDisease  {
	
  private static var instance : HeartDisease? = nil	
  
  init() { 
  	//init
  }
  
  init(copyFrom: HeartDisease) {
  	self.id = "copy" + copyFrom.id
  	self.age = copyFrom.age
  	self.sex = copyFrom.sex
  	self.cp = copyFrom.cp
  	self.trestbps = copyFrom.trestbps
  	self.chol = copyFrom.chol
  	self.fbs = copyFrom.fbs
  	self.restecg = copyFrom.restecg
  	self.thalach = copyFrom.thalach
  	self.exang = copyFrom.exang
  	self.oldpeak = copyFrom.oldpeak
  	self.slope = copyFrom.slope
  	self.ca = copyFrom.ca
  	self.thal = copyFrom.thal
  	self.outcome = copyFrom.outcome
  }
  
  func copy() -> HeartDisease
  { let res : HeartDisease = HeartDisease(copyFrom: self)
  	addHeartDisease(instance: res)
  	return res
  }
  
static func defaultInstanceHeartDisease() -> HeartDisease
    { if (instance == nil)
    { instance = createHeartDisease() }
    return instance!
}

deinit
{ killHeartDisease(obj: self) }	


  var id: String = ""  /* primary key */
  var age: Int = 0 
  var sex: Int = 0 
  var cp: Int = 0 
  var trestbps: Int = 0 
  var chol: Int = 0 
  var fbs: Int = 0 
  var restecg: Int = 0 
  var thalach: Int = 0 
  var exang: Int = 0 
  var oldpeak: Int = 0 
  var slope: Int = 0 
  var ca: Int = 0 
  var thal: Int = 0 
  var outcome: String = "" 

  static var heartDiseaseIndex : Dictionary<String,HeartDisease> = [String:HeartDisease]()

  static func getByPKHeartDisease(index : String) -> HeartDisease?
  { return heartDiseaseIndex[index] }


}

  var heartDiseaseAllInstances : [HeartDisease] = [HeartDisease]()

  func createHeartDisease() -> HeartDisease
	{ let result : HeartDisease = HeartDisease()
	  heartDiseaseAllInstances.append(result)
	  return result }
  
  func addHeartDisease(instance : HeartDisease)
	{ heartDiseaseAllInstances.append(instance) }

  func killHeartDisease(obj: HeartDisease)
	{ heartDiseaseAllInstances = heartDiseaseAllInstances.filter{ $0 !== obj } }

  func createByPKHeartDisease(key : String) -> HeartDisease
	{ var result : HeartDisease? = HeartDisease.getByPKHeartDisease(index: key)
	  if result != nil { 
	  	return result!
	  }
	  result = HeartDisease()
	  heartDiseaseAllInstances.append(result!)
	  HeartDisease.heartDiseaseIndex[key] = result!
	  result!.id = key
	  return result! }

  func killHeartDisease(key : String)
	{ HeartDisease.heartDiseaseIndex[key] = nil
	  heartDiseaseAllInstances.removeAll(where: { $0.id == key })
	}
	
	extension HeartDisease : Hashable, Identifiable
	{ 
	  static func == (lhs: HeartDisease, rhs: HeartDisease) -> Bool
	  {       lhs.id == rhs.id &&
      lhs.age == rhs.age &&
      lhs.sex == rhs.sex &&
      lhs.cp == rhs.cp &&
      lhs.trestbps == rhs.trestbps &&
      lhs.chol == rhs.chol &&
      lhs.fbs == rhs.fbs &&
      lhs.restecg == rhs.restecg &&
      lhs.thalach == rhs.thalach &&
      lhs.exang == rhs.exang &&
      lhs.oldpeak == rhs.oldpeak &&
      lhs.slope == rhs.slope &&
      lhs.ca == rhs.ca &&
      lhs.thal == rhs.thal &&
      lhs.outcome == rhs.outcome
	  }
	
	  func hash(into hasher: inout Hasher) {
    	hasher.combine(id)
    	hasher.combine(age)
    	hasher.combine(sex)
    	hasher.combine(cp)
    	hasher.combine(trestbps)
    	hasher.combine(chol)
    	hasher.combine(fbs)
    	hasher.combine(restecg)
    	hasher.combine(thalach)
    	hasher.combine(exang)
    	hasher.combine(oldpeak)
    	hasher.combine(slope)
    	hasher.combine(ca)
    	hasher.combine(thal)
    	hasher.combine(outcome)
	  }
	}
	


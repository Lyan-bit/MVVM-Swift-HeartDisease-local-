
import Foundation

class HeartDiseaseVO : Identifiable, Decodable, Encodable {

  var id: String = ""
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

  static var defaultInstance : HeartDiseaseVO? = nil
  var errorList : [String] = [String]()

  init() {
  	//init
  }

  static func defaultHeartDiseaseVO() -> HeartDiseaseVO
  { if defaultInstance == nil
    { defaultInstance = HeartDiseaseVO() }
    return defaultInstance!
  }

  init(idx: String, agex: Int, sexx: Int, cpx: Int, trestbpsx: Int, cholx: Int, fbsx: Int, restecgx: Int, thalachx: Int, exangx: Int, oldpeakx: Int, slopex: Int, cax: Int, thalx: Int, outcomex: String)  {
    id = idx
    age = agex
    sex = sexx
    cp = cpx
    trestbps = trestbpsx
    chol = cholx
    fbs = fbsx
    restecg = restecgx
    thalach = thalachx
    exang = exangx
    oldpeak = oldpeakx
    slope = slopex
    ca = cax
    thal = thalx
    outcome = outcomex
  }

  init(x : HeartDisease)  {
    id = x.id
    age = x.age
    sex = x.sex
    cp = x.cp
    trestbps = x.trestbps
    chol = x.chol
    fbs = x.fbs
    restecg = x.restecg
    thalach = x.thalach
    exang = x.exang
    oldpeak = x.oldpeak
    slope = x.slope
    ca = x.ca
    thal = x.thal
    outcome = x.outcome
  }

  func toString() -> String
  { return " id= \(id), age= \(age), sex= \(sex), cp= \(cp), trestbps= \(trestbps), chol= \(chol), fbs= \(fbs), restecg= \(restecg), thalach= \(thalach), exang= \(exang), oldpeak= \(oldpeak), slope= \(slope), ca= \(ca), thal= \(thal), outcome= \(outcome) "
  }

  func getId() -> String
	  { return id }
	
  func setId(x : String)
	  { id = x }
	  
  func getAge() -> Int
	  { return age }
	
  func setAge(x : Int)
	  { age = x }
	  
  func getSex() -> Int
	  { return sex }
	
  func setSex(x : Int)
	  { sex = x }
	  
  func getCp() -> Int
	  { return cp }
	
  func setCp(x : Int)
	  { cp = x }
	  
  func getTrestbps() -> Int
	  { return trestbps }
	
  func setTrestbps(x : Int)
	  { trestbps = x }
	  
  func getChol() -> Int
	  { return chol }
	
  func setChol(x : Int)
	  { chol = x }
	  
  func getFbs() -> Int
	  { return fbs }
	
  func setFbs(x : Int)
	  { fbs = x }
	  
  func getRestecg() -> Int
	  { return restecg }
	
  func setRestecg(x : Int)
	  { restecg = x }
	  
  func getThalach() -> Int
	  { return thalach }
	
  func setThalach(x : Int)
	  { thalach = x }
	  
  func getExang() -> Int
	  { return exang }
	
  func setExang(x : Int)
	  { exang = x }
	  
  func getOldpeak() -> Int
	  { return oldpeak }
	
  func setOldpeak(x : Int)
	  { oldpeak = x }
	  
  func getSlope() -> Int
	  { return slope }
	
  func setSlope(x : Int)
	  { slope = x }
	  
  func getCa() -> Int
	  { return ca }
	
  func setCa(x : Int)
	  { ca = x }
	  
  func getThal() -> Int
	  { return thal }
	
  func setThal(x : Int)
	  { thal = x }
	  
  func getOutcome() -> String
	  { return outcome }
	
  func setOutcome(x : String)
	  { outcome = x }

}

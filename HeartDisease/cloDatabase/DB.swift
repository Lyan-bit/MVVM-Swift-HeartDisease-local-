import Foundation
import SQLite3

/* Code adapted from https://www.raywenderlich.com/6620276-sqlite-with-swift-tutorial-getting-started */

class DB {
  let dbPointer : OpaquePointer?
  static let dbName = "heartdiseaseApp.db"
  static let dbVersion = 1

  static let heartDiseaseTableName = "HeartDisease"
  static let heartDiseaseID = 0
  static let heartDiseaseCols : [String] = ["TableId", "id", "age", "sex", "cp", "trestbps", "chol", "fbs", "restecg", "thalach", "exang", "oldpeak", "slope", "ca", "thal", "outcome"]
  static let heartDiseaseNumberCols = 0

  static let heartDiseaseCreateSchema =
    "create table HeartDisease (TableId integer primary key autoincrement" +
        ", id VARCHAR(50) not null"  +
        ", age integer not null"  +
        ", sex integer not null"  +
        ", cp integer not null"  +
        ", trestbps integer not null"  +
        ", chol integer not null"  +
        ", fbs integer not null"  +
        ", restecg integer not null"  +
        ", thalach integer not null"  +
        ", exang integer not null"  +
        ", oldpeak integer not null"  +
        ", slope integer not null"  +
        ", ca integer not null"  +
        ", thal integer not null"  +
        ", outcome VARCHAR(50) not null"  +
    "" + ")"
    
  private init(dbPointer: OpaquePointer?)
  { self.dbPointer = dbPointer }

  func createDatabase() throws
  { do
    {
    try createTable(table: DB.heartDiseaseCreateSchema)
      print("Created database")
    }
    catch { print("Errors: " + errorMessage) }
  }

  static func obtainDatabase(path: String) -> DB?
  {
    var db : DB? = nil
    if FileAccessor.fileExistsAbsolutePath(filename: path)
    { print("Database already exists")
      do
      { try db = DB.open(path: path)
        if db != nil
        { print("Opened database") }
        else
        { print("Failed to open existing database") }
      }
      catch { print("Error opening existing database")
              return nil
            }
    }
    else
    { print("New database will be created")
      do
      { try db = DB.open(path: path)
        if db != nil
        { print("Opened new database")
          try db!.createDatabase()
        }
        else
        { print("Failed to open new database") }
      }
      catch { print("Error opening new database")
              return nil }
    }
    return db
  }

  fileprivate var errorMessage: String
  { if let errorPointer = sqlite3_errmsg(dbPointer)
    { let eMessage = String(cString: errorPointer)
      return eMessage
    }
    else
    { return "Unknown error from sqlite." }
  }
  
  func prepareStatement(sql: String) throws -> OpaquePointer?
  { var statement: OpaquePointer?
    guard sqlite3_prepare_v2(dbPointer, sql, -1, &statement, nil)
        == SQLITE_OK
    else
    { return nil }
    return statement
  }
  
  static func open(path: String) throws -> DB?
  { var db: OpaquePointer?
  
    if sqlite3_open(path, &db) == SQLITE_OK
    { return DB(dbPointer: db) }
    else
    { defer
      { if db != nil
        { sqlite3_close(db) }
      }
  
      if let errorPointer = sqlite3_errmsg(db)
      { let message = String(cString: errorPointer)
        print("Error opening database: " + message)
      }
      else
      { print("Unknown error opening database") }
      return nil
    }
  }
  
  func createTable(table: String) throws
  { let createTableStatement = try prepareStatement(sql: table)
    defer
    { sqlite3_finalize(createTableStatement) }
    
    guard sqlite3_step(createTableStatement) == SQLITE_DONE
    else
    { print("Error creating table")
      return
    }
    print("table " + table + " created.")
  }

  func listHeartDisease() -> [HeartDiseaseVO]
  {
      let statement = "SELECT * FROM HeartDisease "
      return setDataHeartDisease(statement: statement)
  }

  func createHeartDisease(heartDiseasevo : HeartDiseaseVO) throws
  { let insertSQL : String = "INSERT INTO HeartDisease (id, age, sex, cp, trestbps, chol, fbs, restecg, thalach, exang, oldpeak, slope, ca, thal, outcome) VALUES ("

     + "'" + heartDiseasevo.getId() + "'" + ","
     + String(heartDiseasevo.getAge()) + ","
     + String(heartDiseasevo.getSex()) + ","
     + String(heartDiseasevo.getCp()) + ","
     + String(heartDiseasevo.getTrestbps()) + ","
     + String(heartDiseasevo.getChol()) + ","
     + String(heartDiseasevo.getFbs()) + ","
     + String(heartDiseasevo.getRestecg()) + ","
     + String(heartDiseasevo.getThalach()) + ","
     + String(heartDiseasevo.getExang()) + ","
     + String(heartDiseasevo.getOldpeak()) + ","
     + String(heartDiseasevo.getSlope()) + ","
     + String(heartDiseasevo.getCa()) + ","
     + String(heartDiseasevo.getThal()) + ","
     + "'" + heartDiseasevo.getOutcome() + "'"
      + ")"
    let insertStatement = try prepareStatement(sql: insertSQL)
    defer
    { sqlite3_finalize(insertStatement)
    }
    sqlite3_step(insertStatement)
  }

  func searchByHeartDiseaseid(val : String) -> [HeartDiseaseVO]
      {
          let statement : String = "SELECT * FROM HeartDisease WHERE id = " + "'" + val + "'"
          return setDataHeartDisease(statement: statement)
      }
      
  func searchByHeartDiseaseage(val : Int) -> [HeartDiseaseVO]
      {
          let statement : String = "SELECT * FROM HeartDisease WHERE age = " + String( val )
          return setDataHeartDisease(statement: statement)
      }
      
  func searchByHeartDiseasesex(val : Int) -> [HeartDiseaseVO]
      {
          let statement : String = "SELECT * FROM HeartDisease WHERE sex = " + String( val )
          return setDataHeartDisease(statement: statement)
      }
      
  func searchByHeartDiseasecp(val : Int) -> [HeartDiseaseVO]
      {
          let statement : String = "SELECT * FROM HeartDisease WHERE cp = " + String( val )
          return setDataHeartDisease(statement: statement)
      }
      
  func searchByHeartDiseasetrestbps(val : Int) -> [HeartDiseaseVO]
      {
          let statement : String = "SELECT * FROM HeartDisease WHERE trestbps = " + String( val )
          return setDataHeartDisease(statement: statement)
      }
      
  func searchByHeartDiseasechol(val : Int) -> [HeartDiseaseVO]
      {
          let statement : String = "SELECT * FROM HeartDisease WHERE chol = " + String( val )
          return setDataHeartDisease(statement: statement)
      }
      
  func searchByHeartDiseasefbs(val : Int) -> [HeartDiseaseVO]
      {
          let statement : String = "SELECT * FROM HeartDisease WHERE fbs = " + String( val )
          return setDataHeartDisease(statement: statement)
      }
      
  func searchByHeartDiseaserestecg(val : Int) -> [HeartDiseaseVO]
      {
          let statement : String = "SELECT * FROM HeartDisease WHERE restecg = " + String( val )
          return setDataHeartDisease(statement: statement)
      }
      
  func searchByHeartDiseasethalach(val : Int) -> [HeartDiseaseVO]
      {
          let statement : String = "SELECT * FROM HeartDisease WHERE thalach = " + String( val )
          return setDataHeartDisease(statement: statement)
      }
      
  func searchByHeartDiseaseexang(val : Int) -> [HeartDiseaseVO]
      {
          let statement : String = "SELECT * FROM HeartDisease WHERE exang = " + String( val )
          return setDataHeartDisease(statement: statement)
      }
      
  func searchByHeartDiseaseoldpeak(val : Int) -> [HeartDiseaseVO]
      {
          let statement : String = "SELECT * FROM HeartDisease WHERE oldpeak = " + String( val )
          return setDataHeartDisease(statement: statement)
      }
      
  func searchByHeartDiseaseslope(val : Int) -> [HeartDiseaseVO]
      {
          let statement : String = "SELECT * FROM HeartDisease WHERE slope = " + String( val )
          return setDataHeartDisease(statement: statement)
      }
      
  func searchByHeartDiseaseca(val : Int) -> [HeartDiseaseVO]
      {
          let statement : String = "SELECT * FROM HeartDisease WHERE ca = " + String( val )
          return setDataHeartDisease(statement: statement)
      }
      
  func searchByHeartDiseasethal(val : Int) -> [HeartDiseaseVO]
      {
          let statement : String = "SELECT * FROM HeartDisease WHERE thal = " + String( val )
          return setDataHeartDisease(statement: statement)
      }
      
  func searchByHeartDiseaseoutcome(val : String) -> [HeartDiseaseVO]
      {
          let statement : String = "SELECT * FROM HeartDisease WHERE outcome = " + "'" + val + "'"
          return setDataHeartDisease(statement: statement)
      }
      

  func editHeartDisease(heartDiseasevo : HeartDiseaseVO)
  { var updateStatement: OpaquePointer?
    let statement : String = "UPDATE HeartDisease SET "
    + " age = " + String(heartDiseasevo.getAge())
    + ","
    + " sex = " + String(heartDiseasevo.getSex())
    + ","
    + " cp = " + String(heartDiseasevo.getCp())
    + ","
    + " trestbps = " + String(heartDiseasevo.getTrestbps())
    + ","
    + " chol = " + String(heartDiseasevo.getChol())
    + ","
    + " fbs = " + String(heartDiseasevo.getFbs())
    + ","
    + " restecg = " + String(heartDiseasevo.getRestecg())
    + ","
    + " thalach = " + String(heartDiseasevo.getThalach())
    + ","
    + " exang = " + String(heartDiseasevo.getExang())
    + ","
    + " oldpeak = " + String(heartDiseasevo.getOldpeak())
    + ","
    + " slope = " + String(heartDiseasevo.getSlope())
    + ","
    + " ca = " + String(heartDiseasevo.getCa())
    + ","
    + " thal = " + String(heartDiseasevo.getThal())
    + ","
    + " outcome = '"+heartDiseasevo.getOutcome() + "'"
    + " WHERE id = '" + heartDiseasevo.getId() + "'"

    if sqlite3_prepare_v2(dbPointer, statement, -1, &updateStatement, nil) == SQLITE_OK
    { sqlite3_step(updateStatement) }
    sqlite3_finalize(updateStatement)
  }

  func deleteHeartDisease(val : String)
  { let deleteStatementString = "DELETE FROM HeartDisease WHERE id = '" + val + "'"
    var deleteStatement: OpaquePointer?
    
    if sqlite3_prepare_v2(dbPointer, deleteStatementString, -1, &deleteStatement, nil) == SQLITE_OK
    { sqlite3_step(deleteStatement) }
    sqlite3_finalize(deleteStatement)
  }


  deinit
  { sqlite3_close(self.dbPointer) }

  func setDataHeartDisease(statement: String) -> [HeartDiseaseVO] {
          var res : [HeartDiseaseVO] = [HeartDiseaseVO]()
          let queryStatement = try? prepareStatement(sql: statement)
          
          while (sqlite3_step(queryStatement) == SQLITE_ROW)
          {
            let heartDiseasevo = HeartDiseaseVO()
            
          guard let queryResultHeartDiseaseColId = sqlite3_column_text(queryStatement, 1)
                  else { return res }
                  let id = String(cString: queryResultHeartDiseaseColId)
                  heartDiseasevo.setId(x: id)
          let queryResultHeartDiseaseColAge = sqlite3_column_int(queryStatement, 2)
                  let age = Int(queryResultHeartDiseaseColAge)
                  heartDiseasevo.setAge(x: age)
          let queryResultHeartDiseaseColSex = sqlite3_column_int(queryStatement, 3)
                  let sex = Int(queryResultHeartDiseaseColSex)
                  heartDiseasevo.setSex(x: sex)
          let queryResultHeartDiseaseColCp = sqlite3_column_int(queryStatement, 4)
                  let cp = Int(queryResultHeartDiseaseColCp)
                  heartDiseasevo.setCp(x: cp)
          let queryResultHeartDiseaseColTrestbps = sqlite3_column_int(queryStatement, 5)
                  let trestbps = Int(queryResultHeartDiseaseColTrestbps)
                  heartDiseasevo.setTrestbps(x: trestbps)
          let queryResultHeartDiseaseColChol = sqlite3_column_int(queryStatement, 6)
                  let chol = Int(queryResultHeartDiseaseColChol)
                  heartDiseasevo.setChol(x: chol)
          let queryResultHeartDiseaseColFbs = sqlite3_column_int(queryStatement, 7)
                  let fbs = Int(queryResultHeartDiseaseColFbs)
                  heartDiseasevo.setFbs(x: fbs)
          let queryResultHeartDiseaseColRestecg = sqlite3_column_int(queryStatement, 8)
                  let restecg = Int(queryResultHeartDiseaseColRestecg)
                  heartDiseasevo.setRestecg(x: restecg)
          let queryResultHeartDiseaseColThalach = sqlite3_column_int(queryStatement, 9)
                  let thalach = Int(queryResultHeartDiseaseColThalach)
                  heartDiseasevo.setThalach(x: thalach)
          let queryResultHeartDiseaseColExang = sqlite3_column_int(queryStatement, 10)
                  let exang = Int(queryResultHeartDiseaseColExang)
                  heartDiseasevo.setExang(x: exang)
          let queryResultHeartDiseaseColOldpeak = sqlite3_column_int(queryStatement, 11)
                  let oldpeak = Int(queryResultHeartDiseaseColOldpeak)
                  heartDiseasevo.setOldpeak(x: oldpeak)
          let queryResultHeartDiseaseColSlope = sqlite3_column_int(queryStatement, 12)
                  let slope = Int(queryResultHeartDiseaseColSlope)
                  heartDiseasevo.setSlope(x: slope)
          let queryResultHeartDiseaseColCa = sqlite3_column_int(queryStatement, 13)
                  let ca = Int(queryResultHeartDiseaseColCa)
                  heartDiseasevo.setCa(x: ca)
          let queryResultHeartDiseaseColThal = sqlite3_column_int(queryStatement, 14)
                  let thal = Int(queryResultHeartDiseaseColThal)
                  heartDiseasevo.setThal(x: thal)
          guard let queryResultHeartDiseaseColOutcome = sqlite3_column_text(queryStatement, 15)
                  else { return res }
                  let outcome = String(cString: queryResultHeartDiseaseColOutcome)
                  heartDiseasevo.setOutcome(x: outcome)
  
            res.append(heartDiseasevo)
          }
          sqlite3_finalize(queryStatement)
          return res
      }
      
}


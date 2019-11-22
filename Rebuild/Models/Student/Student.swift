//
//  Student.swift
//  Students-Profiles-ByDay
//
//  Created by Steven Hertz on 11/20/19.
//  Copyright © 2019 DevelopItSolutions. All rights reserved.
//

import Foundation

struct Student: Codable {
    var  username                  : String  =  ""
    var  firstName                 : String  =  ""
    var  lastName                  : String  =  ""
    var  notes                     : String  =  ""
    var  mondayName                : String  =  ""
    var  mondayId                  : Int = 0
    var  tuesdayName               : String  =  ""
    var  tuesdayId                 : Int = 0
    var  wednesdayName             : String  =  ""
    var  wednesdayId               : Int = 0
    var  thursdayName              : String  =  ""
    var  thursdayId                : Int = 0
    var  fridayName                : String  =  ""
    var  fridayId                  : Int  =  0
    
    static func getTheStudent() -> Student {
        if let jsonData = UserDefaults.standard.data(forKey: "student") {
            let jsonDecoder = JSONDecoder()
            let student = try! jsonDecoder.decode(Student.self, from: jsonData)
            return student
        }
        else {
            return Student(username: "DovidStein", firstName: "Dovid", lastName: "Stein")
        }
    }
    
    static func saveTheStudent(_ student: Student) {
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(student)
        UserDefaults.standard.set(jsonData, forKey: "student")
        UserDefaults.standard.synchronize()
    }
}

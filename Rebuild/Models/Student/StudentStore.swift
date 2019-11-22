//
//  StudentStore.swift
//  Students-Profiles-ByDay
//
//  Created by Steven Hertz on 11/20/19.
//  Copyright © 2019 DevelopItSolutions. All rights reserved.
//

import Foundation

class StudentStore {
    
    var student: Student
    
    init() {
        if let jsonData = UserDefaults.standard.data(forKey: "student") {
            let jsonDecoder = JSONDecoder()
            self.student = try! jsonDecoder.decode(Student.self, from: jsonData)
        } else {
            self.student = Student(username: "DovidStein", firstName: "Dovid", lastName: "Stein")
        }
    }
    
    func saveTheStudent() {
        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(self.student)
        UserDefaults.standard.set(jsonData, forKey: "student")
        UserDefaults.standard.synchronize()
    }
}



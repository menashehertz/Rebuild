//
//  AppProfile.swift
//  Students-Profiles-ByDay
//
//  Created by Steven Hertz on 11/19/19.
//  Copyright © 2019 DevelopItSolutions. All rights reserved.
//

import Foundation

class AppProfile {
    
    var id: String
    var title: String
    var description: String
    
    init(title: String, description: String) {
        self.id = UUID().uuidString
        self.title = title
        self.description = description
    }
    
}


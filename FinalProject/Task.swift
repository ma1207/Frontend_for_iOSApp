//
//  Task.swift
//  FinalProject
//
//  Created by Kaitlyn Ma on 5/4/22.
//

import Foundation
import UIKit

//struct Task: Codable {
//    var id: UUID? = nil
//    var name: String? = nil
//    var date: String? = nil
//
//    var isDone: Bool? = false
//}

class Task {
    var name: String
    var date: String
    
    var isDone: Bool
    
    init(name: String, date: String, isDone: Bool) {
        self.name = name
        self.date = date
        self.isDone = isDone
    }
    
}







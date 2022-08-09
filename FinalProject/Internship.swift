//
//  Internship.swift
//  FinalProject
//
//  Created by Kaitlyn Ma on 5/1/22.
//

import Foundation
import UIKit

struct Internship: Encodable, Decodable {
    //var id: Int? = nil
    //var CompanyName: String? = nil
    //var InternshipTitle: String? = nil
    //var InternshipDescription: String? = nil
    //var ApplicationDeadline: String? = nil
    //var ApplicationStatus: String? = nil
    //var ApplicationLink: String? = nil
    //var InterviewStatus: String? = nil
    //var InterviewDate: String? = nil
    //var InternshipLocation: String? = nil
    let id: Int
    let CompanyName: String
    let ApplicationStatus: String
    let InterviewDate: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case CompanyName = "name"
        case ApplicationStatus = "status"
        case InterviewDate = "date"
    }
    
    init(id: Int, name: String, status: String, date: String) {
        self.id = id
        self.CompanyName = name
        self.ApplicationStatus = status
        self.InterviewDate = date
    }
}

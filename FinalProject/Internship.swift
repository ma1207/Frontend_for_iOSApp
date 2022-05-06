//
//  Internship.swift
//  FinalProject
//
//  Created by Kaitlyn Ma on 5/1/22.
//

import Foundation
import UIKit

struct Internship: Codable {
    var id: UUID? = nil
    var CompanyName: String? = nil
    var InternshipTitle: String? = nil
    var InternshipDescription: String? = nil
    var ApplicationDeadline: String? = nil
    var ApplicationStatus: String? = nil
    var ApplicationLink: String? = nil
    var InterviewStatus: String? = nil
    var InterviewDate: String? = nil
    var InternshipLocation: String? = nil
}

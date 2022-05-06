//
//  UserList.swift
//  FinalProject
//
//  Created by Kaitlyn Ma on 5/6/22.
//

import Foundation
import UIKit

struct UserList: Codable {
    var users: [User]? = nil
}

struct User: Codable {
    var id: String? = nil
    var name: String? = nil
    var internships: [Internship2]? = nil
}

struct Internship2: Codable {
    var id: String? = nil
    var title: String? = nil
    var company: String? = nil
    var status: String? = nil
}

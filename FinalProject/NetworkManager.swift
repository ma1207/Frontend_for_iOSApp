//
//  NetworkManager.swift
//  FinalProject
//
//  Created by Kaitlyn Ma on 5/6/22.
//

import Alamofire
import Foundation

class NetworkManager {
    static let host = "http://192.168.1.74:5000/"
    
    static func getAllInternships(completion: @escaping ([Internship]) -> Void) {
        let endpoint = "\(host)internships/"
        AF.request(endpoint, method: .get).validate().responseData {response in
                switch (response.result) {
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    if let userResponse = try? jsonDecoder.decode([Internship].self, from: data) {
                        completion(userResponse)
                    } else {
                        print("Failed to decode getAllInternships")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
        print(endpoint)
    }
    
    static func getInternship(id: Int, completion: @escaping (Internship) -> Void) {
        let endpoint = "\(host)internships/\(id)/"
        AF.request(endpoint, method: .get).validate().responseData {response in
                switch (response.result) {
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    if let userResponse = try? jsonDecoder.decode(Internship.self, from: data) {
                        completion(userResponse)
                    } else {
                        print("Failed to decode getSpecificPost")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    static func createInternship(name: String, status: String, date: String, completion: @escaping (Internship) -> Void) {
        let params: [String: String] = [
            "CompanyName" : name,
            "ApplicationStatus" : status,
            "InterviewDate" : date
        ]
        let jsonEncoder = JSONEncoder()
        jsonEncoder.dateEncodingStrategy = .iso8601
        let parameterEncoder = JSONParameterEncoder(encoder: jsonEncoder)
        let endpoint = "\(host)internships/"
        AF.request(endpoint, method: .post, parameters: params, encoder: parameterEncoder).validate().responseData {response in
            switch (response.result) {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601
                if let userResponse = try? jsonDecoder.decode(Internship.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to encode createInternship")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func updateInternship(id: Int, name: String, status: String, date: String, completion: @escaping (Internship) -> Void) {
        let params: [String: String] = [
            "CompanyName" : name,
            "ApplicationStatus" : status,
            "InterviewDate" : date
        ]
        let jsonEncoder = JSONEncoder()
        jsonEncoder.dateEncodingStrategy = .iso8601
        let parameterEncoder = JSONParameterEncoder(encoder: jsonEncoder)
        let endpoint = "\(host)internships/\(id)/"
        AF.request(endpoint, method: .post, parameters: params, encoder: parameterEncoder).validate().responseData {response in
            switch (response.result) {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601
                if let userResponse = try? jsonDecoder.decode(Internship.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to encode updateInternship")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func deleteInternship(id: Int, completion: @escaping (Internship) -> Void) {
        let params: [String: String] = [:
        ]
        let jsonEncoder = JSONEncoder()
        jsonEncoder.dateEncodingStrategy = .iso8601
        let parameterEncoder = JSONParameterEncoder(encoder: jsonEncoder)
        let endpoint = "\(host)internships/\(id)/"
        AF.request(endpoint, method: .delete, parameters: params, encoder: parameterEncoder).validate().responseData {response in
                switch (response.result) {
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    if let userResponse = try? jsonDecoder.decode(Internship.self, from: data) {
                        completion(userResponse)
                    } else {
                        print("Failed to decode deleteInternship")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    
    
}

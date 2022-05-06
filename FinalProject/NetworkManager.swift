//
//  NetworkManager.swift
//  FinalProject
//
//  Created by Kaitlyn Ma on 5/6/22.
//

import Alamofire
import Foundation

class NetworkManager {
    static let host = "http://34.130.144.142/api/"
    
    static let user_id = 1
    
    static func getAllUsers(completion: @escaping ([UserList]) -> Void) {
        let endpoint = "\(host)users/"
        AF.request(endpoint, method: .get).validate().responseData {response in
                switch (response.result) {
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    if let userResponse = try? jsonDecoder.decode([UserList].self, from: data) {
                        completion(userResponse)
                    } else {
                        print("Failed to decode getAllUsers")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
        print(endpoint)
    }
    
    
}

//
//  NetworkManager.swift
//  FitFindCornell
//
//  Created by Cheng Fei on 12/2/22.
//

import Foundation
import Alamofire

class NetworkManager{
    static let host = "http://34.86.84.135"
    
    static func getAllLocations(completion: @escaping ([Location]) -> Void) {
        let endpoint = "\(host)/api/locations/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode([Location].self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllLocations")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getAllFacilities(loccationId: String, completion: @escaping ([Facility]) -> Void) {
        let endpoint = "\(host)/api/locations/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode([Facility].self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllLocations")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func createUser(email: String, password: String,  completion: @escaping (User) -> Void) {
        let endpoint = "\(host)/register/"
        let params : Parameters = [
            "email":email,
            "password":password
        ]
        AF.request(endpoint, method: .post, parameters: params).validate().responseData { response in
            switch response.result{
            case.success(let data):
                let jsondecoder = JSONDecoder()
                if let userResponse = try? jsondecoder.decode(User.self, from: data){
                    completion(userResponse)
                } else{
                    print("Unable to decode user")
                }
                
            case.failure(let error):
                print(error.localizedDescription)
        }
            
        }
        
    }
    
    
}

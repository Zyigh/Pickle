//
//  APIConnexion.swift
//  PicklePOC
//
//  Created by Hugo Medina on 25/04/2019.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation

class APIConnexion {
    static let apiBaseUrl = "http://192.168.1.14:80"
    
    enum Result: String {
        case victory
        case defeat
        case draw
    }
    
    public static func getNewUser(completion: @escaping Network.NetworkCompletion<Codable>) {
        if let u = Utils.user {
            completion(u, nil)
            return
        }
        
        let uri = "/user/new"
        guard let url = URL(string: apiBaseUrl + uri) else {
            completion(nil, .urlFormating(apiBaseUrl + uri))
            return
        }
        
        let network = Network.shared
        network.getContent(urlRequest: URLRequest(url: url), decodable: User.self) {
            user, error in
            
            guard nil == error else {
                print(error!.localizedDescription)
                completion(nil, error)
                return
            }
            
            guard let user = user else {
                completion(nil, .generic("No result with no error"))
                return
            }
            
            Utils.user = user
            completion(user, nil)
        }
    }
    
    //@Todo set as post request with user in body
    public static func getNewMissions(completion: @escaping Network.NetworkCompletion<Codable>) {
        guard let u = Utils.user,
              let userId = u.id else {
            completion(nil, .generic("Current user cannot be found"))
            return
        }
        
        guard u.missions.count - 4 < 1 else {
            completion(u.missions, nil)
            return
        }
        
        let uri = "/\(userId.uuidString)/missions/new/\(u.missions.count)"
        guard let url = URL(string: apiBaseUrl + uri) else {
            completion(nil, .urlFormating(apiBaseUrl + uri))
            return
        }
        
        Network.shared.getContent(urlRequest: URLRequest(url: url), decodable: User.self) {
            user, error in
            
            guard nil == error else {
                print(error!.localizedDescription)
                completion(nil, error)
                return
            }
            
            guard let user = user else {
                completion(nil, .generic("No result with no error"))
                return
            }
            
            Utils.user = user
            completion(user.missions, nil)
        }
    }
    
    public static func getMission(id: UUID, completion: @escaping Network.NetworkCompletion<Codable>) {
        let uri = "/missions/\(id.uuidString)"
        guard let url = URL(string: apiBaseUrl + uri) else {
            completion(nil, .urlFormating(apiBaseUrl + uri))
            return
        }
        
        let network = Network.shared
        network.getContent(urlRequest: URLRequest(url: url), decodable: Mission.self) {
            mission, error in
            
            guard nil == error else {
                print(error!.localizedDescription)
                completion(nil, error)
                return
            }
            
            guard let mission = mission else {
                completion(nil, .generic("No result with no error"))
                return
            }
            
            completion(mission, nil)
        }
    }
    
    public static func finishMission(id: UUID, result: Result, completion: @escaping Network.NetworkCompletion<Codable>) {
        
        guard let u = Utils.user,
            let userId = u.id else {
                completion(nil, .generic("Current user cannot be found"))
                return
        }
        
        let uri = "/\(userId.uuidString)/\(id.uuidString)/\(result.rawValue)"
        guard let url = URL(string: apiBaseUrl + uri) else {
            completion(nil, .urlFormating(apiBaseUrl + uri))
            return
        }
        
        Network.shared.getContent(urlRequest: URLRequest(url: url), decodable: User.self) {
            user, error in
            
            guard nil == error else {
                print(error!.localizedDescription)
                completion(nil, error)
                return
            }
            
            guard let user = user else {
                completion(nil, .generic("No result with no error"))
                return
            }
            
            Utils.user = user
            completion(user.missions, nil)
        }
    }
}

//
//  APIConnexion.swift
//  PicklePOC
//
//  Created by Hugo Medina on 25/04/2019.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation

class ApiConnexion {
    private init(){}
    private static var network = Network(delegate: ApiConnexion())
    static let baseUrl = "http://51.159.28.118:8080"
    private static let defaultUserId = "2DEB7967-0148-48C7-BE5D-191E1F5CD42D"
    
    static func getMissions(_ completion: @escaping (Network.ApiResponse) -> Void) {
        let u = "\(baseUrl)/\(defaultUserId)/missions/new/3"
        print(u)
        guard let url = URL(string: u) else {
            completion(.error(Network.NetworkError.urlFormating(u)))
            return
        }
        
        let request = URLRequest(url: url)
        
        network.get(urlRequest: request, decodable: User.self) {
            response in
            
            completion(response)
        }
    }

    static func createUser(_ user: User, _ completion: @escaping (Network.ApiResponse) -> Void) {
        let u = "\(baseUrl)/user/new"
        guard let url = URL(string: u) else {
            completion(.error(Network.NetworkError.urlFormating(u)))
            return
        }
        
        let request = URLRequest(url: url)
        
        network.get(urlRequest: request, decodable: User.self) {
            response in
            
            completion(response)
        }
    }

}

extension ApiConnexion: NetworkDelegate {
    func getDecoder() -> JSONDecoder {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(format)
        
        return decoder
    }
}

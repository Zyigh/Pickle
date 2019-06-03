//
//  APIConnexion.swift
//  PicklePOC
//
//  Created by Hugo Medina on 25/04/2019.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation

class ApiConnexion {
    // Static class is static
    private init(){}
    
    private static let apiBaseUrl = "http://127.0.0.1:80"
    
    private static func getDecoder() -> JSONDecoder {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(format)
        
        return decoder
    }
    
    static func get<T: Codable>(
        urlRequest: URLRequest,
        decodable: T.Type,
        configuration: URLSessionConfiguration = URLSessionConfiguration.default,
        delegate: URLSessionDelegate? = nil,
        delegateQueue: OperationQueue? = nil,
        completion: @escaping (ApiResponse)->Void
        ) {
        let session = URLSession(configuration: configuration)
        
        send(session: session, with: urlRequest, expecting: decodable) {
            data, error in
            
            if let data = data {
                completion(.success(data))
            } else {
                completion(.error(error ?? NetworkError.generic("error")))
            }
        }
    }
    
    static func post<T: Codable>(
        urlRequest: URLRequest,
        data: T,
        decodable: T.Type,
        configuration: URLSessionConfiguration = URLSessionConfiguration.default,
        delegate: URLSessionDelegate? = nil,
        delegateQueue: OperationQueue? = nil,
        completion: @escaping (ApiResponse)->Void
        ) {
        let session = URLSession(configuration: configuration)
        
        var request = urlRequest
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Application/json", forHTTPHeaderField: "Accept")
        guard let json = try? JSONEncoder().encode(data) else {
            completion(.error(NetworkError.jsonParsingFail))
            return
        }
        request.httpBody = json
        
        send(session: session, with: request, expecting: decodable) {
            data, error in
            
            if let data = data {
                completion(.success(data))
            } else {
                completion(.error(error ?? NetworkError.generic("error")))
            }
        }
    }
    
    private static func send<T: Codable>(session: URLSession, with request: URLRequest, expecting decodable: T.Type, completion: @escaping NetworkCompletion<T>) {
        session.dataTask(with: request) {
            data, response, error in
            
            guard let data = data else {
                completion(nil, .noData)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(nil, .generic("No response received"))
                return
            }
            
            guard response.statusCode < 300 else {
                completion(nil, .http(response.statusCode))
                return
            }
            
            if let d = try? getDecoder().decode(decodable, from: data) {
                completion(d, nil)
            } else {
                completion(nil, .jsonParsingFail)
            }
            }.resume()
    }
}

extension ApiConnexion {
    typealias NetworkCompletion<T> = (T?, NetworkError?)->Void
    
    enum NetworkError : Error {
        case noData
        case jsonParsingFail
        case http(Int)
        case generic(String)
        case urlFormating(String)
        
        var localizedDescription: String {
            switch self {
            case .noData:
                return NSLocalizedString("No data was returned by query", comment: "No Data")
            case .jsonParsingFail:
                return NSLocalizedString("Couldn't parse JSON with Codable provided", comment: "JSON Parsing Error")
            case .http(let code):
                return NSLocalizedString("Invalid HTTP response with code : \(code)", comment: "HTTP error")
            case .generic(let message):
                return NSLocalizedString(message, comment: "Something went wrong")
            case .urlFormating(let url):
                return NSLocalizedString("\(url) is not a valid url", comment: "URL Formatting")
            }
        }
    }
    
    enum ApiResponse {
        case success(Codable)
        case error(Error)
    }
}

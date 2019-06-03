//
//  ConnexionToken.swift
//  PicklePOC
//
//  Created by Hugo Medina on 02/06/2019.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation

class TokenManager {
    struct Token {
        let id: UUID
        let date: Date
    }
    
    let storage = UserDefaults.standard
    let idKey = "PickleTokenId"
    let dateKey = "PickleTokenDate"
    
    func set(from id: UUID? = nil) {
        let id = id ?? UUID()
        let date = Date()
        
        storage.set(id, forKey: idKey)
        storage.set(date, forKey: dateKey)
    }
    
    func get() -> Token? {
        var token : Token? = nil
        if let id = storage.value(forKey: idKey) as? UUID,
           let date = storage.value(forKey: dateKey) as? Date {
            token = Token(id: id, date: date)
        }
        
        return token
    }
}

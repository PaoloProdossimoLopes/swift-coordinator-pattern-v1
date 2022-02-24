//
//  UserModelResponse.swift
//  Coord
//
//  Created by Paolo Prodossimo Lopes on 24/02/22.
//

import Foundation

struct UserModelResponse: Codable {
    
    let id: Int
    let name: String
    let username: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case username = "username"
    }
}

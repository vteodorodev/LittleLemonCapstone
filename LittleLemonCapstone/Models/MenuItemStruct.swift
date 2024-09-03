//
//  MenuItem.swift
//  LittleLemonCapstone
//
//  Created by Vasco Duarte on 02/09/2024.
//

import Foundation

struct MenuItem : Codable {
    
    let id: Int
    let title: String
    let image: String
    let price: String
    let category: String
    let dishDescription: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case image
        case price
        case category
        case dishDescription = "description"
    }
}

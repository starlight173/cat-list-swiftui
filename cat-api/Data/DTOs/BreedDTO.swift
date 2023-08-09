//
//  BreedDTO.swift
//  cat-api
//
//  Created by Quang Luu on 07/08/2023.
//

import Foundation

struct BreedDTO: Decodable {
    let id, name, temperament, description: String
    let energyLevel: Int
    let hairless: Int
    let wikipediaURL: String?
    
    enum CodingKeys: String, CodingKey {
        case temperament, id, name, description, hairless
        case energyLevel = "energy_level"
        case wikipediaURL = "wikipedia_url"
    }
}

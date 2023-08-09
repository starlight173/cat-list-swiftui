//
//  BreedModelToEntityMapper.swift
//  cat-api
//
//  Created by Quang Luu on 08/08/2023.
//

import Foundation

struct BreedModelToEntityMapper: Mapper {
    typealias M = BreedDTO
    typealias E = BreedEntity
    
    func fromEntity(_ entity: BreedEntity) -> BreedDTO {
        return BreedDTO(id: entity.id,
                        name: entity.name,
                        temperament: entity.temperament,
                        description: entity.description,
                        energyLevel: entity.energyLevel,
                        hairless: entity.hairless,
                        wikipediaURL: entity.wikipediaURL
        )
    }
    
    func toEntity(_ model: BreedDTO) -> BreedEntity {
        return BreedEntity(id: model.id,
                           name: model.name,
                           temperament: model.temperament,
                           description: model.description,
                           energyLevel: model.energyLevel,
                           hairless: model.hairless,
                           wikipediaURL: model.wikipediaURL
        )
    }
}

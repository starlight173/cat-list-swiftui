//
//  BreedRepository.swift
//  cat-api
//
//  Created by Quang Luu on 07/08/2023.
//

import Foundation

class BreedRepositoryImp: BreedRepositoryProtocol {
    func fetchBreeds() async throws -> [BreedEntity] {
        let result: [BreedDTO] = try await Network().fetch(url: URL(string: "https://api.thecatapi.com/v1/breeds")!)
        return result.map {BreedModelToEntityMapper().toEntity($0)}
    }
}

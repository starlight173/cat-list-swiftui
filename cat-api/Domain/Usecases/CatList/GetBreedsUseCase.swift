//
//  GetBreedsUseCase.swift
//  cat-api
//
//  Created by Quang Luu on 08/08/2023.
//

import Foundation

class GetBreedsUseCase {
    
    let breedRepository: BreedRepositoryProtocol
    
    init(breedRepository: BreedRepositoryProtocol) {
        self.breedRepository = breedRepository
    }
    
    func call() async throws -> [BreedEntity] {
        return try await breedRepository.fetchBreeds()
    }
}

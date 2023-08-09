//
//  BreedRepository.swift
//  cat-api
//
//  Created by Quang Luu on 08/08/2023.
//

import Foundation

protocol BreedRepositoryProtocol {
    func fetchBreeds() async throws -> [BreedEntity]
}

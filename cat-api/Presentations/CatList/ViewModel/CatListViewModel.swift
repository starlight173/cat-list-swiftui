//
//  CatListViewModel.swift
//  cat-api
//
//  Created by Quang Luu on 07/08/2023.
//

import Foundation
import Combine

@MainActor
class CatListViewModel: ObservableObject {
    @Published
    var breeds = [BreedEntity]()
    
    @Published
    var filteredBreeds = [BreedEntity]()
    
    @Published
    var isLoading: Bool = false
    
    @Published
    var errorMessage: String?
    
    @Published
    var searchText = ""
    
    @Published
    var searchIsActive = false
    
    var fetBreedsUseCase = GetBreedsUseCase(breedRepository: BreedRepositoryImp())
    
    init() {
        Task {
            do {
                isLoading = true
                breeds = try await fetBreedsUseCase.call()
                filteredBreeds = breeds
                isLoading = false
            } catch {
                isLoading = false
                print(error.localizedDescription)
                errorMessage = error.localizedDescription
            }
        }
    }
    
    func filterBreeds() {
        guard !searchText.isEmpty else {
            filteredBreeds = breeds
            return
        }
        filteredBreeds = breeds.filter { $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.description.localizedCaseInsensitiveContains(searchText) }
    }
}

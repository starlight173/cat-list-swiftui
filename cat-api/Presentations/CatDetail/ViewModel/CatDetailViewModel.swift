//
//  CatDetailViewModel.swift
//  cat-api
//
//  Created by Quang Luu on 08/08/2023.
//

import Foundation
import Combine

@MainActor
class CatDetailViewModel: ObservableObject {
    @Published
    var breed: BreedEntity
    
    init(breed: BreedEntity) {
        self.breed = breed
    }
}



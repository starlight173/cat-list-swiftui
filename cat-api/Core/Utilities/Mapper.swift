//
//  Mapper.swift
//  cat-api
//
//  Created by Quang Luu on 08/08/2023.
//

import Foundation

/// An abstract class to convert a type of M to E type and vice versa
protocol Mapper {
    associatedtype M
    associatedtype E
    
    func fromEntity(_ entity: E) -> M
    func toEntity(_ model: M) -> E
}

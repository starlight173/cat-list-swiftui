//
//  Binding+.swift
//  cat-api
//
//  Created by Quang Luu on 08/08/2023.
//

import SwiftUI

extension Binding {
    func isNotNil<T>() -> Binding<Bool> where Value == T? {
        .init(get: {
            wrappedValue != nil
        }, set: { _ in
            wrappedValue = nil
        })
    }
}

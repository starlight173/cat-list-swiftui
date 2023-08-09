//
//  Network.swift
//  cat-api
//
//  Created by Quang Luu on 08/08/2023.
//

import Foundation

class Network {
    func fetch<T:Decodable>(url: URL?) async throws -> T {
        guard let url = url else {
            throw NSError()
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        do {
            guard
                let response = response as? HTTPURLResponse,
                200...299 ~= response.statusCode
            else {
                throw URLError(.badServerResponse)
            }
            
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            print("data: \(String(data: data, encoding: .utf8) ?? "cannot represent as string")")
            print("response: \(String(describing: response))")
            print(error)
            throw error
        }
    }
}

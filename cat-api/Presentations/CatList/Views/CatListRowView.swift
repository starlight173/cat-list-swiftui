//
//  CatListRowView.swift
//  cat-api
//
//  Created by Quang Luu on 08/08/2023.
//

import SwiftUI

struct CatListRowView: View {
    @Binding
    var breed: BreedEntity
    
    var body: some View {
        HStack {
            if let imageURL = breed.wikipediaURL {
                AsyncImage(url: URL(string: imageURL)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                    } else if phase.error != nil {
                        Color.red
                            .frame(width: 100, height: 100)
                    } else {
                        ProgressView()
                            .frame(width: 100, height: 100)
                    }
                }
            } else {
                Color.gray
                    .frame(width: 100, height: 100)
            }
            
            VStack(alignment: .leading) {
                Text(breed.name)
                    .font(.headline)
                Text(breed.temperament)
            }
        }
        .contentShape(Rectangle())
    }
}

struct CatListRowView_Previews: PreviewProvider {
    struct Container: View {
        @State
        var breed = BreedEntity(id: "aaa", name: "aaa", temperament: "aaa", description: "aaa", energyLevel: 1, hairless: 1, wikipediaURL: nil)
        
        var body: some View {
            List {
                CatListRowView(breed: $breed)
            }
            .listStyle(.plain)
        }
    }
    
    
    static var previews: some View {
        NavigationView {
            Container()
                .navigationTitle("Reminders")
        }
    }
}

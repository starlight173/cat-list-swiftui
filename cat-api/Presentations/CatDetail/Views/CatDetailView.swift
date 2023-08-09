//
//  CatDetailView.swift
//  cat-api
//
//  Created by Quang Luu on 08/08/2023.
//

import SwiftUI

struct CatDetailView: View {
    @StateObject
    var viewModel: CatDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack{
                if let imageURL = viewModel.breed.wikipediaURL {
                    AsyncImage(url: URL(string: imageURL)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 300)
                                .clipped()
                        } else if phase.error != nil {
                            Color.red
                                .frame(width: 300, height: 300)
                        } else {
                            ProgressView()
                                .frame(width: 300, height: 300)
                        }
                    }
                } else {
                    Color.gray
                        .frame(width: 300, height: 300)
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text(viewModel.breed.name)
                        .font(.headline)
                    Text(viewModel.breed.temperament)
                        .font(.footnote)
                    Text(viewModel.breed.description)
                    
                    if viewModel.breed.hairless == 1 {
                        Text("Hair less")
                    }
                    
                    HStack {
                        Text("Energy Level")
                        Spacer()
                        ForEach(1..<6) { id in
                            Image(systemName: "star.fill")
                                .foregroundColor(viewModel.breed.energyLevel > id ? Color.accentColor : Color.gray)
                        }
                    }
                    Spacer()
                }
            }
            .padding(15)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        CatDetailView(viewModel: CatDetailViewModel(breed: BreedEntity(id: "aaa", name: "aaa", temperament: "aaa", description: "aaa", energyLevel: 1, hairless: 1, wikipediaURL: nil)))
    }
}

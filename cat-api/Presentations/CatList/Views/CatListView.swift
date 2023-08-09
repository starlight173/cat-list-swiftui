//
//  CatListView.swift
//  cat-api
//
//  Created by Quang Luu on 07/08/2023.
//

import SwiftUI

struct CatListView: View {
    @StateObject
    private var viewModel = CatListViewModel()
    
    @State
    private var isErrorDialogPresented = false
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView()
            } else {
                // If no need to update the item in breed
                // No need to use biding
                // Can do like this
                /*
                 List(viewModel.filteredBreeds, id: \.self) { breed in
                     NavigationLink(destination: CatDetailView(viewModel: CatDetailViewModel(breed: breed))) {
                         CatListRowView(breed: breed)
                     }
                 }
                 */
                List($viewModel.filteredBreeds, id: \.self) { $breed in
                    NavigationLink(destination: CatDetailView(viewModel: CatDetailViewModel(breed: breed))) {
                        CatListRowView(breed: $breed)
                    }
                }
                .navigationTitle("Find Your Perfect Cat")
                .listStyle(.plain)
                .searchable(text: $viewModel.searchText, prompt: "Enter something to search")
                .onChange(of: viewModel.searchText) { _ in
                    viewModel.filterBreeds()
                }
                .onSubmit(of: .search) {
                    viewModel.filterBreeds()
                }
                .alert(isPresented: $viewModel.errorMessage.isNotNil()) {
                    Alert(title: Text("Error"), message: Text(viewModel.errorMessage ?? ""), dismissButton: .default(Text("OK")))
                }
            }
        }
        
    }
}

struct CatListView_Previews: PreviewProvider {
    static var previews: some View {
        CatListView()
    }
}

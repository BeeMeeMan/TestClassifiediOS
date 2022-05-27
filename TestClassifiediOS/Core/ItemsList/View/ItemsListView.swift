//
//  ContentView.swift
//  TestClassifiediOS
//
//  Created by Korsun Yevhenii on 26.05.2022.
//

import SwiftUI

struct ItemsListView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.downloadState {
                case .notLoadedYet, .loading:  List { ProgressView() }.task { await viewModel.loadData() }
                case .results(let results): makeListView(with: results)
                case .failedToLoad: reloadButtom
                }
            }
            .navigationTitle("Items list")
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsListView()
    }
}

extension ItemsListView {
    var reloadButtom: some View {
        Button {
            viewModel.downloadState = .notLoadedYet
        } label: {
            Text("Failed to load data, push to reload").font(.largeTitle.bold())
        }
    }
    
    func makeListView(with results: [Result]) -> some View {
        List(results, id: \.uid) { item in
            VStack(alignment: .leading) {
                NavigationLink(item.name.capitalizingFirstLetter(), destination: ItemDetailView(result: item))
                    .font(.headline)
            }
        }
    }
}


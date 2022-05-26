//
//  ContentView-ViewModel.swift
//  TestClassifiediOS
//
//  Created by Korsun Yevhenii on 26.05.2022.
//

import SwiftUI

extension ItemsListView {
    @MainActor class ViewModel: ObservableObject {
        enum DownloadState {
          case notLoadedYet
          case loading
          case failedToLoad
          case results([Result])
        }
    
        @Published var downloadState: DownloadState = .notLoadedYet
        
        let urlString = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer"
        
        func loadData() async {
            downloadState = .loading
            guard let url = URL(string: urlString) else {
                print("Invalid URL")
                downloadState = .failedToLoad
                return
            }
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                    print("The server responded with an error.")
                    downloadState = .failedToLoad
                    return
                }
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    downloadState = .results(decodedResponse.results)
                }
            } catch {
                print("Invalid data")
                downloadState = .failedToLoad
            }
        }
    }
}

//
//  DetailView.swift
//  TestClassifiediOS
//
//  Created by Korsun Yevhenii on 26.05.2022.
//

import SwiftUI

struct ItemDetailView: View {
    @StateObject private var viewModel = ViewModel()
    let result: Result
    
    var body: some View {
        VStack {
            headerView
            
            imagesScrollView
            
            buyButton
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(result: Result(creationTime: "",
                                      price: "200",
                                      name: "Item",
                                      uid: "",
                                      imageIds: [],
                                      imageUrls: [],
                                      imageUrlsThumbnails: []))
    }
}

extension ItemDetailView {
    var headerView: some View {
        HStack() {
            VStack(alignment: .leading) {
                Text(result.name.capitalizingFirstLetter())
                    .font(.title2)
                    .padding([.top, .horizontal])
                Text(result.creationTime)
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
            }
            Spacer()
        }
    }
    
    var imagesScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(result.imageUrlsThumbnails, id: \.self) { url in
                    AsyncImage(url: URL(string: url)) { image in
                        image.resizable()
                            .scaledToFit()
                            .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y: 0)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: Constants.Size.imageSize)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                }
            }
        }
        .frame(width: Constants.Size.imageSize)
    }
    
    var buyButton: some View {
        Button {
            print("buy item")
        } label: {
            Text("Buy for \(result.price)")
                .foregroundColor(.white)
                .padding()
        }
        .background(.blue.opacity(0.4))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y: 0)
    }
}

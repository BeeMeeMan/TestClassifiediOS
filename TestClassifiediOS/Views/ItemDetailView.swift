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
        GeometryReader { proxy in
            let size = proxy.size
            VStack {
                HStack() {
                    VStack(alignment: .leading) {
                        Text(result.name.capitalizingFirstLetter())
                            .font(.largeTitle)
                            .padding([.top, .horizontal])
                        Text(result.creationTime)
                            .font(.caption2)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                    }
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 20) {
                        ForEach(result.imageUrlsThumbnails, id: \.self) { url in
                            AsyncImage(url: URL(string: url)) { image in
                                image.resizable()
                                    .scaledToFit()
                                    .shadow(color: .black, radius: 4, x: 4, y: 4)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: size.width * 0.8)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                        }
                    }
                }
                .frame(width: size.width * 0.8)
                
                Button {
                    print("buy item")
                } label: {
                    Text("Buy for \(result.price)")
                        .foregroundColor(.white)
                        .padding()
                }
                .background(.blue.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: .black, radius: 4, x: 4, y: 4)
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(result: Result(creationTime: "", price: "200", name: "Item", uid: "", imageIds: [], imageUrls: [], imageUrlsThumbnails: []))
    }
}

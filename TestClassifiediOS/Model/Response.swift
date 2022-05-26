//
//  Response.swift
//  TestClassifiediOS
//
//  Created by Korsun Yevhenii on 26.05.2022.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    enum CodingKeys: String, CodingKey {
      case creationTime = "created_at"
      case imageIds = "image_ids"
      case imageUrls = "image_urls"
      case imageUrlsThumbnails = "image_urls_thumbnails"
      case price, name, uid
    }
    
    var creationTime: String
    var price: String
    var name: String
    var uid: String
    var imageIds: [String]
    var imageUrls: [String]
    var imageUrlsThumbnails: [String]
}

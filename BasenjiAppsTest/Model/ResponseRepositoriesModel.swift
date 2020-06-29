//
//  UserRepoModel.swift
//  BasenjiAppsTest
//
//  Created by Andrew Vashulenko on 28.06.2020.
//  Copyright © 2020 AVTeam. All rights reserved.
//

import Foundation

struct ResponseRepositoriesModel: Decodable {
  
    let items: [Item]

    enum CodingKeys: String, CodingKey {
      
        case items = "items"
    }
}

// MARK: - Item

struct Item: Decodable {
  
  let name: String
  let fullName: String
  let owner: Owner
  let htmlURL: String
  let itemDescription: String?
  let updatedAt: String
  let starzCount: Int
  let language: String?
  
  enum CodingKeys: String, CodingKey {
    
    case name = "name"
    case fullName = "full_name"
    case owner
    case htmlURL = "html_url"
    case itemDescription = "description"
    case updatedAt = "updated_at"
    case starzCount = "stargazers_count"
    case language = "language"
    
  }
}

// MARK: - Owner

struct Owner: Decodable {
  
    let avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
    }
}

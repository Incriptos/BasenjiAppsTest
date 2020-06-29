//
//  UserRepoModel.swift
//  BasenjiAppsTest
//
//  Created by Andrew Vashulenko on 28.06.2020.
//  Copyright © 2020 AVTeam. All rights reserved.
//

import Foundation

class ResponseRepositoriesModel: Decodable {
  
  let items: [Item]
  
  enum CodingKeys: String, CodingKey {
    case items = "items"
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.items = try container.decode([Item].self, forKey: .items)
  }
}

// MARK: - Item

class Item: Decodable {
  
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
  
  required init(from decoder: Decoder) throws {
    
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.name = try container.decode(String.self, forKey: .name)
    self.fullName = try container.decode(String.self, forKey: .fullName)
    self.owner = try container.decode(Owner.self, forKey: .owner)
    self.htmlURL = try container.decode(String.self, forKey: .htmlURL)
    self.itemDescription = try container.decodeIfPresent(String.self, forKey: .itemDescription)
    self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
    self.starzCount = try container.decode(Int.self, forKey: .starzCount)
    self.language = try container.decodeIfPresent(String.self, forKey: .language)
  }
  
}

// MARK: - Owner

class Owner: Decodable {
  
  let avatarURL: String?
  
  enum CodingKeys: String, CodingKey {
    case avatarURL = "avatar_url"
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.avatarURL = try container.decodeIfPresent(String.self, forKey: .avatarURL)
  }
}

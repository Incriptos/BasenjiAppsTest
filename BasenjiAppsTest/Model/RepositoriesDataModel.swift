//
//  RepositoriesDataModel.swift
//  BasenjiAppsTest
//
//  Created by Andrew Vashulenko on 29.06.2020.
//  Copyright © 2020 AVTeam. All rights reserved.
//

import Foundation

class RepositoriesDataModel {
  
  let avatar: String
  let name: String
  let fullName: String
  let htmlURL: String
  let itemDescription: String?
  let updatedAt: String
  let starzCount: Int
  let language: String?
  
  required init(avatar: String, name: String, fullName: String, htmlURL: String, itemDescription: String, updatedAt: String, starzCount: Int, language: String) {
    
    self.avatar = avatar
    self.name = name
    self.fullName = fullName
    self.htmlURL = htmlURL
    self.itemDescription = itemDescription
    self.starzCount = starzCount
    self.updatedAt = updatedAt
    self.language = language
  }
  
}

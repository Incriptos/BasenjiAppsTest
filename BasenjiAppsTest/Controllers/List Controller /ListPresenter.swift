//
//  ListPresenter.swift
//  BasenjiAppsTest
//
//  Created by Andrew Vashulenko on 29.06.2020.
//  Copyright © 2020 AVTeam. All rights reserved.
//

import Foundation
import CoreData

protocol ListPresenterDelegate: class {
  
  func updateUI()
  func showError()
  
}

class ListPresenter {
  
  //MARK: Delegate
  
  weak var delegate: ListPresenterDelegate?
  
  var repos = [Item]()
  var sortedRepos = [Item]()
  
  //MARK: - GET Repos
  
  func getSearchByName(repoName: String) {
    
    NetworkService.shared.fetchSearchResult(searchText: repoName) { [weak self] response in
      self?.repos.removeAll()
      self?.repos = response?.items ?? []
      
      
      
      self?.sortByStars()
      self?.delegate?.updateUI()
    }
  }
  
  func sortByStars() {
    sortedRepos.removeAll()
    sortedRepos = self.repos.sorted {$0.starzCount > $1.starzCount}
  }
  
  
  
}


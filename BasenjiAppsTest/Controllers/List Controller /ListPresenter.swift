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
  
  var repos: [RepositoriesDataModel] = []
  var sortedRepos: [RepositoriesDataModel] = []
  
  //MARK: - GET Repos
  
  func getSearchByName(repoName: String) {
    
    NetworkService.shared.fetchSearchResult(searchText: repoName, onSuccess: { [weak self] response in
      guard let `self` = self else { return }
      
      let model = response as! ResponseRepositoriesModel
      
      self.fillInArray(model: model) { status in
        
        switch status {
      
        case .Success:
          self.delegate?.updateUI()
        case .Failure:
          self.delegate?.showError()
        }
      }
      
      
    }) { errors in
      
      self.delegate?.showError()
      
    }
    
    
  }

  
  private func fillInArray(model: ResponseRepositoriesModel, completion: @escaping statusCompletion) {
    repos.removeAll()
    for object in model.items {
      let model = RepositoriesDataModel(avatar: object.owner.avatarURL ?? "", name: object.name, fullName: object.fullName, htmlURL: object.htmlURL, itemDescription: object.itemDescription
        ?? "Описание отсуцтвует", updatedAt: object.updatedAt, starzCount: object.starzCount, language: object.language ?? "Неизвестно")
      repos.append(model)
    }
    sortedRepos.removeAll()
    sortedRepos = self.repos.sorted {$0.starzCount > $1.starzCount}
    completion(.Success)
  }
}


//
//
//guard let `self` = self else { return }
//self.repos.removeAll()
//self.repos = response?.items ?? []
//self.sortByStars()
//self.delegate?.updateUI()

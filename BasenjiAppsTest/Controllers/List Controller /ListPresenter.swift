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
  
  private let persistenceManager = PersistenceManager.shared
  private let networkManager =  NetworkService.shared
  
  //MARK: Delegate
  
  weak var delegate: ListPresenterDelegate?
  
  //MARK: - ReposArray
  
  var repos: [RepositoriesDataModel] = []
  var coreRepos = [Repositories]()
  var sortedCoreRepos = [Repositories]()
  
  //MARK: - GET Repos
  
  func getSearchByName(repoName: String) {
    
    networkManager.fetchSearchResult(searchText: repoName, onSuccess: { [weak self] response in
      
      guard let `self` = self else { return }
      let model = response as! ResponseRepositoriesModel
      
      self.fillInArray(model: model) { status in
        
        switch status {
      
        case .Success:
          self.fetchDataFromCoreData()
          self.delegate?.updateUI()
        case .Failure:
          self.delegate?.showError()
        }
      }
      
    }) { errors in
      
      self.delegate?.showError()
      
    }
  }
  
  //MARK: - FillArray's and  Save to CoreData
  
  private func fillInArray(model: ResponseRepositoriesModel, completion: @escaping statusCompletion) {
    
    repos.removeAll()
    self.clearCoreData()
    
    for object in model.items {
      // NEED Refactoring 
      let model = RepositoriesDataModel(avatar: object.owner.avatarURL ?? "userAvatar", name: object.name, fullName: object.fullName, htmlURL: object.htmlURL, itemDescription: object.itemDescription
        ?? "Описание отсуцтвует", updatedAt: object.updatedAt, starzCount: object.starzCount, language: object.language ?? "Неизвестно")
      repos.append(model)
      
      let coreObject = Repositories(context: self.persistenceManager.context)
      coreObject.avatar = model.avatar
      coreObject.name = model.name
      coreObject.fullName = model.fullName
      coreObject.descript = model.itemDescription ?? "Описание отсуцтвует"
      coreObject.url = model.htmlURL
      coreObject.languege = model.language ?? "Неизвестно"
      coreObject.starz = Int64(model.starzCount)
      coreObject.updateAt = model.updatedAt
      self.persistenceManager.save()
    }
    
    completion(.Success)
  }
  
  func fetchDataFromCoreData() {
    
    persistenceManager.fetchData(Repositories.self) { [weak self] (repos) in
      self?.coreRepos = repos
      self?.sortedCoreRepos = self?.coreRepos.sorted {$0.starz > $1.starz} as! [Repositories]
      self?.delegate?.updateUI()
    }
  }
  
  func clearCoreData() {
    let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: "Repositories"))
    do {
      try persistenceManager.context.execute(DelAllReqVar)
      print("All Data deleted")
    } catch {
      print(error)
    }
  }
}



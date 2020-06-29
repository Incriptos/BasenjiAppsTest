//
//  NetworkService.swift
//  BasenjiAppsTest
//
//  Created by Andrew Vashulenko on 28.06.2020.
//  Copyright © 2020 AVTeam. All rights reserved.
//

import UIKit
import Alamofire


final class NetworkService {
  
  static let shared = NetworkService()
  
  init() { }
    
  let baseURL = "https://api.github.com/search/repositories"
  
  func fetchSearchResult(searchText: String, competion: @escaping (ResponseRepositoriesModel?) -> Void) {
    
    let params = ["q": "\(searchText)"]
    
    AF.request(baseURL, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseData { response in
      
      if let error = response.error {
        
        print("error req data \(error.localizedDescription)")
        competion(nil)
        return
      }
      
      guard let data = response.data else { return }
      
      let decoder = JSONDecoder()
    
      do {
        
        let objects = try decoder.decode(ResponseRepositoriesModel.self, from: data)
        competion(objects)
        
      } catch let jsonError {
        
        print("Faild to decode JSON", jsonError)
        competion(nil)
        
      }
    }
  }
  
}



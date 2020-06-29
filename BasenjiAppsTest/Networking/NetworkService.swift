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
  
  typealias onSuccessCompletion = (decodableModel) -> ()
  typealias onFailureCompletion = (Error) -> ()
   typealias decodableModel = Decodable
  
  static let shared = NetworkService()
  
  init() { }
    
  private let baseURL = "https://api.github.com/search/repositories"
  
  func fetchSearchResult(searchText: String, onSuccess: @escaping onSuccessCompletion, onFailure: @escaping onFailureCompletion) {
    
    let params = ["q": "\(searchText)"]
    
    AF.request(baseURL, method: .get, parameters: params, encoding: URLEncoding.default).responseData { response in
    
      guard let data = response.data else {
        onFailure(Error.self as! Error)
        return
      }
            
      //MARK: - Decode response
      let decoder = MyDecoder(data: data)
      
      switch decoder.decode(model: ResponseRepositoriesModel.self) {
        
      case .success(let responseModel):
      
        onSuccess(responseModel)
      
      case .failure(let error):
        onFailure(error)
      }
    }
  }
  
}



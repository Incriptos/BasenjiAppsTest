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
  typealias onFailureCompletion = (Errors) -> ()
   typealias decodableModel = Decodable
  
  static let shared = NetworkService()
  
  init() { }
    
  private let baseURL = "https://api.github.com/search/repositories"
  
  func fetchSearchResult<D: Decodable>(searchText: String, resModel: D.Type, onSuccess: @escaping onSuccessCompletion, onError: @escaping onFailureCompletion) {
    
    let params = ["q": "\(searchText)"]
    
    AF.request(baseURL, method: .get, parameters: params, encoding: URLEncoding.default).responseData { response in
    
      guard let data = response.data else {
        print(Errors.cantGetData.log)
        onError(.cantGetData)
        return
      }
            
      //MARK: - Decode response
      let decoder = MyDecoder(data: data)
      
      switch decoder.decode(model: resModel) {
        
      case .success(let responseModel):
      
        onSuccess(responseModel)
      
      case .failure(let error):
        
        print(error.log)
        onError(error)
      }
    }
  }
  
}



//
//  Decoder.swift
//  BasenjiAppsTest
//
//  Created by Andrew Vashulenko on 29.06.2020.
//  Copyright © 2020 AVTeam. All rights reserved.
//

import Foundation


class MyDecoder: JSONDecoder {
  
  //MARK: - Data
  
  private var data: Data

  required init(data: Data) {
    self.data = data
  }
  
  //MARK: - Decode
  
  func decode<T: Decodable>(model: T.Type) -> Result<T, Error> {
    do {
      let resModel = try self.decode(model, from: data)
      return .success(resModel)
    } catch let error {
      return .failure(error)
    }
  }
  
}

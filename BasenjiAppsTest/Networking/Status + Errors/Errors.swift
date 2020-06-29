//
//  Errors.swift
//  BasenjiAppsTest
//
//  Created by Andrew Vashulenko on 29.06.2020.
//  Copyright © 2020 AVTeam. All rights reserved.
//

import Foundation

enum Errors: String, Error {
  
  case error = "Ошибка"
  
  case notConnectToNetwork = "Нет подключения к интернету"
  case unknownErrorInspectConnectToNetwork = "Неизвестная ошибка при проверке подключения к интернету"

  case badStatusCode = "Статус код не соответствует - (200,400)"

  case requestError = "Ошибка запроса"
  
  case decodeResponseError = "Ошибка декодирования модели"
  
  //
  case badUrl = "Ошибка в url"
  case cantGetStatusCode = "Невозможно получить статус код"
  case cantGetData = "Невозможно получить Data"
  
  
  var log: String {
    switch self {
    case _:
      return "ERROR HANDLER - \(self.rawValue)"
    }
  }
}


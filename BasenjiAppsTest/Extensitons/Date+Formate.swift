//
//  Date+Formate.swift
//  BasenjiAppsTest
//
//  Created by Andrew Vashulenko on 29.06.2020.
//  Copyright © 2020 AVTeam. All rights reserved.
//

import Foundation


extension Date {
  
  func string(format: String) -> String {
      let formatter = DateFormatter()
      formatter.dateFormat = "dd-MM-yyyy"
      return formatter.string(from: self)
  }
  
}

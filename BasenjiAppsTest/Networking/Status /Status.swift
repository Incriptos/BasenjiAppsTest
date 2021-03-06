//
//  Status.swift
//  BasenjiAppsTest
//
//  Created by Andrew Vashulenko on 29.06.2020.
//  Copyright © 2020 AVTeam. All rights reserved.
//


import Foundation

enum Status: String {
  case Success = "Success"
  case Failure = "Failure"
}

typealias statusCompletion = (Status) -> ()

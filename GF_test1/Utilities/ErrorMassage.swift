//
//  ErrorMassage.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 2/16/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    
    case invalidUrl = "The username is invalid, please enter a valid username"
    case invalidRequest = "Invalid request, please try again"
    case invalidResponse = "Server response is invalid, please try again"
    case invalidData = "The data received from server was invalid, please try again"
    case noFollowers = "This user doesn't have any follower, go and follow 😇"
  
}


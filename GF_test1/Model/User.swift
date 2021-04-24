//
//  User.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 2/15/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import Foundation

struct User: Codable, Hashable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio:String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
    
}

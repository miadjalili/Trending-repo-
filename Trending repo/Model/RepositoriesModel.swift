//
//  RepositoriesModel.swift
//  Trending repo
//
//  Created by Miad Jalili on 2024-04-22.
//

import Foundation

struct RepositoriesModel: Codable {
    let Repositories: [RepositorieModel]

    enum CodingKeys: String, CodingKey {
        case Repositories = "items"
    }
}


struct RepositorieModel: Codable, Hashable{
    let id: Int
    let nodeID, name, fullName: String
    let owner: Owner?
    let description: String?

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case owner
        case description
      
    }
}

struct Owner: Codable, Hashable {
    let avatarURL: String?
    
    
    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
    }
}

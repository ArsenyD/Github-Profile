//
//  Config.swift
//  Github Profile
//
//  Created by Арсений Дунаев on 20.10.2023.
//

import Foundation

struct GitHubUser: Codable {
    let login: String
    let avatarUrl: String
    let name: String?
    let location: String?
    let bio: String?
    let followers: Int
    let following: Int
}

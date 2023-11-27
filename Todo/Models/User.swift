//
//  User.swift
//  Todo
//
//  Created by DucDo on 06/08/2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let password: String
    let joined: TimeInterval
}

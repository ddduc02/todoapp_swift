//
//  Task.swift
//  Todo
//
//  Created by DucDo on 06/08/2023.
//

import Foundation

struct Task : Codable, Identifiable {
    let id : String
    let title : String
    let dueDate : TimeInterval
    let createdData : TimeInterval
    var isDone : Bool
    mutating func setDone(state: Bool) {
        isDone = state
    }
}

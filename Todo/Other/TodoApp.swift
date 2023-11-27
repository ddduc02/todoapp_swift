//
//  TodoApp.swift
//  Todo
//
//  Created by DucDo on 04/08/2023.
//

import SwiftUI
import FirebaseCore

@main
struct TodoApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

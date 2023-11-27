//
//  TodoListViewViewModel.swift
//  Todo
//
//  Created by DucDo on 06/08/2023.
//

import Foundation
import FirebaseFirestore

class TodoListViewViewModel : ObservableObject {
    @Published var showingNewItemView = false
    private let userId : String
    
    init(userId : String) {
        self.userId = userId
    }
    
    func delete(id : String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}

//
//  TodoListItemViewViewModel.swift
//  Todo
//
//  Created by DucDo on 06/08/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TaskViewViewModel : ObservableObject {
    
    func toggleIsDone(item : Task) {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        var itemCopy = item
        itemCopy.setDone(state: !item.isDone)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(item.id)
            .setData(itemCopy.asDictionary())
    }
    
    
    init() {}
}

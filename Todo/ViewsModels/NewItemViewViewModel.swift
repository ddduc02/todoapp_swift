//
//  NewItemViewViewModel.swift
//  Todo
//
//  Created by DucDo on 06/08/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class NewItemViewViewModel : ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    func save() {
        guard canSave() else {
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let uuid = UUID().uuidString
        let task = Task(id: uuid, title: title, dueDate: dueDate.timeIntervalSince1970, createdData: Date().timeIntervalSinceNow, isDone: false)
        print("check ok here")
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(uuid)
            .setData(task.asDictionary())
        
    }
    
    func canSave() -> Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate > Date() else {
            return false
        }
        return true
    }
    init() {}
}

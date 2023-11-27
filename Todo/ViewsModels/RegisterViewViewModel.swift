//
//  RegisterViewViewModel.swift
//  Todo
//
//  Created by DucDo on 06/08/2023.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
    }
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
                    
        }
        
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, password: password, joined: Date.timeIntervalBetween1970AndReferenceDate)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please enter some texts"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid message"
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
    
}

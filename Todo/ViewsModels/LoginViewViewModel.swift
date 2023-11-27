//
//  LoginViewViewModel.swift
//  Todo
//
//  Created by DucDo on 06/08/2023.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
    }
    
    func login() {
        print("check in login func")
        guard validate() else {
            errorMessage = "Incorrect email or password!"
            return
        }
        do {
            try Auth.auth().signIn(withEmail: email, password: password)
        } catch {
            print("khong the dang nhap")
        }
        
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty || !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            print("de trong")
            errorMessage = "Please enter some texts"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            print("thieu @")
            errorMessage = "Please enter valid message"
            return false
        }
        return true
    }
    
}

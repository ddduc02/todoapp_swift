//
//  LoginView.swift
//  Todo
//
//  Created by DucDo on 06/08/2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer(minLength: 30)
                HeaderView(title: "To Do List", subtitle: "Get things done", background: .red, angle: 15)
                
                // login form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    CButton(lable: "Login", background: .blue, action: {
                        viewModel.login()
                    }).padding(.bottom,20)
                }
                
                VStack {
                    Text("Dont have account yet?")
                    NavigationLink("Create new account here", destination: RegisterView())
                }
                .padding(.bottom, 100)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

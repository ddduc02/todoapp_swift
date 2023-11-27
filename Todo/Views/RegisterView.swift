//
//  RegisterView.swift
//  Todo
//
//  Created by DucDo on 06/08/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Create new account", background: .red, angle: -15)
            
            Form {
                TextField("Fullname", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                TextField("Email address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                CButton(lable: "Create account", background: .blue, action: {
                    viewModel.register()
                    print("Check register clicked")
                })
                .padding(.bottom,20)
            }
            
            Spacer()
        }
        
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()

    }
}

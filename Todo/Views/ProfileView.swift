//
//  ProfileView.swift
//  Todo
//
//  Created by DucDo on 06/08/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 125, height: 125)
                    .padding()
                
                HStack {
                    Text("Name: ")
                        .bold()
                    Text(viewModel.user?.name ?? "No name showed")
                }
                
                HStack {
                    Text("Email: ")
                        .bold()
                    Text(viewModel.user?.email ?? "No email showed")
                }
                .padding()
                
                Button("Log out") {
                    print("log out")
                    viewModel.logOut()
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Profile")
        }
        .onAppear() {
            viewModel.fetchUser()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

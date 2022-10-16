//
//  LoginScreen.swift
//  SwiftUI_Sample
//
//  Created by Krunal Mistry on 10/16/22.
//

import SwiftUI

struct LoginScreen: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var loginSuccess: Bool = false
    @State var isPasswordFound: Bool = false
    @ObservedObject var viewModel = AlbumViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, User!")
                Form {
                    HStack{
                        TextField("Username", text: $username)
                        Button {
                            let pw = viewModel.getStoredPassword(userName: username)
                            if !pw.isEmpty {
                                password = pw
                                isPasswordFound = true
                            }
                        } label: {
                            if isPasswordFound {
                                Image(systemName: "lock.open.fill")
                            } else {
                                Image(systemName: "lock.fill")
                            }
                        }
                    }

                    TextField("Password", text: $password)

                    if isPasswordFound {
                        Button("Login") {
                            loginSuccess = true
                        }
                    } else {
                        Button("Signup") {
                            // method to check password in keychain will be called here
                            viewModel.signUpWith(userName: username, password: password) { success in
                                if success {
                                    loginSuccess = true
                                }
                            }
                        }
                    }

                    VStack {
                        if isPasswordFound {
                            Text("Password found for this username, you can login")
                        } else {
                            Text("You might not have created account, enter username and check.")
                        }
                    }
                    .padding()
                }

                NavigationLink(destination: AlbumScreen(), isActive: $loginSuccess) {
                    EmptyView()
                        .hidden()
                }
            }
        }
        .navigationTitle("Login Screen")
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

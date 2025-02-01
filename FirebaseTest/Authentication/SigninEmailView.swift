//
//  SigninEmailView.swift
//  FirebaseTest
//
//  Created by 최범수 on 2025-02-01.
//

import SwiftUI

@MainActor
final class SigninEmailViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No Email or Password found")
            return
        }
        
        Task {
            do {
                let returnedUserDatta = try await AuthenticationManager.shared.createUser(email: email, passwd: password)
                print("Success")
                print(returnedUserDatta)
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    
    
}

struct SigninEmailView: View {
    
    @StateObject private var viewModel = SigninEmailViewModel()
    
    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .background(Color.gray.opacity(0.2))
                .padding(.bottom)
            SecureField("Password", text: $viewModel.password)
                .font(.caption)
            Button("Sign in") {
                viewModel.signIn()
            }
        }
        .padding()
        .navigationTitle("Sign in with Email")
    }
}

#Preview {
    SigninEmailView()
}

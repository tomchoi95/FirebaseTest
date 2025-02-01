//
//  AuthenticationView.swift
//  FirebaseTest
//
//  Created by 최범수 on 2025-02-01.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        VStack {
            NavigationLink {
                SigninEmailView()
            } label: {
                Text("Sign In with Email")
                    .font(.headline)
                    .fontWeight(.bold)
                    .font(.system(size: 17, weight: .bold, design: .default))
            }

        }
        .navigationTitle("Sign In")
    }
}

#Preview {
    NavigationStack {
        AuthenticationView()
    }
}

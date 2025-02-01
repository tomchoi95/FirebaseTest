//
//  AuthenticationManager.swift
//  FirebaseTest
//
//  Created by 최범수 on 2025-02-01.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoURL: URL?
    
    init(user: User ) {
        self.uid = user.uid
        self.email = user.email
        self.photoURL = user.photoURL
    }
    
}

final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    
    private init() { }
    
    func createUser(email: String, passwd: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: passwd)
        return AuthDataResultModel(user: authDataResult.user)
    }
}

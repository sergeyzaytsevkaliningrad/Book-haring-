//
//  AuthService.swift
//  Pokushats
//
//  Created by Yoav Nemirovsky on 06.10.2020.
//  Copyright © 2020 Yoav. All rights reserved.
//

import Firebase
import FirebaseAuth

final class AuthService: NSObject, FirebaseAuthServiceProtocol {
    
    private let db = Firestore.firestore()
    
    func performSignIn(phoneNumber: String?, completion: @escaping (Result<Void, Errors>) -> Void) {
        
        guard let phoneNumber = phoneNumber else {
            completion(.failure(.numberIsNotExist))
            return
        }
        
        Auth.auth().languageCode = Locale.current.languageCode
        
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                completion(.failure(.authWithPhoneNumberFailed(error: error)))
                return
            }
            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
            completion(.success(()))
        }
    }
    
    func verifySmsCode(verificationCode: String?, completion: @escaping (Result<Void, Errors>) -> Void) {
        guard let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") else {
            completion(.failure(.verificationIdNotFound))
            return
        }
        guard let verificationCode = verificationCode else {
            completion(.failure(.verificationCodeNotExist))
            return
        }
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: verificationCode
        )
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                completion(.failure(.authWithPhoneNumberFailed(error: error)))
            } else {
                completion(.success(()))
            }
        }
    }
    
    func isUserExist() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
    func signOutUser() throws {
        try Auth.auth().signOut()
    }
    
    func isUsernameExist(completion: @escaping (Bool) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else {
            completion(false)
            return
        }
        
        db.collection("Users").document(userId).getDocument { document, error in
            
            guard error == nil else {
                completion(false)
                return
            }
            
            guard let username = document?.data()?["username"] as? String else {
                completion(false)
                return
            }
            
            completion(!username.isEmpty)
        }
    }
}

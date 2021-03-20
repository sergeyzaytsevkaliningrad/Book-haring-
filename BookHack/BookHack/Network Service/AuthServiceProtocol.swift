//
//  AuthServiceProtocol.swift
//  Pokushats
//
//  Created by Yoav Nemirovsky on 21.12.2020.
//  Copyright © 2020 Yoav. All rights reserved.
//

import Foundation

protocol FirebaseAuthServiceProtocol {
    func performSignIn(phoneNumber: String?, completion: @escaping (Result<Void, AuthService.Errors>) -> Void)
    func verifySmsCode(verificationCode: String?, completion: @escaping (Result<Void, AuthService.Errors>) -> Void)
    func isUserExist() -> Bool
    func isUsernameExist(completion: @escaping (Bool) -> Void)
    func signOutUser() throws
}

//
//  EnterPhoneNumberDelegate.swift
//  Pokushats
//
//  Created by Yoav Nemirovsky on 05.03.2021.
//  Copyright © 2021 Yoav. All rights reserved.
//

import Foundation

final class EnterPhoneNumberDelegate {
    
    private let authService: FirebaseAuthServiceProtocol
    private let coordinator: AuthCoordinatorProtocol
    
    init(authService: FirebaseAuthServiceProtocol, coordinator: AuthCoordinatorProtocol) {
        self.authService = authService
        self.coordinator = coordinator
    }
    
    func performSignIn(phoneNumber: String?) {
        authService.performSignIn(phoneNumber: phoneNumber) { [weak self] result in
            switch result {
            case .success:
                print("Успешно получили смс")
                self?.coordinator.showVerifyPhoneNumber(title: AppTexts.AuthFlow.PhoneVerification.title + (phoneNumber ?? ""))
            case .failure(let error):
                print(error.description)
            }
        }
    }
}

//
//  WelcomeControllerDelegate.swift
//  Pokushats
//
//  Created by Yoav Nemirovsky on 13.12.2020.
//  Copyright © 2020 Yoav. All rights reserved.
//

import Foundation

protocol WelcomeControllerDelegateProtocol {
    func signIn()
    func signUp()
}

final class WelcomeControllerDelegate: WelcomeControllerDelegateProtocol {
    private let coordinator: AuthCoordinatorProtocol
    
    init(coordinator: AuthCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func signIn() {
        coordinator.showSignIn()
    }
    
    func signUp() {
        coordinator.showSignUp()
    }
}

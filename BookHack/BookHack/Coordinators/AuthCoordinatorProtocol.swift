//
//  AuthCoordinatorProtocol.swift
//  Pokushats
//
//  Created by Yoav Nemirovsky on 11.12.2020.
//  Copyright © 2020 Yoav. All rights reserved.
//

import Foundation

protocol AuthCoordinatorProtocol: Coordinator {
    func showSignUp()
    func showSignIn()
    func showVerifyPhoneNumber(title: String)
    func authWithPhoneSuccesfully()
    func authCompleted()
}

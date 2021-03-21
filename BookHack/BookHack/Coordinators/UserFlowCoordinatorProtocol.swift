//
//  UserFlowCoordinatorProtocol.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import Foundation

protocol UserFlowCoordinatorProtocol: Coordinator {
    func showCodeScanner()
    func showBook(model: BookResponseModel)
    func showProfile()
}

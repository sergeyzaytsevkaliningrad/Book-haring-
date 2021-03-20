//
//  ISBNScannerDelegate.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import Foundation

final class ISBNScannerDelegate {
    private let ISBNService: IsbnNetworkServiceProtocol
    private let firebaseService: InnerNetworkServiceProtocol
    private let coordinator: UserFlowCoordinatorProtocol
    
    init(
        ISBNService: IsbnNetworkServiceProtocol,
        firebaseService: InnerNetworkServiceProtocol,
        coordinator: UserFlowCoordinatorProtocol
    ) {
        self.ISBNService = ISBNService
        self.firebaseService = firebaseService
        self.coordinator = coordinator
    }
    
    func ISBNCodeHandler(code: String) {
        ISBNService.getBookInfo(by: code) { result in
            switch result {
            case .success(let model):
                break
//                print(model.items?.first?.volumeInfo?.title)
//                print(model.items?.first?.volumeInfo?.subtitle)
            case .failure(let error):
                print(error)
            }
        }
    }
}

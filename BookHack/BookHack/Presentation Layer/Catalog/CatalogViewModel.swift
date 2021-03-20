//
//  CatalogViewModel.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import Foundation

final class CatalogViewModel {
    private let networkService: InnerNetworkServiceProtocol
    private let coordinator: UserFlowCoordinatorProtocol
    
    init(networkService: InnerNetworkServiceProtocol,
         coordinator: UserFlowCoordinatorProtocol) {
        self.networkService = networkService
        self.coordinator = coordinator
    }
}

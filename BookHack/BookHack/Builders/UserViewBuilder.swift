//
//  UserViewBuilder.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import UIKit

protocol UserViewBuilderProtocol {
    func makeBookCatalogController(coordinator: UserFlowCoordinatorProtocol) -> UIViewController
}

final class UserViewBuilder: UserViewBuilderProtocol {
    
    private let networkService: InnerNetworkServiceProtocol
    
    init(networkService: InnerNetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func makeBookCatalogController(coordinator: UserFlowCoordinatorProtocol) -> UIViewController {
        let viewModel = CatalogViewModel(networkService: networkService, coordinator: coordinator)
        let controller = CatalogViewController(viewModel: viewModel)
        return controller
    }
}

//
//  UserViewBuilder.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import UIKit

protocol UserViewBuilderProtocol {
    func makeBookCatalogController(coordinator: UserFlowCoordinatorProtocol) -> UIViewController
    func makeScannerCodeController(coordinator: UserFlowCoordinatorProtocol) -> UIViewController
    func makeBookController(model: IsbnResponseModel, coordinator: UserFlowCoordinatorProtocol) -> UIViewController
}

final class UserViewBuilder: UserViewBuilderProtocol {
    
    private let networkService: InnerNetworkServiceProtocol
    private let ISBNService: IsbnNetworkServiceProtocol
    
    init(networkService: InnerNetworkServiceProtocol,
         ISBNService: IsbnNetworkServiceProtocol) {
        self.networkService = networkService
        self.ISBNService = ISBNService
    }
    
    func makeBookCatalogController(coordinator: UserFlowCoordinatorProtocol) -> UIViewController {
        let viewModel = CatalogViewModel(networkService: networkService, coordinator: coordinator)
        let controller = CatalogViewController(viewModel: viewModel)
        return controller
    }
    
    func makeScannerCodeController(coordinator: UserFlowCoordinatorProtocol) -> UIViewController {
        let delegate = ISBNScannerDelegate(ISBNService: ISBNService, firebaseService: networkService, coordinator: coordinator)
        let controller = IsbnScannerViewController(scannerDelegate: delegate)
        return controller
    }
    
    func makeBookController(model: IsbnResponseModel, coordinator: UserFlowCoordinatorProtocol) -> UIViewController {
        let viewModel = BookViewModel(coordinator: coordinator, networkService: networkService, bookModel: model)
        let controller = BookViewController(viewModel: viewModel)
        return controller
    }
}

//
//  UserFlowCoordinator.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import UIKit

final class UserFlowCoordinator: UserFlowCoordinatorProtocol {
    var childCoordinators: [Coordinator] = []
    
    var container: [UIViewController] = []
    
    var navigationController: UINavigationController
    
    private let builder: UserViewBuilderProtocol
    
    init(navigationController: UINavigationController,
         builder: UserViewBuilderProtocol) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func start() {
        let controller = builder.makeBookCatalogController(coordinator: self)
        controller.tabBarItem = UITabBarItem(
            title: "Каталог",
            image: UIImage(systemName: "books.vertical.fill",
                           withConfiguration: UIImage.SymbolConfiguration(weight: .semibold)), tag: 0)
        navigationController.pushViewController(controller, animated: true)
    }
    
    
}

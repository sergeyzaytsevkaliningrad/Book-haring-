//
//  MainCoordinator.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import UIKit

final class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var container: [UIViewController] = []
    
    var navigationController: UINavigationController
    
    private let viewBuilder: ViewBuilderProtocol
    
    private let window: UIWindow
    
    init(
        navigationController: UINavigationController,
        viewBuilder: ViewBuilderProtocol,
        window: UIWindow
    ) {
        self.navigationController = navigationController
        self.viewBuilder = viewBuilder
        self.window = window
    }
    
    func start() {
        let controller = viewBuilder.makeAuthViewController(coordinator: self)
        navigationController.pushViewController(controller, animated: true)
        window.rootViewController = navigationController
    }
    
    
}

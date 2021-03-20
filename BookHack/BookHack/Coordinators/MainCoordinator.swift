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
    private let authBuilder: AuthViewBuilderProtocol
    
    private let window: UIWindow
    
    init(
        navigationController: UINavigationController,
        viewBuilder: ViewBuilderProtocol,
        window: UIWindow,
        authBuilder: AuthViewBuilderProtocol
    ) {
        self.navigationController = navigationController
        self.viewBuilder = viewBuilder
        self.window = window
        self.authBuilder = authBuilder
    }
    
    func start() {
        startAuthFlow()
    }
    
    private func startAuthFlow() {
        let coordinator = AuthCoordinator(navigationController: navigationController, builder: authBuilder, window: window)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
}

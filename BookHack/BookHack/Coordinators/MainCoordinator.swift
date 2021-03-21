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
    private let userBuilder: UserViewBuilderProtocol
    private let authService: FirebaseAuthServiceProtocol
    
    private let window: UIWindow
    
    init(
        navigationController: UINavigationController,
        viewBuilder: ViewBuilderProtocol,
        window: UIWindow,
        authBuilder: AuthViewBuilderProtocol,
        userBuilder: UserViewBuilder,
        authService: FirebaseAuthServiceProtocol
    ) {
        self.navigationController = navigationController
        self.viewBuilder = viewBuilder
        self.window = window
        self.authBuilder = authBuilder
        self.authService = authService
        self.userBuilder = userBuilder
    }
    
    func start() {
        if authService.isUserExist() {
            DispatchQueue.main.async {
                self.startUserFlow()
                try? self.authService.signOutUser()
            }
        } else {
            DispatchQueue.main.async {
                self.startAuthFlow()
            }
        }
    }
    
    private func startAuthFlow() {
        let coordinator = AuthCoordinator(navigationController: navigationController, builder: authBuilder, window: window)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    private func startUserFlow() {
        let navigationController = UINavigationController()
        let userCoordinator = UserFlowCoordinator(
            navigationController: navigationController,
            builder: userBuilder
        )
        
        let tabBar = AppTabBarController(userFlow: userCoordinator)
        window.rootViewController =  tabBar
        UIView.transition(with: self.window,
                          duration: 0.6,
                          options: [.transitionFlipFromLeft],
                          animations: nil, completion: nil)
    }
    
    func userAuthDidFinish(_ child: Coordinator) {
        deleteChild(child)
        DispatchQueue.main.async {
            self.startUserFlow()
        }
    }
    
    func userSignOut(_ child: Coordinator) {
        guard let _ = try? authService.signOutUser() else { return }
        deleteChild(child)
        startAuthFlow()
    }
    
    private func deleteChild(_ child: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

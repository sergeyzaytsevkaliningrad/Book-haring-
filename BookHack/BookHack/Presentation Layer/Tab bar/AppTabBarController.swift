//
//  AppTabBarController.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import UIKit

class AppTabBarController: UITabBarController {
    
    private let userFlow: UserFlowCoordinatorProtocol
    private let userProfileFlow: UserProfileCoordinatorProtocol
    
    init(
        userFlow: UserFlowCoordinatorProtocol,
        userProfileFlow: UserProfileCoordinatorProtocol
    ) {
        self.userFlow = userFlow
        self.userProfileFlow = userProfileFlow
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userFlow.start()
        userProfileFlow.start()
        view.tintColor = AppColors.systemPink
        viewControllers = [
            userFlow.navigationController,
            userProfileFlow.navigationController
        ]
        selectedIndex = 0
    }

}

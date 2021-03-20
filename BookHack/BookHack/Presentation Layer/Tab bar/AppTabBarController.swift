//
//  AppTabBarController.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import UIKit

class AppTabBarController: UITabBarController {
    
    private let userFlow: UserFlowCoordinatorProtocol
    
    init(
        userFlow: UserFlowCoordinatorProtocol
    ) {
        self.userFlow = userFlow
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userFlow.start()
        view.tintColor = AppColors.systemPink
        viewControllers = [
            userFlow.navigationController
        ]
        selectedIndex = 0
    }

}

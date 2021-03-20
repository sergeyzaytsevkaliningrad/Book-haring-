//
//  ViewBuilders.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import UIKit

protocol ViewBuilderProtocol  {
    func makeAuthViewController(coordinator: MainCoordinator) -> UIViewController
}

final class ViewBuilder: ViewBuilderProtocol {
    
    func makeAuthViewController(coordinator: MainCoordinator) -> UIViewController {
        let controller = LoadingIndicatorController()
        return controller
    }
}

//
//  CatalogViewController.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import UIKit

class CatalogViewController: UIViewController {
    
    private let viewModel: CatalogViewModel
    
    init(viewModel: CatalogViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.systemBackground
        title = "Каталог"
    }
}

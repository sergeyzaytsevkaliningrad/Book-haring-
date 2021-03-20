//
//  BookViewController.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import UIKit

class BookViewController: UIViewController {
    
    private let viewModel: BookViewModel
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = viewModel.title
        label.textColor = AppColors.label
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = viewModel.subtitle
        label.textColor = AppColors.label
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Автор: \(viewModel.author)"
        label.textColor = AppColors.label
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Описание:\n\(viewModel.description)"
        label.textColor = AppColors.label
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()

    
    init(viewModel: BookViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let containerView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.systemBackground
        setupLayout()
    }
    
    private func setupLayout() {
        setupContainerView()
        [containerView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(containerView)
        }
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            containerView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        ])
    }
    
    func setupContainerView() {
        containerView.axis = .vertical
        containerView.distribution = .equalCentering
        containerView.alignment = .leading
        containerView.addArrangedSubview(titleLabel)
        containerView.addArrangedSubview(subtitleLabel)
//        containerView.addArrangedSubview(authorLabel)
//        containerView.addArrangedSubview(descriptionLabel)
        containerView.spacing = 6
    }
}

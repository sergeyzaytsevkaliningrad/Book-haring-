//
//  WelcomeViewController.swift
//  Pokushats
//
//  Created by Yoav Nemirovsky on 12.12.2020.
//  Copyright © 2020 Yoav. All rights reserved.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    enum Constants {
        static let buttonHeight: CGFloat = 45
    }
    
    private let delegate: WelcomeControllerDelegateProtocol

    private let backgroundImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "backgroundImage"))
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = AppTexts.AuthFlow.Welcome.headerLabel
        label.font = AppFonts.welcomeHeader
        label.textColor = AppColors.white
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let signInButton: BorderButton = {
        let button = BorderButton(type: .system)
        button.titleLabel?.font = AppFonts.buttonRegular
        button.setTitle(AppTexts.AuthFlow.Welcome.firstButtonTitle, for: .normal)
        return button
    }()
    
    private let signUpButton: FillButton = {
        let button = FillButton(type: .system)
        button.titleLabel?.font = AppFonts.buttonRegular
        button.setTitle(AppTexts.AuthFlow.Welcome.secondButtonTitle, for: .normal)
        return button
    }()
    
    init(delegate: WelcomeControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupUI() {
        navigationController?.navigationBar.barStyle = .black
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
        
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
    }
    
    private func setupLayout() {
        [backgroundImage, signInButton, signUpButton, headerLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false; view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            headerLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            
            signInButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 10),
            signUpButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            signUpButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight)
        ])
    }
    
    @objc private func signInTapped() {
        delegate.signIn()
    }
    
    @objc private func signUpTapped() {
        delegate.signUp()
    }
}

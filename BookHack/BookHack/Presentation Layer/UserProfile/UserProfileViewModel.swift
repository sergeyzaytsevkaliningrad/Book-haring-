//
//  UserProfileViewModel.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 21.03.2021.
//

import Foundation

class UserProfileViewModel: ObservableObject {
    
    private let coordinator: UserProfileCoordinatorProtocol
    private let networkService: InnerNetworkServiceProtocol
    
    init(coordinator: UserProfileCoordinatorProtocol,
         networkService: InnerNetworkServiceProtocol) {
        self.coordinator = coordinator
        self.networkService = networkService
    }
    
    @Published var name = ""
    @Published var phoneNumber = ""
    
    func loadUserInfo() {
        networkService.loadUserInfo { result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.name = model.username ?? "empty"
                    self.phoneNumber = model.phoneNumber ?? "empty"
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func userSignOut() {
        coordinator.userSignOut()
    }
}

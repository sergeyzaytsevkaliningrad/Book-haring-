//
//  InnerNetworkServiceProtocol.swift
//  Pokushats
//
//  Created by Yoav Nemirovsky on 08.03.2021.
//  Copyright © 2021 Yoav. All rights reserved.
//

import Foundation

protocol InnerNetworkServiceProtocol {
    func upload(username: String, completion: @escaping (Result<Void, Error>) -> Void)
    func getUsername(completion: @escaping (Result<String, Error>) -> Void)
    func loadUserInfo(completion: @escaping (Result<UserInfoModel, Error>) -> Void)
}

struct UserInfoModel: Codable {
    let username: String?
    let phoneNumber: String?
}

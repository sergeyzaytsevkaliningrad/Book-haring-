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
    func reserveBook(book: BookResponseModel, completion: @escaping (Error?) -> Void)
    func deleteBook(isbn: String, completion: @escaping (Error?) -> Void)
    func loadReservedBooks(completion: @escaping ([BookResponseModel]) -> Void)
}

struct UserInfoModel: Codable {
    let username: String?
    let phoneNumber: String?
}

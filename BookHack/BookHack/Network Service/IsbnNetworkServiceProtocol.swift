//
//  IsbnNetworkServiceProtocol.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import Foundation

protocol IsbnNetworkServiceProtocol {
    func getBookInfo(by isbn: String, completion: @escaping (Result<BookResponseModel, Error>) -> Void)
}

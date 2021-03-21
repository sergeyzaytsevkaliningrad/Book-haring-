//
//  IsbnResponseModel.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import Foundation

struct BookResponseModel: Codable {
    var title: String
    var author: String
    var isbn: String
    var imageUrl: String?
    var publisher: String?
    var owner: String?
}

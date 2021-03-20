//
//  BookViewModel.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import Foundation

class BookViewModel {
    private let coordinator: UserFlowCoordinatorProtocol
    private let networkService: InnerNetworkServiceProtocol
    private let bookModel: IsbnResponseModel
    
    init(
        coordinator: UserFlowCoordinatorProtocol,
        networkService: InnerNetworkServiceProtocol,
        bookModel: IsbnResponseModel
    ) {
        self.coordinator = coordinator
        self.networkService = networkService
        self.bookModel = bookModel
    }
    
    var author: String {
        bookModel.items?.first?.volumeInfo?.authors?.first ?? ""
    }

    var title: String {
        bookModel.items?.first?.volumeInfo?.title ?? ""
    }
    
    var subtitle: String {
        bookModel.items?.first?.volumeInfo?.subtitle ?? ""
    }
    
    var description: String {
        bookModel.items?.first?.volumeInfo?.volumeInfoDescription ?? ""
    }
}

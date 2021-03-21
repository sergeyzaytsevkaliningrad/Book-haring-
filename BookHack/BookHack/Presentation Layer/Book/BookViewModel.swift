//
//  BookViewModel.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import Foundation

class BookViewModel: ObservableObject {
    private let coordinator: UserFlowCoordinatorProtocol
    private let networkService: InnerNetworkServiceProtocol
    private let bookModel: BookResponseModel
    
    init(
        coordinator: UserFlowCoordinatorProtocol,
        networkService: InnerNetworkServiceProtocol,
        bookModel: BookResponseModel
    ) {
        self.coordinator = coordinator
        self.networkService = networkService
        self.bookModel = bookModel
    }
    
    var author: String {
        bookModel.author
    }

    var title: String {
        bookModel.title
    }
    
    var isbnCode: String {
        bookModel.isbn
    }
    
    func handleTakeBook() {
        networkService.reserveBook(book: bookModel) { error in
            print(error ?? "Успешно resevred")
            DispatchQueue.main.async {
                self.coordinator.showProfile()
            }
        }
    }
    
}

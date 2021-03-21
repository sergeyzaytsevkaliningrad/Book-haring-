//
//  IsbnNetworkService.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import Firebase
import FirebaseFirestoreSwift

final class IsbnNetworkService: IsbnNetworkServiceProtocol {
    
    private let db = Firestore.firestore()
    
    enum Endpooint {
        case isbn(number: String)
        
        var url: URL? {
            switch self {
            case .isbn(let number):
                let urlString = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(number)"
                return URL(string: urlString)
            }
        }
    }
    
    func getBookInfo(
        by isbn: String,
        completion: @escaping (Result<BookResponseModel, Error>) -> Void
    ) {
        db.collection("library").whereField("isbn", isEqualTo: isbn).getDocuments { (querySnapshot, error) in
            if let error = error {
                completion(.failure(error))
            } else if let document = try? querySnapshot?.documents.first?.data(as: BookResponseModel.self) {
                completion(.success(document))
            } else {
                print("Не удалось скачать книжку")
            }
        }
    }
}

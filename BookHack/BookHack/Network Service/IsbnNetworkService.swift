//
//  IsbnNetworkService.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 20.03.2021.
//

import Foundation

final class IsbnNetworkService: IsbnNetworkServiceProtocol {
    
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
        completion: @escaping (Result<IsbnResponseModel, Error>) -> Void
    ) {
        let session = URLSession(configuration: .default)
        guard let url = Endpooint.isbn(number: isbn).url else { return }
        let task = session.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let rawData = data,
                      let data = try? JSONDecoder().decode(IsbnResponseModel.self, from: rawData) {
                completion(.success(data))
            } else {
                fatalError()
            }
        }
        task.resume()
    }
}

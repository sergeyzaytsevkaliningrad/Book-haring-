//
//  InnerNetworkService.swift
//  Pokushats
//
//  Created by Yoav Nemirovsky on 09.03.2021.
//  Copyright © 2021 Yoav. All rights reserved.
//

import Firebase
import Foundation
import FirebaseFirestoreSwift

final class InnerNetworkService: InnerNetworkServiceProtocol {
    
    enum FirebaseCollection {
        static let users = "Users"
        static let Orders = "Orders"
    }
    
    private let db = Firestore.firestore()
    
    func upload(username: String, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else {
            completion(.failure(Errors.userIdNotFound))
            return
        }
        db.collection(FirebaseCollection.users).document(userId).updateData(["username": username]) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    func getUsername(completion: @escaping (Result<String, Error>) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else {
            completion(.failure(Errors.userIdNotFound))
            return
        }
        db.collection(FirebaseCollection.users).document(userId).getDocument { document, error in
            if let error = error {
                completion(.failure(error))
            } else {
                guard let username = document?.data()?["username"] as? String else {
                    completion(.failure(Errors.userNameNotFound))
                    return
                }
                completion(.success(username))
            }
        }
    }
    
    func loadUserInfo(completion: @escaping (Result<UserInfoModel, Error>) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else {
            completion(.failure(Errors.userIdNotFound))
            return
        }
        db.collection(FirebaseCollection.users).document(userId).getDocument { document, error in
            if let error = error {
                completion(.failure(error))
            } else {
                guard let userData = try? document?.data(as: UserInfoModel.self) else {
                    completion(.failure(Errors.userNameNotFound))
                    return
                }
                completion(.success(userData))
            }
        }

    }
    
    enum Errors: Error {
        case userNameNotFound
        case userIdNotFound
        case queryDocumentsNotFound
        case unknown(Error)
    }
}

//
//  UserProfileData.swift
//  Pokushats
//
//  Created by Yoav Nemirovsky on 13.03.2021.
//  Copyright © 2021 Yoav. All rights reserved.
//

import Foundation

struct UserProfileData: Codable {
    var name: String?
    let phoneNumber: String?
    var email: String?
    var birthday: String?
    var sex: String?
    
    enum CodingKeys: String, CodingKey {
        case phoneNumber, email, birthday, sex
        case name = "username"
    }
}

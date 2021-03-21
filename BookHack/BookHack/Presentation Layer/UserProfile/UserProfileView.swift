//
//  UserProfileView.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 21.03.2021.
//

import SwiftUI

struct UserProfileView: View {
    
    @ObservedObject private var viewModel: UserProfileViewModel
    
    init(viewModel: UserProfileViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

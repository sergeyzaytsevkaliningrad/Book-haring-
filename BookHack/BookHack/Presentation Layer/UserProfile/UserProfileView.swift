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
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(viewModel.name)")
                        .fontWeight(.medium)
                        .font(.title)
                    Text("\(viewModel.phoneNumber)")
                        .foregroundColor(Color.gray)
                        .font(.title2)
                }
                Spacer()
            }
            Spacer()
            Button("Выйти", action: logOut)
        }
        .padding()
        .onAppear(perform: loadUserInfo)
    }
    
    private func loadUserInfo() {
        viewModel.loadUserInfo()
    }
    
    private func logOut() {
        viewModel.userSignOut()
    }
}

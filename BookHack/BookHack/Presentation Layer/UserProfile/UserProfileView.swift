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
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Мои данные:")
                        .foregroundColor(Color.gray)
                        .font(.title2)
                    Text("\(viewModel.name)")
                        .font(.title3)
                    Text("\(viewModel.phoneNumber)")
                        .font(.title3)
                }
                Spacer()
            }.padding(.bottom, 20)
            Text("Читаю сейчас:")
                .foregroundColor(Color.gray)
                .font(.title2)
            reservedBooks
//            Button("Выйти", action: logOut)
        }
        .padding()
        .onAppear(perform: loadUserInfo)
    }
    
    var reservedBooks: some View {
        List(viewModel.reservedBooks, id: \.isbn) { book in
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.title3)
                Text(book.author)
                    .font(.title3)
                Text("ISBN: \(book.isbn)")
                    .font(.caption)
                NavigationLink(destination: BookDetailedView(book: book, viewModel: viewModel)) {
                    Text("Вернуть книжку")
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    private func loadUserInfo() {
        viewModel.loadUserInfo()
        viewModel.loadReservedBooks()
    }
    
    private func logOut() {
        viewModel.userSignOut()
    }
}

struct BookDetailedView: View {
    
    let book: BookResponseModel
    
    let viewModel: UserProfileViewModel
    
    var body: some View {
        Button(action: returnBook) {
            Text("Вернуть")
        }
        
    }
    private func returnBook() {
        viewModel.returnBook(book: book)
    }
}

//
//  BookSwiftUIView.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 21.03.2021.
//

import SwiftUI

struct BookSwiftUIView: View {
    
    private let viewModel: BookViewModel
    
    init(viewModel: BookViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text(viewModel.title)
            Text(viewModel.author)
            Text(viewModel.isbnCode)
            Spacer()
            Button("Забрать книжку") {
                takeBook()
            }
        }
    }
    
    private func takeBook() {
        print("Нажал на взять книжку")
        viewModel.handleTakeBook()
    }
}

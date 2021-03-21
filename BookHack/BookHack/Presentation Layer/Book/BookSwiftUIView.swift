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
        VStack(alignment: .center) {
            Text(viewModel.title)
                .font(.title)
            Text(viewModel.author)
                .font(.title2)
            Text("ISBN: \(viewModel.isbnCode)")
                .font(.headline)
            Button("Забрать книжку") {
                takeBook()
            }
            .font(.headline)
        }
        .padding()
    }
    
    private func takeBook() {
        print("Нажал на взять книжку")
        viewModel.handleTakeBook()
    }
}

//
//  CatalogSwiftView.swift
//  BookHack
//
//  Created by Yoav Nemirovsky on 21.03.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct CatalogSwiftView: View {
    
    private let viewModel: CatalogViewModel
    
    init(viewModel: CatalogViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            Spacer()
            Button {
                viewModel.giveTakeButtonHandler()
            } label: {
                Text("Забрать книжку")
                    .frame(width: 200, height: 35, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color.purple)
                    .cornerRadius(25)
                    .clipped()
            }
            .padding()
        }
        .background(SwiftUI.Image("Coolerbackground").edgesIgnoringSafeArea(.all))

    }
    
}

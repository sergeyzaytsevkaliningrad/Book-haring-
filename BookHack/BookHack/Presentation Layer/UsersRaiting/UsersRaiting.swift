//
//  UsersRaiting.swift
//  BookHack
//
//  Created by Сергей Зайцев on 21.03.2021.
//

import SwiftUI

struct UsersRaiting: View {
    var tutors: [Tutor] = testData
    @State var showGoodRaiting: Bool = false
    
    var body: some View {
        
        VStack {
            Label("Должники", systemImage: "calendar")
                .font(.largeTitle)
                .accentColor(.red)
                .colorScheme(.dark)
            VStack(alignment: .leading) {
                Toggle(isOn: $showGoodRaiting) {
                    Label("Должники", systemImage: "book")
                        .colorScheme(.dark)
                        .font(.title2)
                }
            }
            .padding()
            List(tutors) { tutor in
                Image(tutor.imageName).cornerRadius(30.0)
                VStack(alignment: .leading) {
                    Text(tutor.name)
                        .font(.title3)
                    Text(tutor.headline)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(tutor.points)
                        .foregroundColor(.red)
                    
                    
                    
                }
            }
            .cornerRadius(25)
            .padding()
        }
        .background(SwiftUI.Image("Coolerbackground").edgesIgnoringSafeArea(.all))//.hidden()
        
        //Good raiting
        //        VStack {
        //            Label("Лучшие читатели", systemImage: "calendar")
        //                .font(.largeTitle)
        //                .accentColor(.red)
        //                .colorScheme(.dark)
        //                    VStack(alignment: .leading) {
        //                    Toggle(isOn: $showGoodRaiting) {
        //                        Label("Лучшие читатели", systemImage: "book")
        //                            .colorScheme(.dark)
        //                            .font(.title2)
        //                     }
        //                    }
        //            List(tutors) { tutor in
        //                Image(tutor.imageName).cornerRadius(30.0)
        //                VStack(alignment: .leading) {
        //                    Text(tutor.name)
        //                        .font(.title3)
        //                    Text(tutor.headline)
        //                        .font(.subheadline)
        //                        .foregroundColor(.gray)
        //                    Text(tutor.points)
        //                        .foregroundColor(.green)
        //
        //
        //
        //                }
        //            }
        //        }.hidden()
    }
}



struct UsersRaiting_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UsersRaiting(tutors: testData)
        }
    }
}

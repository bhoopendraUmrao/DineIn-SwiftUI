//
//  ItemDetail.swift
//  DineIn
//
//  Created by Bhoopendra Umrao on 1/16/23.
//

import SwiftUI

struct ItemDetail: View {
    let item: MenuItem
    @State var name = "paul"
    @EnvironmentObject var order: Order
    var message: AttributedString {
            var result = AttributedString("Testing 1 2 3!")
            result.font = .largeTitle
            result.foregroundColor = .white
            result.backgroundColor = .blue
            result.underlineStyle = Text.LineStyle(pattern: .solid, color: .white)
            return result
        }
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            TextField("Shout your name at me", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .textCase(.uppercase)
                        .padding(.horizontal)
            Button("Order This") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: .example)
                .environmentObject(Order())
        }
    }
}

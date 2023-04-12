//
//  ContentView.swift
//  DineIn
//
//  Created by Bhoopendra Umrao on 1/16/23.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    @State var selected: String?
    var body: some View {
        NavigationView{
            List {
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            NavigationLink {
                                ItemDetail(item: item)
                            } label: {
                                ItemRow(item: item)
                            }

                        }
                    }
                }
            }
            .navigationTitle(Text("Menu"))
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}

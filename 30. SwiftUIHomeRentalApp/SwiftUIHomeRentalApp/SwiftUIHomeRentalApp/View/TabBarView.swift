//
//  TabBarView.swift
//  SwiftUIHomeRentalApp
//
//  Created by Shivam Shishangia on 08/07/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            ContentView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
            
            ContentView()
                .tabItem {
                    Label("Place an Ad", systemImage: "plus.circle.fill")
                }
            
            ContentView()
                .tabItem {
                    Label("Chats", systemImage: "message.fill")
                }
            
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "line.3.horizontal")
                }
        }
        .tint(.red)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

//
//  ContentView.swift
//  SwiftUIListMusicApp
//
//  Created by Shivam Shishangia on 08/07/24.
//

import SwiftUI

struct ContentView: View {
    var songs = Song.generateSongs()

    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Songs")
                .foregroundColor(.blue)
                .font(.title2)
                .fontWeight(.bold)
                .padding([.top, .leading])
            
            List {
                ForEach(songs, id: \.self) { song in
                    SongRow(song: song)
                }
            }
            .listStyle(.plain)
        }
        .padding(.vertical)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

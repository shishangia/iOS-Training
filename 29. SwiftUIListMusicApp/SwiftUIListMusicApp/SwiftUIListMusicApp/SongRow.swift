//
//  SongRow.swift
//  SwiftUIListMusicApp
//
//  Created by Shivam Shishangia on 08/07/24.
//

import SwiftUI

struct SongRow: View {
    var song: Song

    var body: some View {
        HStack {
            if let imageName = song.imageName {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .clipShape(Rectangle())
            } else {
                Image(systemName: "music.note")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .clipShape(Rectangle())
            }
            
            VStack(alignment: .leading) {
                Text(song.name)
                    .font(.headline)
                
                Text(song.artist)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.leading)
            
            Spacer()
        }
        .padding(.vertical)
    }
}

struct SongRow_Previews: PreviewProvider {
    static var previews: some View {
        SongRow(song: Song(name: "Test", artist: "Test1"))
    }
}

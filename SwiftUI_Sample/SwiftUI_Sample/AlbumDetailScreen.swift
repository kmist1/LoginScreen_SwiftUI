//
//  AlbumDetailScreen.swift
//  SwiftUI_Sample
//
//  Created by Krunal Mistry on 10/14/22.
//

import SwiftUI
import AVFoundation

struct AlbumDetailScreen: View {
    var album: Album
    @ObservedObject var audioPlayerVM = AudioPlayerVM()
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack {
                    Button("Play") {
                        audioPlayerVM.musicUrl = URL(string: album.musicUrl)
                        audioPlayerVM.playMusic()
                    }

                    Button("Stop") {
                        audioPlayerVM.musicUrl = URL(string: album.musicUrl)
                        audioPlayerVM.stopPlayer()
                    }
                }
                Spacer()
            }
        }
        .navigationTitle(album.name)
    }
}

struct AlbumDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailScreen(album: Album(name: "Album1", artist: "Mike", musicUrl: "", image: ""))
    }
}

// sivaforum@gmail.com

//
//  AudioPlayerVM.swift
//  SwiftUI_Sample
//
//  Created by Krunal Mistry on 10/14/22.
//

import Foundation
import AVFoundation

class AudioPlayerVM: ObservableObject {
    var player: AVPlayer?
    var musicUrl: URL?

    init(player: AVPlayer? = nil, musicUrl: URL? = nil) {
        self.player = player
        self.musicUrl = URL(string: "https://smoothjazz.cdnstream1.com/2586_128.mp3")//musicUrl
    }

    func playMusic() {
        do {
            guard let url = musicUrl else { return }
            print(url)
            let playerItem = AVPlayerItem(url: url)

            if let player = try? AVPlayer(playerItem: playerItem) {
                self.player = player
            }
            player?.volume = 1.0
            player?.play()
        } catch {
            print(error)
        }
    }

    func stopPlayer() {
           if let play = player {
               print("stopped")
               play.pause()
               player = nil
               print("player deallocated")
           } else {
               print("player was already deallocated")
           }
       }
}

//
//  ContentView.swift
//  SwiftUI_Sample
//
//  Created by Krunal Mistry on 10/14/22.
//

import SwiftUI

struct AlbumScreen: View {
    @ObservedObject var albumVM = AlbumViewModel()
    @State var albumData: [Album] = []

    let colums = [GridItem(.fixed(100)), GridItem(.flexible())]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: colums) {
                ForEach(albumData, id: \.self) { item in
                    NavigationLink(destination: AlbumDetailScreen(album: item)) {
                        VStack {
                            AsyncImage(url: URL(string: item.image)) { image in
                                image
                                    .resizable()
                                    .frame(width: 100, height: 200)
                            } placeholder: {
                                Image(systemName: "photo")
                            }
                            HStack {
                                Text(item.name)
                                    .foregroundColor(.black)
                                Text(item.artist)
                                    .foregroundColor(.black)
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .padding()
        .onAppear {
            albumData = albumVM.albumData
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumScreen()
        AlbumScreen()
            .preferredColorScheme(.dark)
    }
}

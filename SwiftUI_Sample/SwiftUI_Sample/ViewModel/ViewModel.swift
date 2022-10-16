//
//  ViewModel.swift
//  SwiftUI_Sample
//
//  Created by Krunal Mistry on 10/14/22.
//

import Foundation

class AlbumViewModel: ObservableObject {

    @Published var albumData: [Album]

    init() {
        let a1 = Album(name: "a1",
                       artist: "john",
                       musicUrl: "http://smoothjazz.cdnstream1.com/2586_128.mp3", image: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/160db2f2cc6eaef1ad40cb4f5f43cffd_screen.jpg?ts=1561422695")
        let a2 = Album(name: "a2", artist: "Jen", musicUrl: "http://smoothjazz.cdnstream1.com/2586_128.mp3", image: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/dark-aesthetic-plastic-foil-black-album-cover-design-template-92b7e4fd49c47dbe505f4c2723178b41_screen.jpg?ts=1648861530")
        let a3 = Album(name: "a3", artist: "john", musicUrl: "http://smoothjazz.cdnstream1.com/2586_128.mp3", image: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/160db2f2cc6eaef1ad40cb4f5f43cffd_screen.jpg?ts=1561422695")
        let a4 = Album(name: "a4", artist: "Jen", musicUrl: "http://smoothjazz.cdnstream1.com/2586_128.mp3", image: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/dark-aesthetic-plastic-foil-black-album-cover-design-template-92b7e4fd49c47dbe505f4c2723178b41_screen.jpg?ts=1648861530")
        albumData = [a1,a2,a3,a4]
    }

    func getStoredPassword(userName: String) -> String {
        let kcw = KeychainWrapper()

        if let password = try? kcw.getGenericPasswordFor(
            account: userName,
            service: "unlockPassword") {
            return password
        }

        return ""
    }

    func signUpWith(userName: String, password: String, success: (Bool)->()) {

        let kcw = KeychainWrapper()

        do {
            try kcw.storeGenericPasswordFor(account: userName, service: "unlockPassword", password: password)
            success(true)
        } catch let error as KeychainWrapperError {
            print("Exception setting password: \(error.message ?? "no message")")
            success(false)
        } catch {
            print("An error occurred setting the password.")
            success(true)
        }
    }
}

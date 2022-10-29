import Cocoa

let albums = ["Taylor Swift", "Fearless", "Speak Now", "Red", "1989", "Reputation", "Lover", "Folklore", "Evermore", "Midnights"]
let albumCount = albums.count

let albumsSet = Set(albums)
let albumSetCount = albumsSet.count

print("Taylor Swift has released \(albumCount) original studio albums. There are \(albumSetCount) unique albums in her discography.")


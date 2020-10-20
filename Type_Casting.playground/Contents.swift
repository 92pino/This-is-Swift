import Cocoa

class MediaItem {
  var name: String
  init(name: String) {
    self.name = name
  }
}

class Movie: MediaItem {
  var director: String
  init(name: String, director: String) {
    self.director = director
    super.init(name: name)
  }
}

class Song: MediaItem {
  var artist: String
  
  init(name: String, artist: String) {
    self.artist = artist
    super.init(name: name)
  }
}

// 타입 추론에 의해 library qodufdms Movie와 Song의 공통 부모인 [MediaItem] 배열의 형을 갖게 된다.
let library = [
  Movie(name: "Casablanca", director: "Michael Curtiz"),
  Song(name: "Blue Suded Shoes", artist: "Elvis Presley"),
]

print(type(of: library))

// is 연산자를 통해 특정 타입의 인스턴스인지 확인할 수 있다.

var movieCount = 0
var songCount = 0

for item in library {
  if item is Movie {
    movieCount += 1
  } else if item is Song {
    songCount += 1
  }
}

print(movieCount, songCount)

// 다운 캐스팅
// as?와 as! 연산자를 통해 어떤 타입의 인스턴스인지 확인할 수 있다.
/*
 
 as?는 특정 타입이 맞는지 확신할 수 없을 때 사용
 as!는 특정 타입이라는 것이 확실할 경우에 사용
 
 100% 확실한것은 없으므로 as! 보단 as?를 사용
 만약 as!를 사용해 다운캐스팅 했는데 지정한 타입이 아니라면 런타임 에러가 발생하면서 앱이 죽는다.
 
 */

for item in library {
  if let movie = item as? Movie {
    print("Movie: \(movie.name), dir. \(movie.director)")
  } else if let song = item as? Song {
    print("Song : \(song.name), by \(song.artist)")
  }
}

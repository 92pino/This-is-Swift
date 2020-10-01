import Cocoa

/*
 
 타입 캐스팅
 
 인스턴스의 타입을 확인하거나 인스턴스를 같은 계층에 있는 다른 superclass나 subclass로 취급하는 방법
 
 */
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

let library = [
  Movie(name: "Casablanca", director: "Michael Curtiz"),
  Song(name: "Blue Suede Shoes", artist: "Elevispresley"),
  Movie(name: "Citizen Kane", director: "Orson Welles"),
  Song(name: "The One And Only", artist: "Chesney Hawkes"),
  Song(name: "Never Gonna Give You Up", artist: "Rick Astley"),
]

// library는 타입추론에 의해 [MediaItem] 배열
print(type(of: library))

var movieCount = 0
var songCount = 0

for item in library {
  if item is Movie {
    movieCount += 1
  } else {
    songCount += 1
  }
}

print("\(movieCount), \(songCount)")

/*
 
 다운 캐스팅
 어떤 타입의 인스턴스인지 체크
 
 */

for item in library {
  if let movie = item as? Movie {
    print("Movie : \(movie.name), dir. \(movie.director)")
  } else if let song = item as? Song {
    print("Song : \(song.name), by \(song)")
  }
}

/*
 
 Any, AnyObject 타입캐스팅
 Any : 함수 타입을 포함해 모든 타입을 나타낸다
 AnyObject : 모든 클래스 타입의 인스턴스를 나타낸다
 
 */

var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things {
  switch thing {
  case 0 as Int:
    print("zero as an Int")
  case 0 as Double:
    print("zero as a Double")
  case let someInt as Int:
    print("an integer value of \(someInt)")
  case let someDouble as Double where someDouble > 0:
    print("a positive double value of \(someDouble)")
  case is Double:
    print("some other double value that I don't want to print")
  case let someString as String:
    print("a string value of \(someString)")
  case let (x, y) as (Double, Double):
    print("an (x, y) point at \(x), \(y)")
  case let movie as Movie:
    print("a movie called \(movie.name), dir. \(movie.director)")
  case let stringConverter as (String) -> String:
    print(stringConverter("Michael"))
  default:
    print("Something else")
  }
}

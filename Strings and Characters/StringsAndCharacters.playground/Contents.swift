import Cocoa

let something = "Some string literal value"
let multiLine = """
  abc
  def
  ghi
  """

var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
  print("Nothing to see here")
}

var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"

for character in "Dog!🐶" {
  print(character)
}

let exclamationMark: Character = "!"

let catCharacters: [Character] = ["C", "a", "t", "!", "🐯"]
let catString = String(catCharacters)

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

welcome.append(exclamationMark)

welcome.count

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting.endIndex


for index in greeting.indices {
  print(greeting[index], terminator: "")
}

var welcomeStr = "hello"
welcomeStr.insert("!", at: welcomeStr.endIndex)
welcomeStr.insert(contentsOf: " there", at: welcomeStr.index(before: welcomeStr.endIndex))

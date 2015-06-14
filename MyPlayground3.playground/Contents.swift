//: Playground - noun: a place where people can play

// 文法

import UIKit
import Foundation

var apple = "apple"
var length = count(apple)

for ch in apple {
    ch
}

var ch:Character
ch = Array(apple)[3]

var animals: [String] = ["dog", "cat", "lion"]
animals[1]
var numberOfAnimals = animals.count

for animal in animals {
    animal
}

animals.append("tiger")
animals.insert("fish", atIndex: 2)

animals.removeAtIndex(2)
animals.removeLast()
animals.removeAll()

var dict = Dictionary<String, String>()
dict["one"] = "1"
dict["two"] = "2"
dict.count

dict["three"] = "3"
dict
dict["three"] = nil
dict

for (key, val) in dict {
    key
    val
}

for key in dict.keys {
    key
}

for val in dict.values {
    val
}


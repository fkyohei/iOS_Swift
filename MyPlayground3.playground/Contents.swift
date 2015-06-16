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


func pow2(x: Int) -> Int {
    return x * x
}
pow2(4)

func addTitle(name: String) -> (kun: String, san: String, chan: String) {
    return (name + "くん", name + "さん", name + "ちゃん")
}
var titledNames = addTitle("勉強")
titledNames.kun
titledNames.san
titledNames.chan

func dataDownload(handler: (String, String, String) -> Int) {
    var arg0 = "call"
    var arg1 = "from"
    var arg2 = "dataDownload"
    
    handler(arg0, arg1, arg2)
}

dataDownload({ (arg0, arg1, arg2) -> Int in
    println(arg0)
    println(arg1)
    println(arg2)

    return 0
})


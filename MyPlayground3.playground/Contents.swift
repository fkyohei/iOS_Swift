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


struct Rect {
    var x: Float = 0
    var y: Float = 0
    var width: Float = 0
    var height: Float = 0
    
    func maxX() -> Float {
        return x + width
    }
    
    static func availableMaxWidth() -> Float {
        return 1024.0
    }
}
var rect0 = Rect()
var rect1 = Rect(x:0, y:0, width:200, height:200)
var rect2 = Rect()
rect2.x = 100
rect2.y = 100
rect2.width = 100
rect2.height = 100
rect2.maxX()
Rect.availableMaxWidth()

class Rect2 {
    var x: Float = 0
    var y: Float = 0
    var width: Float = 0
    var height: Float = 0
    
    func maxX() -> Float {
        return x + width
    }
    
    class func availableMaxWidth() -> Float {
        return 1024.0
    }
}
var rect3 = Rect2()
rect3.x = 0
rect3.y = 0
rect3.width = 200
rect3.height = 200
rect3.maxX()
Rect2.availableMaxWidth()


class MyController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


var AnyArray = [Any]()
AnyArray.append(10)
AnyArray.append("text")
AnyArray.append(2.4)

var url = NSURL(string: "http://www.apple.com?test=1&test2=2")!
var host: String? = url.host
var param: String? = url.query
host?.hasPrefix("www")

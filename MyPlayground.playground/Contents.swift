// 数値計算・ループ・文字列操作

1 + 1
2 * 2
(10 + 3) * 7 - 8
10 / 3
10.0 / 3

var sum = 0
for i in 1...100 {
    sum += i
}
sum

var y = 0.0
for var x = -1.0; x < 1.0; x += 0.1 {
    y = x * x
}


var greeting = "Hello!"
var aisatsu = "こんにちは!"

var firstname = "スティーブ"
var lastname = "ジョブズ"
var name = firstname + "・" + lastname

var english = "私は\(3 + 3 + 4)年間英語を勉強しました"

var sum2 = 0
for i in 1...5 {
    var string = "\(sum2) + \(i) = \(sum2 + i) です"
    sum2 += i
}

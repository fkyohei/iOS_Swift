//: Playground - noun: a place where people can play

// フォント・文字色・画像

import UIKit

var string = NSMutableAttributedString(string: "iPhone")
string.addAttribute(NSFontAttributeName, value: UIFont(name: "Times", size: 48)!, range: NSMakeRange(0, 6))
string.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(), range: NSMakeRange(0, 6))

var image = UIImage(named: "Apple-Logo")!

var imageView = UIImageView(image: image)
imageView.frame = CGRectMake(0, 0, 300, 300)
imageView.contentMode = UIViewContentMode.ScaleAspectFit
imageView.contentMode = UIViewContentMode.ScaleAspectFill
imageView.alpha = 0.2

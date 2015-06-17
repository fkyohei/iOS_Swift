//: Playground - noun: a place where people can play

// ネットワーク

import Foundation
import UIKit
import XCPlayground

var urlString = "http://www.apple.com"
var url = NSURL(string: urlString)!

//var request = NSURLRequest(URL: url)

//var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil)
//
//var htmlString = NSString(data: data!, encoding: NSUTF8StringEncoding)!
//
//let image = UIImage(data: data!)!
//
//
//NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {
//    response, data, error in
//    var html = NSString(data: data, encoding: NSUTF8StringEncoding)!
//})

var task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {data, response, error in
    // データをテキストに変換する
    var string = NSString(data: data, encoding: NSUTF8StringEncoding)!
})

task.resume()

XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)
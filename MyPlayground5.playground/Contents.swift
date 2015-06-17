//: Playground - noun: a place where people can play

// ネットワーク・xmlパース

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


//////////////////////
/////////////////////
/////////////////////


class MyParserDelegate: NSObject, NSXMLParserDelegate {
    // タイトルのパース中かを表すフラグ
    var isTitle = false
    
    func parser(parse: NSXMLParser!,
        didStartElement elementName: String!,
        namespaceURI: String!,
        qualifiedName qName: String!,
        attributes attributeDict: [NSObject : AnyObject])
    {
        // タイトルタグの場合
        if(elementName == "title") {
            print("タイトル：")
            
            // フラグを設定する
            isTitle = true
        }
    }
    
    func parse(parse: NSXMLParser!,
        didEndElement elementName: String!,
        namespaceURI: String!,
        qualifiedName qName: String!) {
            // タイトルタグの場合
            if(elementName == "title") {
                // 改行する
                println()
                
                // フラグを設定する
                isTitle = false
            }
    }
    
    func parser(parser: NSXMLParser!,
        foundCharacters string: String!) {
            // タイトルのパース中の場合a
            if(isTitle) {
                print(string)
            }
    }
}


var urlString2 = "http://rss.dailynews.yahoo.co.jp/fc/rss.xml"
var url2 = NSURL(string: urlString2)!

var parser = NSXMLParser(contentsOfURL: url2)!

var delegate = MyParserDelegate()
parser.delegate = delegate

parser.parse()



////////////////////////////
//////////////////////////
//////////////////////////

var urlString3 = "hhtp://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://rss.dailynews.yahoo.co.jp/fc/rss.xml&num=8"
var url3 = NSURL(string: urlString3)!

var task3 = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {
    data, response, error in
        // JSONデータを辞書に変換する
    var dict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
    
    // /response/feed/entriesを取得
    var responseData = dict["responseData"] as! NSDictionary
    var feed = responseData["feed"] as! NSDictionary
    var entries = feed["entries"] as! NSArray
    
    // entryを取り出す
    for entry in entries {
        // タイトルを表示する
        println(entry["title"])
    }
})
task.resume()

XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)
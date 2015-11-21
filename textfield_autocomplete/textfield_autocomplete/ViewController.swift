//
//  ViewController.swift
//  textfield_autocomplete
//
//  Created by 藤崎 恭平 on 2015/11/20.
//  Copyright © 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var autocompleteTableView: UITableView!
    @IBOutlet weak var secondtextField: UITextField!
    
    var myWindow = UIWindow()
    var myWindowButton = UIButton()

    var ary_select = ["Camel", "Cat", "Dog", "Dolphin", "Koala", "Men", "Monkey", "Women"]
    var autocompleteUrls = [String]()
    
    var ary_data = ["aaa", "bbbb", "ccc", "ddd", "eee", "aaa", "bbbb", "ccc", "ddd", "eee", "aaa", "bbbb", "ccc", "ddd", "eee"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textField.delegate = self
        
        autocompleteTableView.delegate = self
        autocompleteTableView.dataSource = self
        autocompleteTableView.scrollEnabled = true
        autocompleteTableView.hidden = true
        
        autocompleteTableView.layer.borderColor = UIColor.lightGrayColor().CGColor
        autocompleteTableView.layer.borderWidth = 1.0
        autocompleteTableView.layer.cornerRadius = 5.0
        
        autocompleteTableView.separatorInset = UIEdgeInsetsZero
        autocompleteTableView.layoutMargins = UIEdgeInsetsZero

    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        autocompleteTableView.hidden = false
        let substring = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
        self.searchAutocompleteEntriesWithSubstring(substring.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()))
        return true
    }
    
    func searchAutocompleteEntriesWithSubstring(substring: String) {
        autocompleteUrls.removeAll(keepCapacity: false)
        if substring != "" {
            
            for str_select in ary_select
            {
                let myString:NSString! = str_select as NSString
                let substringRange :NSRange! = myString.rangeOfString(substring)
                if (substringRange.location == 0) {
                    if !autocompleteUrls.contains(str_select) {
                        autocompleteUrls.append(str_select)
                    }
                    
                }
            }
            autocompleteTableView.reloadData()
        } else {
            autocompleteTableView.hidden = true
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // サジェストテーブル
        if tableView.tag == 1 {
            return autocompleteUrls.count
        }
        // ポップアップテーブル
        else if tableView.tag == 2 {
            return ary_data.count
        }
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // サジェストテーブル
        if tableView.tag == 1 {
            let autoCompleteRowIdentifier = "AutoCompleteRowIdentifier"
            var cell = tableView.dequeueReusableCellWithIdentifier(autoCompleteRowIdentifier) as UITableViewCell?
            
            if let _ = cell {
                cell!.textLabel!.text = autocompleteUrls[indexPath.row]
            } else {
                cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: autoCompleteRowIdentifier)
            }
            return cell!
        }
        // ポップアップテーブル
        else if tableView.tag == 2 {
            let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"Cell")
            cell.textLabel?.text = ary_data[indexPath.row]
            return cell
        }
        let autoCompleteRowIdentifier = "AutoCompleteRowIdentifier"
        var cell = tableView.dequeueReusableCellWithIdentifier(autoCompleteRowIdentifier) as UITableViewCell?
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // サジェストテーブル
        if tableView.tag == 1 {
            let selectedCell : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            textField.text = selectedCell.textLabel!.text
            autocompleteTableView.hidden = true
        }
        // ポップアップテーブル
        else if tableView.tag == 2 {
            let selectedCell : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            secondtextField.text = selectedCell.textLabel!.text
            myWindow.hidden = true
        }
    }

    @IBAction func modalBtn(sender: AnyObject) {

        
        // 背景黒
        myWindow.backgroundColor = UIColor.blackColor()
        myWindow.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        myWindow.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height/2)
        myWindow.alpha = 0.8
        
        // myWindowをkeyWindowにする.
        myWindow.makeKeyWindow()
        
        // windowを表示する.
        myWindow.makeKeyAndVisible()
        
        // テーブルを作成
        let table = UITableView(frame:CGRect(x:0, y: 0, width:self.view.frame.size.width * 2 / 3, height: self.view.frame.height * 2 / 3))
        table.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height/2)
        table.delegate = self
        table.dataSource = self
        table.tag = 2
        myWindow.addSubview(table)
        
        // ボタンを作成する.
        myWindowButton.frame = CGRectMake(0, 0, 100, 60)
        myWindowButton.backgroundColor = UIColor.orangeColor()
        myWindowButton.setTitle("Close", forState: .Normal)
        myWindowButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        myWindowButton.layer.masksToBounds = true
        myWindowButton.layer.cornerRadius = 20.0
        myWindowButton.layer.position = CGPointMake(myWindow.frame.width/2, myWindow.frame.height-50)
        myWindowButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        myWindow.addSubview(myWindowButton)
    }
    
    /*
    ボタンイベント
    */
    internal func onClickMyButton(sender: UIButton) {
        
        if sender == myWindowButton {
            myWindow.hidden = true
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


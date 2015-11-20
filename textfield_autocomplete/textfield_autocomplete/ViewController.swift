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

    var ary_select = ["Camel", "Cat", "Dog", "Dolphin", "Koala", "Men", "Monkey", "Women"]
    var autocompleteUrls = [String]()
    
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
        return autocompleteUrls.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let autoCompleteRowIdentifier = "AutoCompleteRowIdentifier"
        var cell = tableView.dequeueReusableCellWithIdentifier(autoCompleteRowIdentifier) as UITableViewCell?
        
        if let _ = cell {
            cell!.textLabel!.text = autocompleteUrls[indexPath.row]
        } else {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: autoCompleteRowIdentifier)
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedCell : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        textField.text = selectedCell.textLabel!.text
        autocompleteTableView.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


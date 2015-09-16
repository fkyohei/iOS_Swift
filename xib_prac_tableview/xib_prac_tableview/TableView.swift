//
//  TableView.swift
//  xib_prac_tableview
//
//  Created by 藤崎 恭平 on 2015/09/16.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class TableView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ary_device_data: [String] = ["iMac", "MacBook Pro", "MacBook Air", "MacBook", "iPad Air", "iPad mini", "iPhone", "iPod"]
    
    override func loadView() {
        if let view = UINib(nibName: "TableView", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView {
            self.view = view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var nib = UINib(nibName: "CustomCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "CustomCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ary_device_data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomCell
        
        cell.customLabel.text = ary_device_data[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Select cell at \(indexPath.row)")
    }

}

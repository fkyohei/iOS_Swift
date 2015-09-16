//
//  CustomCell.swift
//  xib_prac_tableview
//
//  Created by 藤崎 恭平 on 2015/09/16.
//  Copyright (c) 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var customLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

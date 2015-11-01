//
//  OptionCustomCell.swift
//  ShokuTan
//
//  Created by kyohei on 2015/10/18.
//  Copyright © 2015年 fujisakikyo. All rights reserved.
//

import UIKit

class OptionCustomCell: UITableViewCell {
    @IBOutlet weak var custom_cell: UILabel!
    // 選択状態
    var is_checked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.is_checked = false
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

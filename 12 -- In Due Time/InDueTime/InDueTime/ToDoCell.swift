//
//  ToDoCell.swift
//  InDueTime
//
//  Created by Jennifer Hamilton on 10/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell
{
    
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var `switch`: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  MeasurementCell.swift
//  HighVoltage
//
//  Created by Jennifer Hamilton on 10/22/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class MeasurementCell: UITableViewCell {
    
    
    @IBOutlet weak var measurementLabel: UILabel!
    @IBOutlet weak var dataTextField: UITextField!
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }

}

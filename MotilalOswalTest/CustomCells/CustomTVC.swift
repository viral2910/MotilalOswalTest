//
//  CustomTVC.swift
//  MotilalOswalTest
//
//  Created by Viral Vinchhi on 18/11/20.
//  Copyright © 2020 Viral Vinchhi. All rights reserved.
//

import UIKit

class CustomTVC: UITableViewCell {
    
    //Reference From Storyboard
    @IBOutlet weak var employeeIdLabel: UILabel!
    @IBOutlet weak var employeeNameLabel: UILabel!
    
    //setting Perticular Employee details
    var employee : Employee? {
        didSet {
            employeeIdLabel.text = employee?.id
            employeeNameLabel.text = employee?.employeeName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //Configure the view for the selected state
    }
}

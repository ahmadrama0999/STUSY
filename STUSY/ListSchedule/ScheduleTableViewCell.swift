//
//  ScheduleTableViewCell.swift
//  STUSY
//
//  Created by Ramin Akhmad on 14.06.2020.
//  Copyright © 2020 Ramin Akhmad. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var groupNameLabel: UILabel!
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if superview != nil {
            let leftColor = UIColor(hex: 0x9BD56D)
            let rightColor = UIColor(hex: 0x0F9E98)
            layer.cornerRadius = frame.height / 6
            setGradientBackground(leftColor: leftColor, rightColor: rightColor, direction: .topToBottom)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setupCell(schedule: Schedule) {
        universityLabel.text = schedule.uni
        groupNameLabel.text = schedule.groupName
    }
    
    

}

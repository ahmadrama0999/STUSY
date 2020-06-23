//
//  ChooseDayCellTableViewCell.swift
//  STUSY
//
//  Created by Ramin Akhmad on 23.06.2020.
//  Copyright © 2020 Ramin Akhmad. All rights reserved.
//

import UIKit


class ChooseDayCellTableViewCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var choiceSwitch: UISwitch!
    
    private var switchCallback: ((Bool) -> Void)?
    
    
    func setup(day: String, switchCallback: ((Bool) -> Void)?) {
        dayLabel.text = day
        self.switchCallback = switchCallback
    }
    
    @IBAction private func switchChanged(_ sender: UISwitch) {
        switchCallback?(sender.isOn)
    }
}

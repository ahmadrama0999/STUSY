//
//  DayTableViewCell.swift
//  STUSY
//
//  Created by Ramin Akhmad on 13.06.2020.
//  Copyright © 2020 Ramin Akhmad. All rights reserved.
//

import UIKit

class DayTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        layer.backgroundColor = .none
        layer.cornerRadius = frame.height / 6
        layer.shadowOpacity = 0.5
        layer.shadowColor = .some(CGColor(srgbRed: 0.89, green: 1, blue: 0.8, alpha: 1))
        
    }
}



//
//  LessonTableViewCell.swift
//  STUSY
//
//  Created by Ramin Akhmad on 16.06.2020.
//  Copyright © 2020 Ramin Akhmad. All rights reserved.
//

import UIKit

class LessonTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var prepodLabel: UILabel!
    @IBOutlet weak var audLabel: UILabel!
    @IBOutlet weak var timeFromLabel: UILabel!
    @IBOutlet weak var timeToLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        layer.backgroundColor = .none
        bgView.layer.cornerRadius = bgView.frame.height / 6
        bgView.backgroundColor = bgView.backgroundColor?.withAlphaComponent(0.7)
    }
    
}

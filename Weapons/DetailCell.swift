//
//  DetailCell.swift
//  Weapons
//
//  Created by 瞿炬星 on 2018/3/3.
//  Copyright © 2018年 瞿炬星. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    
    
    @IBOutlet weak var fieldLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

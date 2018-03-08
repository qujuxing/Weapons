//
//  CardCell.swift
//  Weapons
//
//  Created by 瞿炬星 on 2018/3/2.
//  Copyright © 2018年 瞿炬星. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {

    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var weaponLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    var favorite = false {
        willSet {
            if newValue  {
                favBtn.setImage(#imageLiteral(resourceName: "fav") , for: .normal)
                
            } else {
                favBtn.setImage(#imageLiteral(resourceName: "unfav"), for: .normal)
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  ClothesTableViewCell.swift
//  SmartShop
//
//  Created by 戴逸涵 on 15/12/13.
//  Copyright © 2015年 Yihan Dai. All rights reserved.
//

import UIKit

class ClothesTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingControl: RatingControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

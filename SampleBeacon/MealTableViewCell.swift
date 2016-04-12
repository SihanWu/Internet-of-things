//
//  MealTableViewCell.swift
//  SampleBeacon
//
//  Created by 戴逸涵 on 15/12/2.
//  Copyright © 2015年 Yihan Dai. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    //Mark: Properties
  
    
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

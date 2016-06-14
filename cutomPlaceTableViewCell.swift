//
//  cutomPlaceTableViewCell.swift
//  Xplore
//
//  Created by Abdulghafar Al Tair on 6/8/16.
//  Copyright © 2016 Abdulghafar Al Tair. All rights reserved.
//

import UIKit

class cutomPlaceTableViewCell: UITableViewCell {

   
    var cellImage: UIImageView?
    var cellLabel: UILabel?
    var cellDate: UILabel?

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellImage = UIImageView(frame: CGRectMake(0, 0, 102, 88))
        self.addSubview(cellImage!)
        
        cellLabel = UILabel(frame: CGRectMake(116, 0, 190, 21))
        self.addSubview(cellLabel!)
        
        cellDate = UILabel(frame: CGRectMake(110, 45, 195, 29))
        self.addSubview(cellDate!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 
    
}

//
//  detailTableViewCell.swift
//  toDo app
//
//  Created by arora_72 on 31/05/17.
//  Copyright © 2017 indresh arora. All rights reserved.
//

import UIKit

class detailTableViewCell: UITableViewCell {
    @IBOutlet weak var mainBackground: UIView!

 

    
    @IBOutlet weak var labelText: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

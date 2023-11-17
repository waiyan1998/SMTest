//
//  PCell.swift
//  SMTest
//
//  Created by Wai Yan Pyae Sone on 11/13/23.
//

import UIKit

class PCell: UITableViewCell {

    @IBOutlet weak var Label : PaddingLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

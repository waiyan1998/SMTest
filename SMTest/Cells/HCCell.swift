//
//  HCCell.swift
//  SMTest
//
//  Created by Wai Yan Pyae Sone on 11/12/23.
//

import UIKit

class HCCell: UICollectionViewCell {

    @IBOutlet weak var label : UILabel!
    override var isSelected: Bool{
      
        didSet{
            print(isSelected)
            if isSelected{
                self.label.textColor = .white
                self.backgroundColor = UIColor(hexString: "3A4B65")
                
            }else{
                self.label.textColor = UIColor(hexString: "3A4B65")
                self.backgroundColor = .clear
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 15
        self.layer.borderColor =  UIColor(hexString: "3A4B65").cgColor
        self.layer.borderWidth = 0.5
        // Initialization code
    }

}

//
//  MyTableViewCell.swift
//  E-commerce
//
//  Created by Başak Ertuğrul on 17.10.2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var productSubcategory: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var innerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.innerView.layer.cornerRadius = 10
        self.innerView.layer.masksToBounds = false
        self.innerView.layer.shadowColor = UIColor.black.cgColor
        self.innerView.layer.shadowOffset = CGSize(width: 0, height: 3);
        self.innerView.layer.shadowOpacity = 0.5
        self.innerView.layer.borderWidth = 1.0
        self.innerView.layer.borderColor = UIColor.clear.cgColor
//        self.innerView.backgroundColor =  UIColor(rgb: 0x86BBD8)
        self.innerView.backgroundColor =  UIColor(rgb: 0xF6AE2D)
        
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2))
    }

}

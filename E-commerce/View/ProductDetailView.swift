//
//  ProductDetailView.swift
//  E-commerce
//
//  Created by Başak Ertuğrul on 18.10.2021.
//

import UIKit

class ProductDetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = UIColor(rgb: 0x86BBD8)
        
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3);
        self.layer.shadowOpacity = 0.5
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.backgroundColor =  UIColor(rgb: 0xF6AE2D)
        
        self.frame = self.frame.inset(by: UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2))
    }
    
}

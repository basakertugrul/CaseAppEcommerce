//
//  AddPageView.swift
//  E-commerce
//
//  Created by Başak Ertuğrul on 14.10.2021.
//

import UIKit

class AddPageView: UIView {
    
    
    let labelNames = ["Ship Mode","Country","City","State","Product ID","Category","Sub-Category","Product Name","Sales","Quantity","Discount","Profit"]
    
    func addLabel(textParam:String, y:Double) -> UILabel {
            let label = UILabel()
            label.frame = CGRect(x: 30, y: y, width: 350, height: 30)
            label.textAlignment = NSTextAlignment.left
    //        label.backgroundColor = UIColor(rgb: 0x2F4858)
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 5
            label.textColor = UIColor(rgb: 0x2F4858)
            label.font = UIFont.boldSystemFont(ofSize: 20.0)
            label.text = textParam
            return label
    }
    
    func addTextField(y:Double) -> UITextField {
        let field = UITextField()
        field.frame = CGRect(x: 30, y: y, width: 350, height: 30)
        field.textAlignment = NSTextAlignment.left
        field.backgroundColor = UIColor(rgb: 0x2F4858)
        field.layer.masksToBounds = true
        field.layer.cornerRadius = 5
        field.textColor = .white
        field.font = UIFont.systemFont(ofSize: 18.00)
        return field
    }
    
    
    
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
        
        for (index,item) in labelNames.enumerated() {
            let newy = Double(130 + (index * 80))
            addSubview(addLabel(textParam: item,  y: newy))
            addSubview(addTextField( y: newy + 30.0))
        }
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

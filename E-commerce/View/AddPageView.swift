//
//  AddPageView.swift
//  E-commerce
//
//  Created by Başak Ertuğrul on 14.10.2021.
//

import UIKit

class AddPageView: UIView {
    
    let labelNames = ["Category","City","Country","Discount","Product ID","Product Name","Profit","Quantity","Sales","Ship Mode","State","Sub-Category",]
    
    var textFieldArray: [UITextField] = []
    var vc = AddViewController()
    
    func addLabel(textParam:String, y:Double) -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: 25, y: y, width: 350, height: 30)
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
        field.frame = CGRect(x: 25, y: y, width: 350, height: 30)
        field.textAlignment = NSTextAlignment.left
        field.backgroundColor = UIColor(rgb: 0x2F4858)
        field.layer.masksToBounds = true
        field.layer.cornerRadius = 5
        field.textColor = .white
        field.font = UIFont.systemFont(ofSize: 18.00)
        field.text = "asdf"
        return field
    }
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 135, y: 980, width: 100, height: 50)
        button.backgroundColor = UIColor(rgb: 0xF26419)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        button.setTitle("UPLOAD", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(pressed(_ :)), for: .touchUpInside)
        return button
    }()
    
    @objc func pressed(_ sender: UIButton) {
        var emptyFields:[Int] = []
        var dataFetch:[String] = []
        for (index,item) in textFieldArray.enumerated() {
            dataFetch.append(item.text ?? "")
            
            if item.text == "" {
                print(String(index) + " boş")
                emptyFields.append(index)
            }
        }
        if !emptyFields.isEmpty{
            let view = self.warningDisplay()
            UIView.animate(withDuration: 4, delay: 0.0, options: [.curveEaseOut, .autoreverse], animations: {
                self.addSubview(view)
            }, completion: nil)
            let seconds = 4.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                view.removeFromSuperview()
            }
        }
        else {
            vc.dataUpdate(data: dataFetch)
        }
    }
    
    func successFunc() {
        let view = self.successLoading()
        UIView.animate(withDuration: 4, delay: 0.0, options: [.curveEaseOut, .autoreverse], animations: {
            self.addSubview(view)
        }, completion: nil)
        let seconds = 4.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            view.removeFromSuperview()
        }
    }
    
    func successLoading() -> UIView {
        
        for item in textFieldArray {
            item.text = ""
        }
        
        let background = UIView()
        background.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        background.backgroundColor = .black.withAlphaComponent(0.1)
        
        let view = UIButton()
        view.frame = CGRect(x: 50, y: 400, width: 335, height: 50)
        view.backgroundColor = UIColor(rgb: 0xF26419)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.setTitleColor(.black, for: .normal)
        view.setTitle("You have successfully added your product.", for: .normal)
        background.addSubview(view)
        return background
    }
    
    func errorFunc() {
        let view = self.errorLoading()
        UIView.animate(withDuration: 4, delay: 0.0, options: [.curveEaseOut, .autoreverse], animations: {
            self.addSubview(view)
        }, completion: nil)
        let seconds = 4.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            view.removeFromSuperview()
        }
    }
    
    func warningDisplay() -> UIView {
        let background = UIView()
        background.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        background.backgroundColor = .black.withAlphaComponent(0.1)
        
        let view = UIButton()
        view.frame = CGRect(x: 50, y: 400, width: 335, height: 50)
        view.backgroundColor = UIColor(rgb: 0xF26419)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.setTitleColor(.black, for: .normal)
        view.setTitle("Please fill in all the fields.", for: .normal)
        background.addSubview(view)
        return background
    }
    
    func errorLoading() -> UIView {
        let background = UIView()
        background.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        background.backgroundColor = .black.withAlphaComponent(0.1)
        
        let view = UIButton()
        view.frame = CGRect(x: 50, y: 400, width: 335, height: 50)
        view.backgroundColor = UIColor(rgb: 0xF26419)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.setTitleColor(.black, for: .normal)
        view.setTitle("An error has occured. Please try again later.", for: .normal)
        background.addSubview(view)
        return background
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
        
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        let scrollView = UIScrollView(frame: CGRect(x: 15, y: 130, width: screenWidth - 30, height: screenHeight))
        scrollView.backgroundColor = .black.withAlphaComponent(0.05)
        scrollView.layer.masksToBounds = true
        scrollView.layer.cornerRadius = 10
        
        for (index,item) in labelNames.enumerated() {
            let newy = Double(10 + (index * 80))
            scrollView.addSubview(addLabel(textParam: item,  y: newy))
            self.textFieldArray.append(addTextField( y: newy + 30.0))
            scrollView.addSubview(self.textFieldArray[index])
        }
        
        scrollView.addSubview(addButton)
        scrollView.contentSize = CGSize(width: screenWidth - 30, height: 1180)
        addSubview(scrollView)
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

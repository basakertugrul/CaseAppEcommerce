//
//  ProductDetailViewController.swift
//  E-commerce
//
//  Created by Başak Ertuğrul on 18.10.2021.
//

import UIKit
import Firebase

class ProductDetailViewController: UIViewController {

    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var productSubcategory: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQuantity: UILabel!
    @IBOutlet weak var productProfit: UILabel!
    @IBOutlet weak var ProductDiscount: UILabel!
    @IBOutlet weak var productCountry: UILabel!
    @IBOutlet weak var productCity: UILabel!
    @IBOutlet weak var productState: UILabel!
    @IBOutlet weak var productID: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    var product: Order? = nil
    var productPicture: UIImage? = nil
    
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ref = Database.database().reference(withPath: "Orders")
        
        self.productName.text = "Product Name: \(String(describing: self.product!.productName))"
        self.productCategory.text = "Product Category: \(String(describing: self.product!.category))"
        self.productSubcategory.text = "Product Subcategory: \(String(describing: self.product!.subCategory))"
        self.productPrice.text = "Product Price: \(String(describing: self.product!.sales))"
        self.productQuantity.text = "Product Quantity: \(String(describing: self.product!.quantity))"
        self.productProfit.text = "Product Profit: \(String(describing: self.product!.profit))"
        self.ProductDiscount.text = "Product Discount: \(String(describing: self.product!.discount))"
        self.productCountry.text = "Product Country: \(String(describing: self.product!.country))"
        self.productCity.text = "Product City: \(String(describing: self.product!.city))"
        self.productState.text = "Product State: \(String(describing: self.product!.state))"
        self.productID.text = "ProductID: \(String(describing: self.product!.productID))"
        self.productImage.image = self.productPicture
    }
    
    @IBAction func GoBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteProductButton(_ sender: Any) {
        let item = self.product
        item?.ref?.removeValue()
        self.GoBackButton((Any).self)
    }
}

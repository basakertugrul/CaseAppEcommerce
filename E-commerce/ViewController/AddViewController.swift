//
//  AddViewController.swift
//  E-commerce
//
//  Created by Başak Ertuğrul on 14.10.2021.
//

import UIKit
import Firebase

class AddViewController: UIViewController {
    
    var data: [String] = []
    var ref: DatabaseReference?
    
    @IBOutlet var subView: AddPageView!
    
    func dataUpdate(data: [String]){
        self.data = data
        self.addData(data: self.data)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("geldik")
        
    }
    
    @IBAction func GoBackButton(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        vc!.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true)
    }
    
    func addData(data: [String]) {
        print(myGlobalID)
        ref = Database.database().reference(withPath: "Orders")
        let item = Order(rowID: String(myGlobalID + 1), shipMode: data[9], country: data[2], city: data[1], state: data[10], productID: data[4], category: data[0], subCategory: data[11], productName: data[5], sales: data[8], quantity: data[7], discount: data[3], profit: data[6])
        self.ref?.child(String(myGlobalID)).setValue(item.toAnyObject())
        { (err, ref) in
//            AddPageView().errorFunc()
            return
        }
        myGlobalID += 1
//        AddPageView().successFunc()
    }
    
}

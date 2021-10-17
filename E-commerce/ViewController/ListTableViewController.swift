//
//  ListTableViewController.swift
//  E-commerce
//
//  Created by Başak Ertuğrul on 14.10.2021.
//

import UIKit
import Firebase

class ListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var lists: [Order] = []
    
    @IBOutlet weak var tableView: UITableView!
    let reuseIdentifier = "listCellIdentifier"
    
    let categoryImages:[String: UIImage?] = ["Bookcases": UIImage(named: "Bookcases.png"), "Chairs": UIImage(named: "Chairs.png"), "Labels": UIImage(named: "Labels.png"), "Tables": UIImage(named:"Tables.png"), "Storage": UIImage(named:"Storage.png"), "Furnishings": UIImage(named:"Furnishings.png"), "Art": UIImage(named:"Art.png"), "Phones": UIImage(named:"Phones.png"), "Binders": UIImage(named:"Binders.png"), "Appliances": UIImage(named:"Appliances.png"), "Paper": UIImage(named:"Paper.png"), "Accessories": UIImage(named:"Accessories.png"), "Envelopes": UIImage(named:"Envelopes.png"), "Fasteners": UIImage(named:"Fasteners.png"), "Supplies": UIImage(named:"Supplies.png"), "Machines":  UIImage(named:"Machines.png"), ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isUserInteractionEnabled = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.allowsSelection = true
        self.tableView.delaysContentTouches = false
        
        if lists.isEmpty {
            let ref = Database.database().reference(withPath: "Orders")
            ref.observe(.value, with: { snapshot in
                var newLists: [Order] = []
                for child in snapshot.children {
                    if let snapshot = child as? DataSnapshot,
                       let newOrder = Order(snapshot: snapshot) {
                        newLists.append(newOrder)
                        if Int(newOrder.rowID)! > myGlobalID {
                            myGlobalID = Int(newOrder.rowID)!
                        }
                    }
                }
                self.lists = newLists
                print(self.lists)
                self.tableView.reloadData()
            })
        }
    }
    
    @IBAction func GoBackButton(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        vc!.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as! MyTableViewCell
        cell.productName?.text = self.lists[indexPath.row].productName
        cell.productName?.font = .boldSystemFont(ofSize: 18)
        cell.productCategory?.text = self.lists[indexPath.row].category
        cell.productSubcategory?.text = self.lists[indexPath.row].subCategory
        cell.productPrice?.text = self.lists[indexPath.row].sales
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        
        if let val = self.categoryImages[self.lists[indexPath.row].subCategory] {
            cell.productImage.image = val
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lists.count
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController
        vc!.modalPresentationStyle = .fullScreen
        vc!.product = self.lists[indexPath.row]
        if let val = self.categoryImages[self.lists[indexPath.row].subCategory] {
            vc!.productPicture = val!
        }
        self.present(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 150.0
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

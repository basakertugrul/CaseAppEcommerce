//
//  ViewController.swift
//  E-commerce
//
//  Created by Başak Ertuğrul on 13.10.2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var lists: [Order] = []
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ref = Database.database().reference(withPath: "Orders")
        
        ref?.observe(.value, with: { snapshot in
            var newLists: [Order] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let newOrder = Order(snapshot: snapshot) {
                    newLists.append(newOrder)
                }
            }
            self.lists = newLists
            //            self.tableView.reloadData()
            print(self.lists)
        })
    }
}

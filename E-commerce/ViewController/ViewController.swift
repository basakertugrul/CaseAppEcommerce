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
    
    var imageview = UIImageView(image: UIImage(named: "MovePic"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.addGif(name: "Start", x: -100.0, y: 200.0, width: (self.view.frame.size.width + 200.0), height: 450.0)
        self.imageview.frame = CGRect(x: 260, y: 50, width: 200, height: 150)
        self.view.addSubview(self.imageview)
        
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
    
    @IBAction func AddButton(_ sender: Any) {
        self.imageview.removeFromSuperview()
        self.addGif(name: "Move", x: 260, y: 50, width: 200, height: 150)
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddViewController") as? AddViewController
            vc!.modalPresentationStyle = .fullScreen
            self.present(vc!, animated: true)
        }
    }
    
    @IBAction func ListButton(_ sender: Any) {
        self.imageview.removeFromSuperview()
        self.addGif(name: "Move", x: 260, y: 50, width: 200, height: 150)
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ListTableViewController") as? ListTableViewController
            vc!.modalPresentationStyle = .fullScreen
            self.present(vc!, animated: true)
        }
    }
    
    func addGif(name: String, x:Double, y:Double, width: Double, height: Double) {
        let gif = UIImage.gifImageWithName(name)
        let imageView = UIImageView(image: gif)
        imageView.frame = CGRect(x: x, y: y, width: width, height: height)
        view.addSubview(imageView)
    }
    
}

//
//  ProductDataModel.swift
//  E-commerce
//
//  Created by Başak Ertuğrul on 13.10.2021.
//

import Foundation
import Firebase


struct Order {
    let ref: DatabaseReference?
    let rowID, shipMode, country, city: String
    let state, productID, category, subCategory: String
    let productName, sales, quantity, discount: String
    let profit: String
    
    
    init(rowID: String, shipMode: String, country: String, city: String, state: String, productID: String , category: String, subCategory: String, productName: String, sales: String, quantity: String, discount: String, profit: String){
        self.ref = nil
        self.rowID = rowID
        self.shipMode = shipMode
        self.country = country
        self.city = city
        self.state = state
        self.productID = productID
        self.category = category
        self.subCategory = subCategory
        self.productName = productName
        self.sales = sales
        self.quantity = quantity
        self.discount = discount
        self.profit = profit
    }
    
    init?(snapshot: DataSnapshot){
        guard
            let value = snapshot.value as? [String:AnyObject],
            let rowID = value["Row ID"] as? String,
            let shipMode = value["Ship Mode"] as? String,
            let country = value["Country"] as? String,
            let city = value["City"] as? String,
            let state = value["State"] as? String,
            let productID = value["Product ID"] as? String,
            let category = value["Category"] as? String,
            let subCategory = value["Sub-Category"] as? String,
            let productName = value["Product Name"] as? String,
            let sales = value["Sales"] as? String,
            let quantity = value["Quantity"] as? String,
            let discount = value["Discount"] as? String,
            let profit = value["Profit"] as? String
        else {
            return nil
        }
        self.ref = snapshot.ref
        self.rowID = rowID
        self.shipMode = shipMode
        self.country = country
        self.city = city
        self.state = state
        self.productID = productID
        self.category = category
        self.subCategory = subCategory
        self.productName = productName
        self.sales = sales
        self.quantity = quantity
        self.discount = discount
        self.profit = profit
    }
    
    func toAnyObject() -> Any {
        return [
            "Row ID": rowID,
            "Ship Mode": shipMode,
            "Country": country,
            "City": city,
            "State": state,
            "Product ID": productID,
            "Category": category,
            "Sub-Category": subCategory,
            "Product Name": productName,
            "Sales": sales,
            "Quantity": quantity,
            "Discount": discount,
            "Profit": profit
        ]
    }
}

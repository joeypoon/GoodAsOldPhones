//
//  CartTableViewController.swift
//  GoodAsOldPhones
//
//  Created by Joey Poon on 3/6/16.
//  Copyright © 2016 Joey Poon. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    
    var ordersInCart: [Order]?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableHeaderView = headerView
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        ordersInCart = Orders.readOrdersFromArchive()
        if(ordersInCart == nil) {
            ordersInCart = []
        }
        
        tableView.reloadData()
        
        updateTotal()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersInCart?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CartCell", forIndexPath: indexPath)
        
        if let order = ordersInCart?[indexPath.row] {
            cell.textLabel?.text = order.product?.name
            cell.detailTextLabel?.text = String(order.product?.price)
        }
        
        return cell
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            ordersInCart?.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            if let orders = ordersInCart {
                Orders.saveOrdersToArchive(orders)
            }
            updateTotal()
        }
    }
    
    func updateTotal() -> Void {
        if let orders = ordersInCart {
            var total: Double = 0.0
            for order in orders {
                if let price = order.product?.price {
                    total = total + price
                }
            }
            totalLabel.text = String(total)
        }
    }

}

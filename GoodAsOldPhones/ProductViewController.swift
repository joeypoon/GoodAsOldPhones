//
//  ProductViewController.swift
//  GoodAsOldPhones
//
//  Created by Joey Poon on 3/4/16.
//  Copyright © 2016 Joey Poon. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!

    var productName = String?()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productNameLabel.text = productName
        productImageView.image = UIImage(named: "phone-fullscreen3")
    }
    
    @IBAction func addToCartPressed(sender: AnyObject) {
        print("Button tapped")
    }
    
}

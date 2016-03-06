//
//  Order.swift
//  GoodAsOldPhones
//
//  Created by Joey Poon on 3/6/16.
//  Copyright © 2016 Joey Poon. All rights reserved.
//

import UIKit

class Order: NSObject, NSCoding {
    var product: Product?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.product = aDecoder.decodeObjectForKey("product") as? Product
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(product, forKey: "product")
    }
}

//
//  ContactViewController.swift
//  GoodAsOldPhones
//
//  Created by Joey Poon on 3/4/16.
//  Copyright © 2016 Joey Poon. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(scrollView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        scrollView.contentSize = CGSizeMake(375, 800)
    }

}

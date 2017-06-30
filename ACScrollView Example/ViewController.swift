//
//  ViewController.swift
//  ACScrollView Example
//
//  Created by Andrew Cope on 6/30/17.
//  Copyright © 2017 thecope. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ACScrollViewDataSource {

    @IBOutlet weak var scrollView: ACScrollView!

    // our data in this example:
    var colors = [UIColor.blue, UIColor.green, UIColor.yellow, UIColor.red]
    
    override func viewDidLoad() {
        // Make sure you override scrollViewDataSource, not delegate.
        scrollView.scrollViewDataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollView.scrollToCenter() // To-Do: find way to avoid this!
    }
    
    // MARK: ACScrollViewDataSource Methods
    
    func numPagesIn(scrollView:ACScrollView) -> Int {
        return colors.count
    }
    
    func viewFor(page:Int, within scrollView:ACScrollView) -> UIView {
        //use this method to configure page of ACScrollView
        
        let view = UIView()
        view.backgroundColor = colors[page]
        return view
    }
    
    
}


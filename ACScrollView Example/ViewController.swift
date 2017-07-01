//
//  ViewController.swift
//  ACScrollView Example
//
//  Created by Andrew Cope on 6/30/17.
//  Copyright © 2017 thecope. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ACScrollViewDataSource, ACScrollViewDelegate {

    @IBOutlet weak var scrollView: ACScrollView!

    // the data in this example:
    var colors = [UIColor.blue, UIColor.green, UIColor.yellow, UIColor.red]
    
    override func viewDidLoad() {
        scrollView.scrollViewDelegate = self
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
    
// MARK: ACScrollViewDelegate Methods
    
    func scrollViewDidScrollTo(location: CGPoint, within scrollView: ACScrollView) {
        print("Did scroll to x coordinate: \(location.x)")
    }
    
    func scrollViewDidScrollTo(page: Int, within scrollView: ACScrollView) {
        print("Did scroll to page: \(page)")
    }
    
    
}


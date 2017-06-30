//
//  ACScrollView.swift
//  ACScrollView Example
//
//  Created by Andrew Cope on 6/30/17.
//  Copyright © 2017 thecope. All rights reserved.
//

import UIKit

// ACScrollView is a subclass of a paged UIScrollView which only loads a few pages at time
// This allows for fast loading and infinite scroll
//
// Specify the views within an ACScrollView by setting its data source object

protocol ACScrollViewDataSource {
    func numPagesIn(scrollView:ACScrollView) -> Int
    func viewFor(page:Int, within scrollView:ACScrollView) -> UIView
}

class ACScrollView: UIScrollView, UIScrollViewDelegate {

    enum ScrollDirection {
        case forward
        case backward
        case none
    }
    
    internal var leftView = UIView()
    internal var centerView = UIView()
    internal var rightView = UIView()
    internal var currentPage = 0
    
    var scrollViewDataSource: ACScrollViewDataSource? = nil {
        didSet {
            // initialize views when setting new data source
            
            if scrollViewDataSource != nil {
                currentPage = 0
                loadDataForPage(number: currentPage)
                scrollToCenter()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        isPagingEnabled = true
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        delegate = self
        setUpSubviews() //from layout extension
    }
    
    internal func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let scrollDirection = getScrollDirection()
        
        switch scrollDirection {
        case .forward:
            currentPage = getPageNum(after: currentPage)
        case .backward:
            currentPage = getPageNum(before: currentPage)
        case .none: return;
        }
        
        loadDataForPage(number: currentPage)
        scrollToCenter()
    }
    
    
    internal func loadDataForPage(number pageNum:Int) {
        
        if let scrollViewDataSource = scrollViewDataSource {

            let leftViewContents = scrollViewDataSource.viewFor(page: getPageNum(before:pageNum), within:self)
            let rightViewContents = scrollViewDataSource.viewFor(page: getPageNum(after:pageNum), within:self)
            let centerViewContents = scrollViewDataSource.viewFor(page: pageNum, within:self)
            
            updateContentsOf(page: leftView, with: leftViewContents)
            updateContentsOf(page: rightView, with: rightViewContents)
            updateContentsOf(page: centerView, with: centerViewContents)
        }
    }

    //Mark: For Your Convenience
    
    internal func scrollToCenter() {
        scrollRectToVisible(CGRect(x: frame.width, y: 0, width: frame.width, height: frame.height), animated: false)
    }
    
    internal func updateContentsOf(page:UIView, with subview:UIView) {
        for subview in page.subviews { subview.removeFromSuperview() }
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        page.addSubview(subview)
        
        let top = subview.topAnchor.constraint(equalTo: page.topAnchor)
        let bottom = subview.bottomAnchor.constraint(equalTo: page.bottomAnchor)
        let left = subview.leftAnchor.constraint(equalTo: page.leftAnchor)
        let right = subview.rightAnchor.constraint(equalTo: page.rightAnchor)
        
        page.addConstraints([top, bottom, left, right])
    }
    
    internal func getScrollDirection() -> ScrollDirection {
        if contentOffset.x == 0 { return .backward }
        if contentOffset.x == frame.width { return .none }
        return .forward
    }
    
    internal func getPageNum(after page:Int) -> Int {
        if let scrollViewDataSource = scrollViewDataSource {
            let numPages = scrollViewDataSource.numPagesIn(scrollView: self)
            return (page + 1) % numPages
        }
        return 0
    }
    
    internal func getPageNum(before page:Int) -> Int {
        if let scrollViewDataSource = scrollViewDataSource {
            let numPages = scrollViewDataSource.numPagesIn(scrollView: self)
            return page > 0 ? page - 1 : numPages - 1
        }
        return 0
    }
    
}

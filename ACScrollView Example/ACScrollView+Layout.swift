//
//  ACScrollView+Layout.swift
//  ACScrollView Example
//
//  Created by Andrew Cope on 6/30/17.
//  Copyright © 2017 thecope. All rights reserved.
//

import UIKit

extension ACScrollView {
    
    internal func setUpSubviews() {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        leftView = UIView()
        leftView.translatesAutoresizingMaskIntoConstraints = false
        
        centerView = UIView()
        centerView.translatesAutoresizingMaskIntoConstraints = false
        
        rightView = UIView()
        rightView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(containerView)
        containerView.addSubview(leftView)
        containerView.addSubview(centerView)
        containerView.addSubview(rightView)
        
        // container view constraints
        let container_left = self.leftAnchor.constraint(equalTo: containerView.leftAnchor)
        let container_right = self.rightAnchor.constraint(equalTo: containerView.rightAnchor)
        let container_top = self.topAnchor.constraint(equalTo: containerView.topAnchor)
        let container_bottom = self.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        let container_height = self.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        let container_width = self.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: (1/3))
        
        self.addConstraints([container_left, container_right, container_top,
                                      container_bottom, container_height, container_width])
        
        
        // left View constraints
        let left_left = containerView.leftAnchor.constraint(equalTo: leftView.leftAnchor)
        let left_right = centerView.leftAnchor.constraint(equalTo: leftView.rightAnchor)
        let left_top = containerView.topAnchor.constraint(equalTo: leftView.topAnchor)
        let left_bottom = containerView.bottomAnchor.constraint(equalTo: leftView.bottomAnchor)
        
        containerView.addConstraints([left_left, left_right, left_top, left_bottom])
        
        // center view constraints
        let center_left = leftView.rightAnchor.constraint(equalTo: centerView.leftAnchor)
        let center_right = rightView.leftAnchor.constraint(equalTo: centerView.rightAnchor)
        let center_top = containerView.topAnchor.constraint(equalTo: centerView.topAnchor)
        let center_bottom = containerView.bottomAnchor.constraint(equalTo: centerView.bottomAnchor)
        
        containerView.addConstraints([center_left, center_right, center_top, center_bottom])
        
        // right view constraints
        let right_left = centerView.rightAnchor.constraint(equalTo: rightView.leftAnchor)
        let right_right = containerView.rightAnchor.constraint(equalTo: rightView.rightAnchor)
        let right_top = containerView.topAnchor.constraint(equalTo: rightView.topAnchor)
        let right_bottom = containerView.bottomAnchor.constraint(equalTo: rightView.bottomAnchor)
        
        containerView.addConstraints([right_left, right_right, right_top, right_bottom])
        
        
        // equal widths
        let right_width = rightView.widthAnchor.constraint(equalTo: centerView.widthAnchor)
        let left_width = leftView.widthAnchor.constraint(equalTo: centerView.widthAnchor)
        
        containerView.addConstraints([right_width, left_width])
        
    }

    
}

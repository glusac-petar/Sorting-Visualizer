//
//  UIView+Ext.swift
//  Sorting Visualizer
//
//  Created by Petar Glusac on 6.3.21..
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
}

//
//  SVSegmentedControl.swift
//  Sorting Visualizer
//
//  Created by Petar Glusac on 6.3.21..
//

import UIKit

class SVSegmentedControl: UISegmentedControl {

    override init(items: [Any]?) {
        super.init(items: items)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .semibold)], for: .normal)
        selectedSegmentIndex = 0
        selectedSegmentTintColor = .svBlack
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

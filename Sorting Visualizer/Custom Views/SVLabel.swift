//
//  SVLabel.swift
//  Sorting Visualizer
//
//  Created by Petar Glusac on 6.3.21..
//

import UIKit

class SVLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String) {
        self.init(frame: .zero)
        self.text = text
    }
    
    private func configure() {
        textColor = .label
        textAlignment = .left
        font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

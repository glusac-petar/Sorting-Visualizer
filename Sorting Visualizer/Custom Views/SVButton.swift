//
//  SVButton.swift
//  Sorting Visualizer
//
//  Created by Petar Glusac on 6.3.21..
//

import UIKit

class SVButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }
    
    private func configure() {
        layer.cornerRadius = 8
        layer.borderWidth = 2
        layer.borderColor = UIColor.svGray.cgColor
        backgroundColor = .svBlack
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

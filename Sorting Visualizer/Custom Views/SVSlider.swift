//
//  SVSlider.swift
//  Sorting Visualizer
//
//  Created by Petar Glusac on 6.3.21..
//

import UIKit

class SVSlider: UISlider {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(minimumValue: Float, maximumValue: Float, value: Float) {
        self.init(frame: .zero)
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        self.value = value
    }
    
    private func configure() {
        thumbTintColor = .white
        minimumTrackTintColor = .white
        maximumTrackTintColor = .svGray
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

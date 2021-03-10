//
//  SVCell.swift
//  Sorting Visualizer
//
//  Created by Petar Glusac on 6.3.21..
//

import UIKit

class SVCell: UICollectionViewCell {
    
    static let reuseID = "SVCell"
    
    private var barView: UIView!
    private var barViewHeightConstraint: NSLayoutConstraint!
    
    var barValue: Int = 0 {
        didSet {
            barViewHeightConstraint.constant = calculateBarViewHeight(for: barValue)
        }
    }
    
    var barColor: UIColor = .white {
        didSet { barView.backgroundColor = barColor }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func calculateBarViewHeight(for value: Int) -> CGFloat {
        return contentView.bounds.height * CGFloat(value) / 100
    }
    
    private func configure() {
        barView = UIView()
        barView.backgroundColor = .white
        barView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(barView)
        barViewHeightConstraint = barView.heightAnchor.constraint(equalToConstant: 0)

        NSLayoutConstraint.activate([
            barView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            barView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            barView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            barViewHeightConstraint
        ])
    }
    
}

//
//  SortingViewController+Layout.swift
//  Sorting Visualizer
//
//  Created by Petar Glusac on 6.3.21..
//

import UIKit

extension SortingViewController {
    
    func layoutUI() {
        view.addSubviews(collectionView, arrayLengthLabel, arrayLengthSlider, sortSegmentedControl, shuffleButton, sortButton)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sortButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            sortButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            sortButton.widthAnchor.constraint(equalToConstant: 90),
            sortButton.heightAnchor.constraint(equalToConstant: 35),
            
            shuffleButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            shuffleButton.trailingAnchor.constraint(equalTo: sortButton.leadingAnchor, constant: -10),
            shuffleButton.widthAnchor.constraint(equalToConstant: 90),
            shuffleButton.heightAnchor.constraint(equalToConstant: 35),
            
            sortSegmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            sortSegmentedControl.trailingAnchor.constraint(equalTo: shuffleButton.leadingAnchor, constant: -10),
            sortSegmentedControl.widthAnchor.constraint(equalToConstant: 260),
            sortSegmentedControl.heightAnchor.constraint(equalToConstant: 35),
            
            arrayLengthLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            arrayLengthLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            arrayLengthLabel.widthAnchor.constraint(equalToConstant: 110),
            arrayLengthLabel.heightAnchor.constraint(equalToConstant: 35),
            
            arrayLengthSlider.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            arrayLengthSlider.leadingAnchor.constraint(equalTo: arrayLengthLabel.trailingAnchor, constant: 7.5),
            arrayLengthSlider.trailingAnchor.constraint(equalTo: sortSegmentedControl.leadingAnchor, constant: -7.5),
            arrayLengthSlider.heightAnchor.constraint(equalToConstant: 35),
            
            collectionView.topAnchor.constraint(equalTo: sortButton.bottomAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
    }
    
}

//
//  UIHelper.swift
//  Sorting Visualizer
//
//  Created by Petar Glusac on 6.3.21..
//

import UIKit

fileprivate let window = UIApplication.shared.windows[0]

enum UIHelper {
    
    static func createFlowLayout(size: Int) -> UICollectionViewFlowLayout {
        let availableHeight = window.bounds.height - window.safeAreaInsets.top - window.safeAreaInsets.bottom - 90
        let availableWidth = window.bounds.width - window.safeAreaInsets.left - window.safeAreaInsets.right - 20
        
        let size = CGFloat(size)
        let padding: CGFloat = 2.5
        let itemWidth = (availableWidth-(size+1)*padding)/size
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = padding
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: padding, bottom: 0, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: availableHeight)
        
        return flowLayout
    }
    
}

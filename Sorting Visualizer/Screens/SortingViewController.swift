//
//  SortingViewController.swift
//  Sorting Visualizer
//
//  Created by Petar Glusac on 5.3.21..
//

import UIKit

class SortingViewController: UIViewController {
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createFlowLayout(size: 40))
    var arrayLengthLabel = SVLabel(text: "Array Length:")
    var arrayLengthSlider = SVSlider(minimumValue: 10, maximumValue: 100, value: 40)
    var sortSegmentedControl = SVSegmentedControl(items: ["Selection", "Insertion", "Bubble"])
    var shuffleButton = SVButton(title: "Shuffle")
    var sortButton = SVButton(title: "Sort")

    private var array = Array.generateRandomArray(length: 40)
    private var sortingManager = SortingManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .svBlack
        
        layoutUI()
        configureCollectionView()
        configureArraySizeSlider()
        configureShuffleButton()
        configureSortButton()
        sortingManager.delegate = self
    }
    
    private func configureCollectionView() {
        collectionView.register(SVCell.self, forCellWithReuseIdentifier: SVCell.reuseID)
        collectionView.backgroundColor = .svBlack
        collectionView.dataSource = self
    }
    
    private func configureArraySizeSlider() { arrayLengthSlider.addTarget(self, action: #selector(changeArrayLength), for: .valueChanged) }
    
    private func configureShuffleButton() { shuffleButton.addTarget(self, action: #selector(shuffle), for: .touchUpInside) }
    
    private func configureSortButton() { sortButton.addTarget(self, action: #selector(sort), for: .touchUpInside) }
    
    @objc private func changeArrayLength() {
        let currentValue = Int(arrayLengthSlider.value)
        if array.count == currentValue { return }
        
        array = Array.generateRandomArray(length: currentValue)
        DispatchQueue.main.async {
            self.collectionView.collectionViewLayout = UIHelper.createFlowLayout(size: currentValue)
            self.collectionView.reloadData()
        }
    }
    
    @objc private func shuffle() {
        array = array.shuffled()
        DispatchQueue.main.async { self.collectionView.reloadData() }
    }
    
    @objc private func sort() {
        let selectedSort = sortSegmentedControl.titleForSegment(at: sortSegmentedControl.selectedSegmentIndex)!
        disableButtons()
        switch selectedSort {
        case "Selection":
            sortingManager.selectionSort(array: array) { [weak self] (sortedArray) in
                guard let self = self else { return }
                self.array = sortedArray
                self.enableButtons()
            }
        case "Insertion":
            sortingManager.insertionSort(array: array) { [weak self] (sortedArray) in
                guard let self = self else { return }
                self.array = sortedArray
                self.enableButtons()
            }
        default:
            sortingManager.bubbleSort(array: array) { [weak self] (sortedArray) in
                guard let self = self else { return }
                self.array = sortedArray
                self.enableButtons()
            }
        }
    }
    
    private func disableButtons() {
        DispatchQueue.main.async {
            self.arrayLengthSlider.isEnabled = false
            self.shuffleButton.isEnabled = false
            self.sortButton.isEnabled = false
        }
    }
    
    private func enableButtons() {
        DispatchQueue.main.async {
            self.arrayLengthSlider.isEnabled = true
            self.shuffleButton.isEnabled = true
            self.sortButton.isEnabled = true
        }
    }
    
}

extension SortingViewController: SortingManagerDelegate {
    
    func select(index: Int, delay: Int, color: UIColor) {
        if delay > 0 {
            DispatchQueue.main.async {
                let cell = self.collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as! SVCell
                cell.barColor = color
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(delay)) {
                let cell = self.collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as! SVCell
                cell.barColor = .white
            }
        } else {
            DispatchQueue.main.async {
                let cell = self.collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as! SVCell
                cell.barColor = color
            }
        }
    }
    
    func swap(sort: Sort, firstIndex: Int, secondIndex: Int) {
        DispatchQueue.main.async {
            let firstCell = self.collectionView.cellForItem(at: IndexPath(item: firstIndex, section: 0)) as! SVCell
            let secondCell = self.collectionView.cellForItem(at: IndexPath(item: secondIndex, section: 0)) as! SVCell
            
            if sort == .selection { firstCell.barColor = .white }
            
            let tmp = firstCell.barValue
            firstCell.barValue = secondCell.barValue
            secondCell.barValue = tmp
        }
    }
    
}

extension SortingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SVCell.reuseID, for: indexPath) as! SVCell
        cell.barValue = array[indexPath.item]
        return cell
    }
    
}

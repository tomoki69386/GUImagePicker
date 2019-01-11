//
//  GUImagePickerController.swift
//  Demo
//
//  Created by 築山朋紀 on 2019/01/10.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import Photos

open class GUImagePickerController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(GUImagePickerCell.self, forCellWithReuseIdentifier: "GUImagePickerCell")
        collectionView.allowsMultipleSelection = true
        return collectionView
    }()
    
    public var maxSelectableCount: Int = Int.max
    public var minSelectableCount: Int = 1
    
    private var photoAssets = [PHAsset]()
    var isSelected: Bool = false {
        didSet {
            self.doneButton.isEnabled = self.isSelected
        }
    }
    var doneButton: UIBarButtonItem!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.frame = view.bounds
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        setBar()
        getALlPhotos()
    }
    
    private func getALlPhotos() {
        let assets = PHAsset.fetchAssets(with: .image, options: nil)
        assets.enumerateObjects { (asset, index, stop) in
            self.photoAssets.insert(asset, at: 0)
        }
    }
    
//    static func fetchSlackMessage(parameter: [String: String], completion: @escaping (APIResult) -> Void) {
//        let request = StackMessageRequest(parameter: parameter)
//        APIClient.send(request, completion: completion)
//    }
    
    
    private func setBar() {
        navigationItem.title = "select images"
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancel))
        self.navigationItem.leftBarButtonItem = cancelButton
        doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.done))
        doneButton.isEnabled = false
        self.navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func cancel() {
        self.dismiss(animated: true)
    }
    
    @objc func done() {
        self.dismiss(animated: true)
    }
    
    private func cellEvent(items: Array<IndexPath>) {
        if minSelectableCount...maxSelectableCount ~= items.count && items.count != 0 {
            self.isSelected = true
        } else {
            self.isSelected = false
        }
    }
}

extension GUImagePickerController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoAssets.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GUImagePickerCell", for: indexPath) as! GUImagePickerCell
        cell.setUp(asset: photoAssets[indexPath.row])
        return cell
    }
}

extension GUImagePickerController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedItems = collectionView.indexPathsForSelectedItems else { return }
        cellEvent(items: selectedItems)
    }
    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let selectedItems = collectionView.indexPathsForSelectedItems else { return }
        cellEvent(items: selectedItems)
    }
}

extension GUImagePickerController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.width / 3)
    }
}

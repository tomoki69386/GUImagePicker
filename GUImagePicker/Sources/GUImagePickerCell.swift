//
//  GUImagePickerCell.swift
//  Demo
//
//  Created by 築山朋紀 on 2019/01/10.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import Photos

class GUImagePickerCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        checkBoxLayout()
    }
    
    func setUp(asset: PHAsset) {
        let manager = PHImageManager()
        manager.requestImage(for: asset,
                             targetSize: CGSize(width: 9000, height: 9000),
                             contentMode: .aspectFill,
                             options: nil) { (image, info) in
                                self.imageView.image = image
        }
    }
    
    private func checkBoxLayout() {
        let bgView = UIView()
        bgView.backgroundColor = .green
        self.backgroundView = bgView
        
        imageView.frame = self.bounds
        bgView.addSubview(imageView)
        
        let boxSize = frame.width * 0.3
        
        let falseBox = CheckBoxView(size: boxSize, selected: false)
        self.addSubview(falseBox)
        
        let trueBox = CheckBoxView(size: boxSize, selected: true)
        let backView = UIView(frame: frame)
        backView.backgroundColor = .clear
        backView.addSubview(trueBox)
        self.selectedBackgroundView = backView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

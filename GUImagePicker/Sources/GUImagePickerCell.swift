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
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.frame = self.bounds
        self.addSubview(imageView)
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

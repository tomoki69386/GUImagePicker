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
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

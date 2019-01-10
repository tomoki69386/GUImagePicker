//
//  GUImageButton.swift
//  Demo
//
//  Created by 築山朋紀 on 2019/01/11.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class GUImageButton: UIButton {
    
    private let selectImage: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.isHidden = false
        return imageView
    }()
    
    override var isSelected: Bool {
        didSet {
            selectImage.isHidden = self.isSelected
        }
    }
    
    var image: UIImage? {
        didSet {
            self.setImage(image, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.addTarget(self, action: #selector(self.buttonEvent), for: .touchUpInside)
    }
    
    @objc private func buttonEvent() {
        self.isSelected.toggle()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        selectImage.frame = CGRect(x: self.frame.width / 4,
                                   y: self.frame.width / 4,
                                   width: self.frame.width / 2,
                                   height: self.frame.width / 2)
        self.addSubview(selectImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

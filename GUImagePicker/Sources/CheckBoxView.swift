//
//  File.swift
//  Demo
//
//  Created by 築山朋紀 on 2019/01/11.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class CheckBoxView: UIView {
    var selected = false
    init(size: CGFloat, selected: Bool) {
        let frame = CGRect(x: 0, y: 0, width: size, height: size)
        super.init(frame: frame)
        self.selected = selected
        self.backgroundColor = .clear
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let ovalColor: UIColor
        let ovalFrameColor: UIColor
        let checkColor: UIColor
        
        let RectCheck = CGRect(x: 5, y: 5, width: rect.width - 10, height: rect.height - 10)
        
        if self.selected {
            ovalColor = UIColor(red: 85/255, green: 185/255, blue: 1/255, alpha: 1)
            ovalFrameColor = .black
            checkColor = .white
        }else{
            ovalColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 0.2)
            ovalFrameColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 0.3)
            checkColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        }
        
        // 円 -------------------------------------
        let oval = UIBezierPath(ovalIn: RectCheck)
        
        // 塗りつぶし色の設定
        ovalColor.setFill()
        // 内側の塗りつぶし
        oval.fill()
        //枠の色
        ovalFrameColor.setStroke()
        //枠の太さ
        oval.lineWidth = 2
        // 描画
        oval.stroke()
        
        let xx = RectCheck.origin.x
        let yy = RectCheck.origin.y
        let width = RectCheck.width
        let height = RectCheck.height
        
        // チェックマークの描画 ----------------------
        let checkmark = UIBezierPath()
        //起点
        checkmark.move(to: CGPoint(x: xx + width / 6, y: yy + height / 2))
        //帰着点
        checkmark.addLine(to: CGPoint(x: xx + width / 3, y: yy + height * 7 / 10))
        checkmark.addLine(to: CGPoint(x: xx + width * 5 / 6, y: yy + height * 1 / 3))
        // 色の設定
        checkColor.setStroke()
        // ライン幅
        checkmark.lineWidth = 6
        // 描画
        checkmark.stroke()
    }
}

//
//  UIView + DashedBorder.swift
//  WeatherTestcase
//
//  Created by Alexey Sergeev on 9/5/20.
//  Copyright © 2020 Alexey Sergeev. All rights reserved.
//

import UIKit

extension UIView {
    
     private static let lineDashPattern: [NSNumber] = [2, 2]
     private static let lineDashWidth: CGFloat = 2.0

      func makeDashedBorderLine() {
        
           let path = CGMutablePath()
           let shapeLayer = CAShapeLayer()
           shapeLayer.lineWidth = UIView.lineDashWidth
           shapeLayer.strokeColor = UIColor.lightGray.cgColor
           shapeLayer.lineDashPattern = UIView.lineDashPattern
           path.addLines(between: [CGPoint(x: bounds.minX, y: bounds.height/2),
                                   CGPoint(x: bounds.maxX, y: bounds.height/2)])
           shapeLayer.path = path
           layer.addSublayer(shapeLayer)
    }
    
     func addDashedBorder() {
        
        let color = UIColor.red.cgColor

        let shapeLayer: CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width+5, height: frameSize.height+5)

        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 0.5
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [2,2]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath

        self.layer.addSublayer(shapeLayer)
    }
}

//
//  UIView.swift
//  STUSY
//
//  Created by Ramin Akhmad on 10.06.2020.
//  Copyright © 2020 Ramin Akhmad. All rights reserved.
//

import UIKit

extension UIView {
    
    enum GradientDirection {
        case topToBottom
        case bottomToTop
        case leftToRight
        case rightToLeft
        case topLeftToBottomRight
        case topRightToBottomLeft
        
        var value: (CGPoint, CGPoint) {
            switch self {
            case .topToBottom:
                return (CGPoint(x: 0.5, y: 0), CGPoint(x: 0.5, y: 1))
            case .bottomToTop:
                return (CGPoint(x: 0.5, y: 1), CGPoint(x: 0.5, y: 0))
            case .leftToRight:
                return (CGPoint(x: 0, y: 0.5), CGPoint(x: 1, y: 0.5))
            case .rightToLeft:
                return (CGPoint(x: 1, y: 0.5), CGPoint(x: 0, y: 0.5))
            case .topLeftToBottomRight:
                return (CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 1))
            case .topRightToBottomLeft:
                return (CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 0))
            }
        }
    }

func setGradientBackground(leftColor: UIColor, rightColor: UIColor, direction: GradientDirection) {
        let colorLeft = leftColor.cgColor
        let colorRight = rightColor.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorLeft, colorRight]
        gradientLayer.startPoint = direction.value.0
        gradientLayer.endPoint = direction.value.1
        gradientLayer.frame = self.bounds
        gradientLayer.name = "gradientBackground"
        
        layer.sublayers?.removeAll(where: { $0.name == "gradientBackground" })
        layer.insertSublayer(gradientLayer, at: 0)
    }

}

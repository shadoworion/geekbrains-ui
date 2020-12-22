//
//  CustomTextField.swift
//  hw1
//
//  Created by David Dakhovich on 09/12/2020.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {

    override var tintColor: UIColor! {
        didSet {
            setNeedsDisplay()
            self.textColor = .white
        }
    }
    
    override var placeholder: String? {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {

        let startingPoint   = CGPoint(x: rect.minX, y: rect.maxY)
        let endingPoint     = CGPoint(x: rect.maxX, y: rect.maxY)

        let path = UIBezierPath()

        path.move(to: startingPoint)
        path.addLine(to: endingPoint)
        path.lineWidth = 2.0

        tintColor.setStroke()

        path.stroke()
    }
}

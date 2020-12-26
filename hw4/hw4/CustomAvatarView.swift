//
//  CustomAvatarView.swift
//  hw4
//
//  Created by David Dakhovich on 19/12/2020.
//

import UIKit

@IBDesignable
class CustomAvatarView: UIView {
    @IBInspectable var shadowColor: CGColor = UIColor.black.cgColor {
        didSet {
            self.layer.shadowColor = shadowColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 10 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 1 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 150 {
        didSet {
            self.clipsToBounds = false
            self.layer.shadowOffset = CGSize.zero
            self.layer.cornerRadius = cornerRadius
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
            let imageFrame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
            let imageView: UIImageView = UIImageView(frame: imageFrame)
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = cornerRadius
            imageView.image = UIImage(named: "Avatar")
            self.addSubview(imageView)
        }
    }
}

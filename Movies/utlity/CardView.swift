//
//  CardView.swift
//  Movies
//
//  Created by iOS Developer on 25/03/21.
//


import Foundation
import UIKit

@IBDesignable
class CardView: UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.shadowRadius = newValue
            layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowRadius:CGFloat{
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
            layer.masksToBounds = false
        }
    }

    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
            layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowColor:UIColor{
        get{
            return UIColor(cgColor:layer.shadowColor ?? UIColor.darkGray.cgColor)
        }
        set{
            layer.shadowColor = newValue.cgColor
            layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
            layer.masksToBounds = false
        }
    }
    
    @IBInspectable var borderWidth:CGFloat{
        get{
            return layer.borderWidth
        }
        set{
            layer.borderWidth = newValue
          layer.masksToBounds = false
        }
    }
    
    @IBInspectable var borderColor:UIColor{
        get{
            return UIColor(cgColor:layer.shadowColor ?? UIColor.darkGray.cgColor)
        }
        set{
            layer.borderColor = newValue.cgColor
            layer.masksToBounds = false
        }
    }
    
}

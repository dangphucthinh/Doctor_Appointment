//
//  DesignableTextView.swift
//  youMed
//
//  Created by thinhdang on 11/14/20.
//

import UIKit

@IBDesignable
class DesignableTextView: UITextView {

    @IBInspectable var borderWidth : CGFloat = 0{
        didSet{
            layer.borderWidth = borderWidth
            
        }
    }
    
    @IBInspectable var borderColor : UIColor = .clear{
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var padding : CGFloat = 0{
        didSet{
            textViewPadding(Padding: padding)
        }
    }
    
    
    func textViewPadding(Padding: CGFloat){
        textContainerInset = UIEdgeInsets(top: Padding, left: Padding, bottom: 0, right: 0)
    }
}

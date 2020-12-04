//
//  LabelExtension.swift
//  youMed
//
//  Created by Oscar on 12/4/20.
//

import Foundation
import UIKit

extension UILabel{
    func roundedLabel(cornerRadius: CGFloat?, borderWidth: CGFloat?, borderCorlor: CGColor?, margin: CGFloat?) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius ?? 0
        self.layer.borderWidth = borderWidth ?? 0
        self.layer.borderColor = borderCorlor
        
        //set margin
        if let textString = self.text {
            let paragraphStyle = NSMutableParagraphStyle()
                    paragraphStyle.firstLineHeadIndent = margin ?? 0
                    paragraphStyle.headIndent = margin ?? 0
                    paragraphStyle.tailIndent = -margin!
                    let attributedString = NSMutableAttributedString(string: textString)
                    attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
                    attributedText = attributedString
                }
    }
}

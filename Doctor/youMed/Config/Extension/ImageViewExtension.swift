//
//  ImageViewExtension.swift
//  youMed
//
//  Created by thinhdang on 12/2/20.
//

import Foundation
import UIKit

extension UIImageView {
    func roundedImageView(){
        self.layer.cornerRadius = self.frame.height / 2
        self.backgroundColor = .systemBlue
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
    }
}

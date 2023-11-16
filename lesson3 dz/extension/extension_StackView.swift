//
//  extantinon_StackView.swift
//  lesson3 dz
//
//  Created by MacBookPro on 09.11.2023.
//

import Foundation
import UIKit

extension UIStackView {
    
    convenience init(view: [UIView],
                     axis: NSLayoutConstraint.Axis,
                     spasing: CGFloat,
                     alignment: Alignment) {
        self.init(arrangedSubviews: view)
        self.axis = axis
        self.spacing = spasing
        self.alignment = alignment
        
    }
}

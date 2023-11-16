//
//  extension_Switch.swift
//  lesson3 dz
//
//  Created by MacBookPro on 09.11.2023.
//

import Foundation
import UIKit

extension UISwitch {
    convenience init(onColor: UIColor, thumbColor: UIColor) {
        self.init()
        onTintColor = onColor
        thumbTintColor = thumbColor
        heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
}

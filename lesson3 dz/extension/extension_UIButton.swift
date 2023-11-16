//
//  extension_UIButton.swift
//  lesson3 dz
//
//  Created by MacBookPro on 13.11.2023.
//

import Foundation
import UIKit


extension UIButton {
    
    convenience init(color: UIColor, imageName: String) {
        self.init(type: .system)
        setBackgroundImage(UIImage(systemName: imageName), for: .normal)
        tintColor = color
        heightAnchor.constraint(equalToConstant: 35).isActive = true
        widthAnchor.constraint(equalToConstant: 35).isActive = true
    }
}



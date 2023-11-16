//
//  extension_UiView.swift
//  lesson3 dz
//
//  Created by MacBookPro on 13.11.2023.
//

import Foundation
import UIKit

extension UIView {
    
    convenience init(image: UIImageView, title: String) {
        self.init()
        let label = UILabel(text: title)
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = false
        label.textAlignment = .center
    }
}


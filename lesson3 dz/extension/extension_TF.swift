//
//  extantion_TF.swift
//  lesson3 dz
//
//  Created by MacBookPro on 09.11.2023.
//

import UIKit

extension UITextField {
    
    convenience init(placeholder: String) {
        self.init()
        self.placeholder = placeholder
        backgroundColor = .white
        font = .boldSystemFont(ofSize: 20)
        layer.cornerRadius = 25
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        self.leftView = leftView
        leftViewMode = .always
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

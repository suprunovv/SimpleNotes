//
//  extantion_UILabel.swift
//  lesson3 dz
//
//  Created by MacBookPro on 09.11.2023.
//


import UIKit

extension UILabel {
    convenience init(text: String) {
        self.init()
        self.text = text
        font = .systemFont(ofSize: 18)
        textColor = .black
    }
}

//
//  ButtonCollectionViewCell.swift
//  lesson3 dz
//
//  Created by MacBookPro on 16.11.2023.
//

import UIKit

class PriorityButtonCollectionViewCell: UICollectionViewCell {
    static let reuseID = "ButtonCollectionViewCell"
    
    let mainView = UIView()
    let titleLabel = UILabel()
    let imageView = UIImageView()
    
    func setMainView(model: PriorityButtonModel) {
        addSubview(mainView)
        mainView.layer.cornerRadius = 20
        mainView.backgroundColor = model.backgroundColor
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(titleLabel)
        mainView.addSubview(imageView)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
         
         titleLabel.text = model.title
         titleLabel.textAlignment = .center
         titleLabel.font = .boldSystemFont(ofSize: 20)
         titleLabel.numberOfLines = 0
         imageView.image = UIImage(named: model.image)
         imageView.contentMode = .scaleAspectFit
         imageView.clipsToBounds = true
         
        
        NSLayoutConstraint.activate([
            mainView.leftAnchor.constraint(equalTo: leftAnchor),
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainView.rightAnchor.constraint(equalTo: rightAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            imageView.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 10),
            imageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -60),
            
            titleLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.rightAnchor.constraint(equalTo: mainView.rightAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)
            
        ])
    }
}

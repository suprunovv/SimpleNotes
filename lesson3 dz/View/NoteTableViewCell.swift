//
//  noteTableViewCell.swift
//  lesson3 dz
//
//  Created by MacBookPro on 15.11.2023.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    static let reuseID = "NoteTableViewCell"
    
    var label = UILabel(text: "Название заметки")
    var view = UIView()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundColor = .clear
        setConstraints()
        setView()
    }
    
    private func setView() {
        view.layer.cornerRadius = 25
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .left
    }

    private func setConstraints() {
        let mainView = UIView()
        mainView.backgroundColor = .white
        mainView.layer.cornerRadius = 25
        
        addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        mainView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        mainView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            mainView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainView.leftAnchor.constraint(equalTo: leftAnchor),
            mainView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            view.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 8),
            view.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 4),
            view.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -4),
            view.widthAnchor.constraint(equalTo: view.heightAnchor),
            label.leftAnchor.constraint(equalTo: view.rightAnchor, constant: 20),
            label.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            label.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: 20)
        ])
    }
}

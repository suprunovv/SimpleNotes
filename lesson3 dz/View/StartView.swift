//
//  StartView.swift
//  lesson3 dz
//
//  Created by MacBookPro on 12.11.2023.
//

import UIKit

class StartView: UIView {

   private lazy var collectionLayout: UICollectionViewLayout = {
       let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .vertical
       layout.minimumLineSpacing = 10
       layout.minimumInteritemSpacing = 10
       layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
       let width = UIScreen.main.bounds.width / 2 - 5 - 20
       layout.itemSize = CGSize(width: width, height: width)
       return layout
   }()
    
   lazy var taskPriorityCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
       return collection
    }()
    
    let noteTabelView = UITableView(frame: .zero, style: .plain)
    let addNoteButton = UIButton(color: .white, imageName: "plus.circle")
    
    private let appTitleLabel = UILabel(text: "Kovi App")
    private let menuButton = UIButton(color: .white, imageName: "line.horizontal.3.circle")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "backColor")
        setView()
        setTabel()
        setCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    private func setView() {
        appTitleLabel.textColor = .white
        appTitleLabel.font = .boldSystemFont(ofSize: 25)
        addSubview(appTitleLabel)
        appTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(addNoteButton)
        addNoteButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(menuButton)
        
        
        NSLayoutConstraint.activate([
            appTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            appTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            addNoteButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            addNoteButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 7)
        ])
        
        NSLayoutConstraint.activate([
            menuButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            menuButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 7)
        ])
        
        
    }
    
    private func setTabel() {
        addSubview(noteTabelView)
        noteTabelView.register(NoteTableViewCell.self, forCellReuseIdentifier: NoteTableViewCell.reuseID)
        noteTabelView.translatesAutoresizingMaskIntoConstraints = false
        noteTabelView.backgroundColor = .clear
        noteTabelView.separatorStyle = .none
        
        NSLayoutConstraint.activate([
            noteTabelView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            noteTabelView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            noteTabelView.centerXAnchor.constraint(equalTo: centerXAnchor),
            noteTabelView.topAnchor.constraint(equalTo: centerYAnchor, constant: 100)
        ])
    }
    
    private func setCollection() {
        addSubview(taskPriorityCollectionView)
        taskPriorityCollectionView.backgroundColor = .clear
        taskPriorityCollectionView.register(PriorityButtonCollectionViewCell.self, forCellWithReuseIdentifier: PriorityButtonCollectionViewCell.reuseID)
        taskPriorityCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            taskPriorityCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            taskPriorityCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            taskPriorityCollectionView.centerYAnchor.constraint(equalTo: centerYAnchor),
            taskPriorityCollectionView.bottomAnchor.constraint(equalTo: noteTabelView.topAnchor, constant: -20),
            taskPriorityCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50)
        
        ])
    }
   
}

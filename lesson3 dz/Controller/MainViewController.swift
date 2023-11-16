//
//  StartViewController.swift
//  lesson3 dz
//
//  Created by MacBookPro on 12.11.2023.
//

import UIKit

protocol NotesAppendDelegate: AnyObject {
    func apendArray(note: Task)
}

final class MainViewController: UIViewController {
    
    private let mainView = StartView()
    
    private(set) var notes = [Task]() {
        didSet {
            mainView.noteTabelView.reloadData()
        }
    }
    
    private let priorityButtons = [PriorityButtonModel(title: "Важное \nСрочное", image: "заяц2.png", backgroundColor: .systemRed),
                               PriorityButtonModel(title: "Важное \nНесрочное", image: "черепаха.png", backgroundColor: .systemBrown),
                               PriorityButtonModel(title: "Неважное \nСрочное", image: "таймер.png", backgroundColor: .systemGreen),
                               PriorityButtonModel(title: "Неважное \nНесрочное", image: "коробка.png", backgroundColor: .systemPink)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        setupUI()
    }
    
    private func setupUI() {
        addTargetToButton()
        mainView.noteTabelView.dataSource = self
        mainView.noteTabelView.delegate = self
        mainView.taskPriorityCollectionView.dataSource = self
    }
    
    private func addTargetToButton() {
        self.mainView.addNoteButton.addTarget(self, action: #selector(goToSecondVC), for: .touchUpInside)
    }
    
    
    @objc private func goToSecondVC() {
        let secondVc = NotesViewController()
        secondVc.notesDelegate = self 
        secondVc.modalPresentationStyle = .fullScreen
        self.present(secondVc, animated: true, completion: nil)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    //Создание, заполнение и возвращение ячейки по каждому индексу
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.reuseID) as? NoteTableViewCell else { return UITableViewCell() }
        cell.label.text = notes[indexPath.row].name
        
        if notes[indexPath.row].important && notes[indexPath.row].urgent {
            cell.view.backgroundColor = .systemRed
        } else if !notes[indexPath.row].important && notes[indexPath.row].urgent {
            cell.view.backgroundColor = .systemGreen
        } else if notes[indexPath.row].important && !notes[indexPath.row].urgent {
            cell.view.backgroundColor = .systemBrown
        } else {
            cell.view.backgroundColor = .systemPink
        }
        
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }
}

extension MainViewController: NotesAppendDelegate {
    func apendArray(note: Task) {
        notes.append(note)
    }
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        priorityButtons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PriorityButtonCollectionViewCell.reuseID, for: indexPath) as? PriorityButtonCollectionViewCell else { return UICollectionViewCell() }
        cell.setMainView(model: priorityButtons[indexPath.row])
        return cell
    }
}



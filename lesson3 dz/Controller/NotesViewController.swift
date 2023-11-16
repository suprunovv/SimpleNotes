//
//  ViewController.swift
//  lesson3 dz
//
//  Created by MacBookPro on 09.11.2023.
//

import UIKit

final class NotesViewController: UIViewController {
    
    private let mainView = SecondView()
    weak var notesDelegate: NotesAppendDelegate? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        goBack()
    }

    
    func goBack() {
        self.mainView.saveButton.addTarget(self, action: #selector(backHome), for: .touchUpInside)
    }
    
    @objc func backHome() {
        if let note = saveNote() {
            guard !note.name.isEmpty else {
                self.present(mainView.alert(message: "Введите название заметки"), animated: true, completion: nil)
                return
            }
            notesDelegate?.apendArray(note: note)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    private func saveNote() -> Task? {
        guard let name = mainView.nameTextField.text else { return nil }
        guard let specification = mainView.specificationTextField.text else { return nil }
        guard let category = mainView.categoryTextField.text else { return nil }
        let important = mainView.noteImportanceSwitch.isOn
        let urgent = mainView.noteUrgentSwitch.isOn
        
        let task = Task(name: name,
                        specification: specification,
                        category: category,
                        important: important,
                        urgent: urgent)
        return task
    }
}




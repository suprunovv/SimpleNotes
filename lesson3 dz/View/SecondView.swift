//
//  StartView.swift
//  lesson3 dz
//
//  Created by MacBookPro on 09.11.2023.
//

import UIKit

class SecondView: UIView {
    
    let titleLabel = UILabel()
    
    let nameTextField = UITextField(placeholder: "Название")
    let specificationTextField = UITextField(placeholder: "Описание")
    let categoryTextField = UITextField(placeholder: "Категория")
    let saveButton = UIButton(type: .system)
    let importantLabel = UILabel(text: "Важная?")
    let urgentLabel = UILabel(text: "Срочная?")
    let noteImportanceSwitch = UISwitch(onColor: .systemGreen, thumbColor: .white)
    let noteUrgentSwitch = UISwitch(onColor: .systemGreen, thumbColor: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        backgroundColor = UIColor(named: "backColor")
        addSubview(nameTextField)
        addSubview(specificationTextField)
        addSubview(categoryTextField)
        setTitle()
        setSaveButton()
        setConstraint()
    }
    
    private func setTitle() {
        titleLabel.textColor = .white
        titleLabel.text = "Новая задача"
        titleLabel.font = .boldSystemFont(ofSize: 25)
        addSubview(titleLabel)
    }
    
    private func setSaveButton() {
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.backgroundColor = .systemBlue
        saveButton.tintColor = .white
        saveButton.layer.cornerRadius = 25
        saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addSubview(saveButton)
        
    }
    
    private func setConstraint() {
        let stackTF = UIStackView(view: [nameTextField, specificationTextField, categoryTextField],
                                  axis: .vertical,
                                  spasing: 20,
                                  alignment: .fill)
        
        let labelStack = UIStackView(view: [importantLabel,
                                            urgentLabel],
                                     axis: .vertical,
                                     spasing: 20,
                                     alignment: .fill)
        
        let switchStack = UIStackView(view: [noteImportanceSwitch, noteUrgentSwitch],
                                      axis: .vertical,
                                      spasing: 15,
                                      alignment: .fill)
        
        let stack = UIStackView(view: [stackTF, saveButton],
                                axis: .vertical,
                                spasing: 150,
                                alignment: .fill)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        labelStack.translatesAutoresizingMaskIntoConstraints = false
        switchStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        addSubview(labelStack)
        addSubview(switchStack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -70),
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: stack.topAnchor, constant: -70),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelStack.leftAnchor.constraint(equalTo: stack.leftAnchor, constant:  10),
            labelStack.centerYAnchor.constraint(equalTo: stack.centerYAnchor, constant: 60)
        ])
        
        NSLayoutConstraint.activate([
            switchStack.rightAnchor.constraint(equalTo: stack.rightAnchor, constant: -10),
            switchStack.centerYAnchor.constraint(equalTo: stack.centerYAnchor, constant: 60)
        ])
    }
    
    final func alert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: "Ошибка!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        return alert
    }
    
}

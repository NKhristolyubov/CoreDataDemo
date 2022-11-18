//
//  TaskViewController.swift
//  CoreDataDemo
//
//  Created by Николай Христолюбов on 17.11.2022.
//

import UIKit

class TaskViewController: UIViewController {
    
    private lazy var taskTextField: UITextField = {
        let textFitld = UITextField()
        
        textFitld.placeholder = "New Task"
        textFitld.borderStyle = .roundedRect
        
        return textFitld
    }()
    
    private lazy var saveButton: UIButton = {
        createButton(
            withColor: UIColor(
                red: 21/255,
                green: 101/255,
                blue: 192/255,
                alpha: 194/255),
            andTitle: "Save task",
            andAction: UIAction {_ in
                self.dismiss(animated: true)
            })
    }()
    
    private lazy var cancelButton: UIButton = {
        createButton(
            withColor: .systemRed,
            andTitle: "Cancel",
            andAction: UIAction {_ in
                self.dismiss(animated: true)
            })
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup(subviews: taskTextField, saveButton, cancelButton)
        setConstrains() // сначала устанавливается элемент интерфейса, а потом задаются каонстрейнты для него (последовательность имеет значение!)
    }
    
    private func setup(subviews: UIView...) { // размещаем сабвью на супервью
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setConstrains() { // уствнавливаем констрейнты
        taskTextField.translatesAutoresizingMaskIntoConstraints = false // отключаем автоматическую расстановку элементов для текстового поля(будем делать это вручную)
        
        NSLayoutConstraint.activate([ // устанавливаем констрейнты
            taskTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            taskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            taskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([ // устанавливаем констрейнты
            saveButton.topAnchor.constraint(equalTo: taskTextField.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([ // устанавливаем констрейнты
            cancelButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    private func createButton(withColor color: UIColor, andTitle title: String, andAction action: UIAction) -> UIButton {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.baseBackgroundColor = color
        
        var atributes = AttributeContainer() // создаем переменную с атрибутами для кнопки
        
        atributes.font = UIFont.boldSystemFont(ofSize: 18) // делаем жирный шрифт с опр.размером
        buttonConfiguration.attributedTitle = AttributedString(title, attributes: atributes)
        
        return UIButton(configuration: buttonConfiguration, primaryAction: action)
    }
}

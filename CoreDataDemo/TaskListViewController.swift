//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Николай Христолюбов on 17.11.2022.
//

import UIKit

class TaskListViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigatoinBar()

    }
    
    private func setupNavigatoinBar() {
        title = "Task List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearence = UINavigationBarAppearance() // экземпляр класса, который настраивает внешний вид navigationBar
        navBarAppearence.configureWithOpaqueBackground()
        navBarAppearence.titleTextAttributes = [.foregroundColor: UIColor.white] // задаем цвет текста у заголовка
        navBarAppearence.largeTitleTextAttributes = [.foregroundColor: UIColor.white] // задаем цвет текста у большого заголовка
        navBarAppearence.backgroundColor = UIColor(
            red: 21/255,
            green: 101/255,
            blue: 192/255,
            alpha: 194/255) // задаем цвет для NavBara
        
        navigationController?.navigationBar.standardAppearance = navBarAppearence // применяем настройки, которые устанавливали выше, для НавБара во время скроллинга
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearence // применяем настройки, которые устанавливали выше, для НавБара в обычном состоянии
        
        navigationItem.rightBarButtonItem = UIBarButtonItem( // добавляем кнопку на навБаре
            barButtonSystemItem: .add,
            target: self, // где будет применяться
            action: #selector(addNewTask) // действие по нажатию на кнопку
        )
        
        navigationController?.navigationBar.tintColor = .white // Цвет оттенка, применяемый к элементам навигации и элементам кнопки панели
    }
    
    @objc private func addNewTask() {
        
        let newTaskVC = TaskViewController() // создаем экземпляр класса, на который будем переходить
        present(newTaskVC, animated: true) // указываем куда будем переходить
    }
    
}



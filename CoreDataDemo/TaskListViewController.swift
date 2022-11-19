//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Николай Христолюбов on 17.11.2022.
//

import UIKit
import CoreData

class TaskListViewController: UITableViewController {
    
    private let context = (UIApplication.shared .delegate as! AppDelegate).persistentContainer.viewContext
    
    let cellID = "task"
    private var taskList: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        setupNavigatoinBar()
        fetchData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
        tableView.reloadData()
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
        newTaskVC.modalPresentationStyle = .fullScreen // делаем экран, на который переходим, на весь экран
        present(newTaskVC, animated: true) // указываем куда будем переходить
       
    }
    
    private func fetchData() {
        let fetchRequest = Task.fetchRequest() // запрос для базы данных чтобы выбрать из нее все объекты с типом Task
        do {
            taskList = try context.fetch(fetchRequest) // присваиваем массиву массив экземпляров модели
            
        } catch {
            print("Faild to fetch data", error)
        }
    }
    
}

extension TaskListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let task = taskList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = task.name
        cell.contentConfiguration = content
        return cell
    }
    
}


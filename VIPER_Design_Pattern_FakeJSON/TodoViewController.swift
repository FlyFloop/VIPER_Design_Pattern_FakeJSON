//
//  ViewController.swift
//  VIPER_Design_Pattern_FakeJSON
//
//  Created by Alper Yorgun on 23.02.2023.
//

import UIKit

class TodoViewController: UIViewController, TodoViewProtocol, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "todoCell") else {return UITableViewCell()}
        tableViewCell.textLabel?.text = todosList[indexPath.row].title       
        return tableViewCell
    }
    
    var todoPresenter: TodoPresenterProtocol?
    
    
    var todosList : [Todo] = []
    
    func update(with todos: [Todo]) {
        DispatchQueue.main.async {
            self.todosList = todos
            self.todoTableView.reloadData()
        }
    }
    
    private let todoTableView : UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "todoCell")
       
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(todoTableView)
        todoTableView.delegate = self
        todoTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        todoTableView.frame = view.bounds
    }
    
    


}


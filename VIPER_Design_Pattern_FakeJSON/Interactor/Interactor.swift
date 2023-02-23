//
//  Interactor.swift
//  VIPER_Design_Pattern_FakeJSON
//
//  Created by Alper Yorgun on 23.02.2023.
//

import Foundation


protocol TodoInteractorProtocol {
    var todoPresenter : TodoPresenterProtocol? {get set}
    
    func fetchTodos()
}

class TodoInteractor : TodoInteractorProtocol {
    var todoPresenter: TodoPresenterProtocol?
    
    func fetchTodos() {
        guard let safeUrl = URL(string: "https://jsonplaceholder.typicode.com/todos") else {return}
        let task = URLSession.shared.dataTask(with: safeUrl) { data, urlResponse, error in
            if error != nil {
                
            }
            do{
                guard let safeData = data else {return}
                guard let todos = try? JSONDecoder().decode([Todo].self, from: safeData) else {return}
                
                self.todoPresenter?.didUpdateTodoList(with: .success(todos))
            }
        }
        task.resume()
    }
    
    
}

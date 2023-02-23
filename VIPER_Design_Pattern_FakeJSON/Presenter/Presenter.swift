//
//  Presenter.swift
//  VIPER_Design_Pattern_FakeJSON
//
//  Created by Alper Yorgun on 23.02.2023.
//

import Foundation


protocol TodoPresenterProtocol  {
    var todoInteractor : TodoInteractorProtocol? {get set}
    var todoRouter : TodoRouterProtocol? {get set}
    var todoView : TodoViewProtocol? {get set}
    
    func didUpdateTodoList(with result : Result<[Todo], Error>)
}

class TodoPresenter : TodoPresenterProtocol {
    var todoView: TodoViewProtocol?
    
    var todoInteractor: TodoInteractorProtocol? {
        didSet {
            todoInteractor?.fetchTodos()
           
        }
    }
    
    var todoRouter: TodoRouterProtocol?
    
    func didUpdateTodoList(with result: Result<[Todo], Error>) {
        switch result{
        case .success(let todos):
            todoView?.update(with: todos)
        case .failure(_):
            return
        }
    }
    
    
    
    
}

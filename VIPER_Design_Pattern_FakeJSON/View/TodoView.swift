//
//  TodoView.swift
//  VIPER_Design_Pattern_FakeJSON
//
//  Created by Alper Yorgun on 23.02.2023.
//

import Foundation


protocol TodoViewProtocol {
    var todoPresenter : TodoPresenterProtocol? {get set}
    
    func update(with todos : [Todo])
   
}

class TodoView : TodoViewProtocol {
    var todoPresenter: TodoPresenterProtocol?
    
    func update(with todos: [Todo]) {
        
    }
    
    
}

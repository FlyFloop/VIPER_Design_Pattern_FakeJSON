//
//  Router.swift
//  VIPER_Design_Pattern_FakeJSON
//
//  Created by Alper Yorgun on 23.02.2023.
//

import Foundation
import UIKit

typealias todoViewPoint = TodoViewProtocol & UIViewController
protocol TodoRouterProtocol {
    var todoView : todoViewPoint? {get set}
    static func start() -> TodoRouterProtocol
    
}

class TodoRouter : TodoRouterProtocol {
    var todoView: todoViewPoint?
    
    static func start() -> TodoRouterProtocol {
        let todoRouter = TodoRouter()
        var view : TodoViewProtocol = TodoViewController()
        var presenter : TodoPresenterProtocol = TodoPresenter()
        var interactor : TodoInteractorProtocol = TodoInteractor()
        view.todoPresenter = presenter
        interactor.todoPresenter = presenter
        presenter.todoRouter = todoRouter
        presenter.todoView = view
        presenter.todoInteractor = interactor
        
        todoRouter.todoView = view as? todoViewPoint
        
        return todoRouter
    }
    
    
}

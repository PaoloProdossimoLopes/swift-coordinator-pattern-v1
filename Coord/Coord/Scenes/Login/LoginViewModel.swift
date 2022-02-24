//
//  LoginViewModel.swift
//  Coord
//
//  Created by Paolo Prodossimo Lopes on 24/02/22.
//

import UIKit

///Comunicacao com o coordinator
protocol LoginViewModelToCoordinatorDelegate: AnyObject {
    func routeToHome(from viewController: LoginViewController)
}

///Comunicacao da viewModel com a view
protocol LoginBindViewModelToControllerDelegate: AnyObject {
    func updateView()
}

///Emcapsulamento da viewModel
protocol LoginViewModelProtocol {
    var viewDelegate: LoginBindViewModelToControllerDelegate? { get set }
    
    func start()
    func getUser() -> UserViewDataModelProtocol
    func enterButtonWasTapped(from viewController: LoginViewController)
}

final class LoginViewModel: LoginViewModelProtocol {
    
    //MARK: - Properties
    weak var viewDelegate: LoginBindViewModelToControllerDelegate?
    weak var coordinatorDelegate: LoginViewModelToCoordinatorDelegate?
    
    private let service: LoginServiceProtocol
    
    private var model: UserModel = .init(
        name: "", userName: "", password: "", age: 0
    )
    
    //MARK: - Constructor
    init(service: LoginServiceProtocol) {
        self.service = service
    }
    
    //MARK: - Methods
    func start() {
        fetchUsers()
    }
    
    func getUser() -> UserViewDataModelProtocol {
        let viewDataModel = UserViewDataModel(model: model)
        return viewDataModel
    }
    
    func enterButtonWasTapped(from viewController: LoginViewController) {
        print("Tapped in viewModel")
        coordinatorDelegate?.routeToHome(from: viewController)
    }
    
    //MARK: - Helpers
    
    private func fetchUsers() {
        service.perform { [weak self] response in
            guard let strongSelf = self else { return }
            strongSelf.model = strongSelf.makeModel(response: response.first!)
            strongSelf.viewDelegate?.updateView()
        }
    }
    
    private func makeModel(response: UserModelResponse) -> UserModel {
        let model = UserModel(
            name: response.name, userName: response.username,
            password: "qualquerCois@", age: response.id
        )
        return model
    }
}

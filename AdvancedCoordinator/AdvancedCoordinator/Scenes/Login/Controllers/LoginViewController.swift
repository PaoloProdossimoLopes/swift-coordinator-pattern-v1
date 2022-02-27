//
//  LoginViewController.swift
//  AdvancedCoordinator
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

import UIKit

protocol LoginViewControllerNavigate: AnyObject {
    func goToRegister(controller: LoginViewController)
}

final class LoginViewController: UIViewController {
    
    private weak var navigate: LoginViewControllerNavigate?
    
    private let viewModel: LoginViewModelProtocol
    private(set) lazy var cView: LoginView = .init(self)
    
    init(_ delegate: LoginViewControllerNavigate, viewModel: LoginViewModelProtocol) {
        self.navigate = delegate
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = cView
    }
}

extension LoginViewController: LoginViewDelegate {
    func registerButtonWasTapped() {
        navigate?.goToRegister(controller: self)
    }
}

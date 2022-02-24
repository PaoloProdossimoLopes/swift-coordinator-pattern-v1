//
//  LoginViewController.swift
//  Coord
//
//  Created by Paolo Prodossimo Lopes on 24/02/22.
//

import UIKit

final class LoginViewController: UIViewController {
    
    //MARK: - Properties
    
    var loginView: LoginView { .init(delegate: self) }
    var viewModel: LoginViewModelProtocol 
    
    //MARK: - Constructor
    
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.viewDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    
    override func loadView() {
        super.loadView()
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    private func commonInit() {
        //loginView.configureDelegates(self)
        viewModel.start()
    }
}

//MARK: - LoginBindViewModelToViewDelegate
extension LoginViewController: LoginBindViewModelToControllerDelegate {
    func updateView() { print("Should upadate the view") }
}

//MARK: - LoginViewDelegate
extension LoginViewController: LoginViewDelegate {
    func enterButtonWasTapped(_ sender: UIButton) {
        viewModel.enterButtonWasTapped(from: self)
    }
}

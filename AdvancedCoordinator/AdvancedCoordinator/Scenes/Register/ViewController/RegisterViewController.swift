//
//  RegisterViewController.swift
//  AdvancedCoordinator
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

import UIKit

final class RegisterViewController: UIViewController {
    
    private var viewModel: RegisterViewModelProtocol {
        didSet { viewModel.viewDelegate = self }
    }
    
    init(viewModel: RegisterViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RegisterViewController: RegisterViewModelToControllerDelegate {
    func updateView() {
        print("Update View")
    }
    
    func updateViewWithError(_ error: Error) {
        print("Update with Error")
    }
}

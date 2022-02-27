//
//  LoginCoordinator.swift
//  AdvancedCoordinator
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

import Foundation
import UIKit

final class LoginCoordinator: Coordinator {
    
    private(set) lazy var controller: LoginViewController = .init(self, viewModel: viewModel)
    private var viewModel: LoginViewModelProtocol
    private var service: LoginServiceProtocol
    
    override init(router: Router) {
        self.service = LoginService()
        self.viewModel = LoginViewModel(service: service)
        
        super.init(router: router)
    }
    
    override func start() {
        controller.modalPresentationStyle = .fullScreen
        present(animated: true, onDismissed: nil)
    }
    
    override func present(animated: Bool, onDismissed: Coordinator.onDismissedCallback?) {
        router.present(controller, animated: animated, onDismissed: onDismissed)
    }
}

extension LoginCoordinator: LoginViewControllerNavigate {
    func goToRegister(controller: LoginViewController) {
        let registerCoordinator = RegisterCoordinator(router: router)
        presentChild(registerCoordinator, animated: true, onDismissed: nil)
    }
}

//
//  RegisterCoordinator.swift
//  AdvancedCoordinator
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

import Foundation
import UIKit

final class RegisterCoordinator: Coordinator {
    
    private(set) lazy var controller: RegisterViewController = .init(viewModel: viewModel)
    private lazy var viewModel: RegisterViewModelProtocol = RegisterViewModel(self, service: service)
    private let service: RegisterServiceProtocol = RegisterService()
    
    override init(router: Router) {
        super.init(router: router)
    }
    
    override func start() {
        present(animated: true, onDismissed: nil)
    }
    
    override func present(animated: Bool, onDismissed: Coordinator.onDismissedCallback?) {
        router.present(controller, animated: animated, onDismissed: onDismissed)
    }
}

extension RegisterCoordinator: RegisterViewModelToCoordinatorDelegate {
    
}

//
//  LoginCoordinator.swift
//  Coord
//
//  Created by Paolo Prodossimo Lopes on 24/02/22.
//

import UIKit

final class LoginCoordinator: Coordinator {
    
    //MARK: - Properties
    let rootViewController: UIViewController
    
    lazy var viewModel: LoginViewModel =  {
        let service: LoginServiceProtocol = LoginService()
        let viewModel: LoginViewModel = .init(service: service)
        viewModel.coordinatorDelegate = self
        return viewModel
    }()

    lazy var controller: LoginViewController = {
        let controller: LoginViewController = .init(viewModel: self.viewModel)
        controller.modalPresentationStyle = .fullScreen
        return controller
    }()
    
    //MARK: - Construtcor
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    //MARK: - Override Coordinator methods
    override func start() {
        //add operation queue to main because was appeared some log metrics in Xcode console
        OperationQueue.main.addOperation { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.callScreen()
        }
    }
    
    //MARK: - Helper
    private func callScreen() {
        rootViewController.present(controller, animated: true,completion: nil)
    }
}

//MARK: - LoginViewModelToCoordinatorDelegate
extension LoginCoordinator: LoginViewModelToCoordinatorDelegate {
    func routeToHome(from viewController: LoginViewController) {
        let homeCoordinator = HomeCoordinator(self, currentController: viewController)
        addChildCoordinator(homeCoordinator)
        homeCoordinator.start()
    }
}

extension LoginCoordinator: HomeCoordinatorDelegate {
    func closeButtonWasTapped(_ coord: HomeCoordinator, from viewController: HomeViewController) {
        viewController.dismiss(animated: true) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.removeChildCoordinator(coord)
        }
    }
}

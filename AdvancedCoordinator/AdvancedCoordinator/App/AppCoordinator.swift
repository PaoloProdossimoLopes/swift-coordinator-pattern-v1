//
//  AppCoordinator.swift
//  AdvancedCoordinator
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private let service: AppServiceProtocol = AppService()
    private let controller = UIViewController()
    
    private lazy var navigationController = UINavigationController(rootViewController: controller)
    
    private lazy var loginCoord: LoginCoordinator = {
        let rout = ModalNavigationRouter(parentViewController: navigationController)
        rout.typeOfModal = .fullScreen
        rout.hideNavigationBar = true
        let coord = LoginCoordinator(router: rout)
        return coord
    }()
    
    override init(router: Router) {
        super.init(router: router)
    }
    
    override func start() {
        present(animated: true, onDismissed: nil)
    }
    
    override func present(animated: Bool, onDismissed: Coordinator.onDismissedCallback?) {
        router.present(navigationController, animated: animated, onDismissed: { [weak self] in
            guard let self = self else { return }
            self.choseToRoute()
        })
    }
    
    private func choseToRoute() {
        service.userIsLogged { [weak self] isLogged in
            guard let self = self else { return }
            
            if isLogged {
                self.goToHome()
                return
            }
            
            self.goToLogin()
            return
        }
    }
    
    private func goToLogin() {
        loginCoord.present(animated: true, onDismissed: nil)
    }
    
    private func goToHome() {
        
    }
}

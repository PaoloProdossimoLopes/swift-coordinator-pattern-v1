//
//  AppCoordinator.swift
//  Coord
//
//  Created by Paolo Prodossimo Lopes on 24/02/22.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    let window: UIWindow?
    
    lazy var rootViewController: UIViewController = {
        let controller = UIViewController()
        controller.view.backgroundColor = .white
        return controller
    }()
    
    var loginCoordinator: LoginCoordinator!

    // MARK: - Coordinator
    init(window: UIWindow?) {
        self.window = window
    }

    override func start() {
        guard let window = window else { return }

        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        instantiateLoginCoord(window: window)
    }
    
    private func instantiateLoginCoord(window: UIWindow) {
        guard let root = window.rootViewController else { return }
        loginCoordinator = LoginCoordinator(rootViewController: root)
        addChildCoordinator(loginCoordinator)
        loginCoordinator.start()
    }
}

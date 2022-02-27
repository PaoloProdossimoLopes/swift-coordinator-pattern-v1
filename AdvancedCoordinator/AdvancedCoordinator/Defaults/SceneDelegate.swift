//
//  SceneDelegate.swift
//  AdvancedCoordinator
//
//  Created by Paolo Prodossimo Lopes on 24/02/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private var router: AppRouter!
    private var coordinator: AppCoordinator!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        guard let window = window else { return }

        startApplication(window)
    }
    
    private func startApplication(_ window: UIWindow) {
        router = .init(window: window)
        coordinator = .init(router: router)
        coordinator.present(animated: true, onDismissed: nil)
    }

    func sceneDidDisconnect(_ scene: UIScene) { /*...*/ }

    func sceneDidBecomeActive(_ scene: UIScene) { /*...*/ }

    func sceneWillResignActive(_ scene: UIScene) { /*...*/ }

    func sceneWillEnterForeground(_ scene: UIScene) { /*...*/ }

    func sceneDidEnterBackground(_ scene: UIScene) { /*...*/ }
}


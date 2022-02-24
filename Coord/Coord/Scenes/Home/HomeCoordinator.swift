//
//  HomeCoordinator.swift
//  Coord
//
//  Created by Paolo Prodossimo Lopes on 24/02/22.
//

import UIKit

protocol HomeCoordinatorDelegate: AnyObject {
    func closeButtonWasTapped(_ coord: HomeCoordinator, from viewController: HomeViewController)
}

final class HomeCoordinator: Coordinator {
    
    weak var delegate: HomeCoordinatorDelegate?
    
    let currentController: UIViewController
    
    private lazy var viewModel: HomeViewModel = {
        let service: HomeServiceProtocol = HomeService()
        let controller = HomeViewModel(self, service: service)
        return controller
    }()
    
    private lazy var controller: HomeViewController = {
        let controller = HomeViewController(viewModel: viewModel)
        controller.modalPresentationStyle = .fullScreen
        return controller
    }()
    
    init(_ delegate: HomeCoordinatorDelegate, currentController: UIViewController) {
        self.delegate = delegate
        self.currentController = currentController
    }
    
    override func start() {
        currentController.present(controller, animated: true, completion: nil)
    }
}

//MARK: - HomeViewModelToCoordinatorDelegate
extension HomeCoordinator: HomeViewModelToCoordinatorDelegate {
    func clearButtonWasTapped(from viewController: HomeViewController, sender: UIButton) {
        delegate?.closeButtonWasTapped(self, from: viewController)
    }
}

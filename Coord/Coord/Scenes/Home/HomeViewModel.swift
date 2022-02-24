//
//  HomeViewModel.swift
//  Coord
//
//  Created by Paolo Prodossimo Lopes on 24/02/22.
//

import Foundation
import UIKit

protocol HomeViewModelToViewDelegate: AnyObject {
    func updateView()
}

protocol HomeViewModelToCoordinatorDelegate: AnyObject {
    func clearButtonWasTapped(from viewController: HomeViewController, sender: UIButton)
}

protocol HomeViewModelProtocol: AnyObject {
    var viewDelegate: HomeViewModelToViewDelegate? { get set }
    
    func closeButtonWasTapped(from viewController: HomeViewController, sender: UIButton)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    weak var coordinatorDelegate: HomeViewModelToCoordinatorDelegate?
    weak var viewDelegate: HomeViewModelToViewDelegate?
    
    private let service: HomeServiceProtocol
    
    init(_ coordDelegate: HomeViewModelToCoordinatorDelegate, service: HomeServiceProtocol) {
        self.coordinatorDelegate = coordDelegate
        self.service = service
    }
    
    func closeButtonWasTapped(from viewController: HomeViewController, sender: UIButton) {
        coordinatorDelegate?.clearButtonWasTapped(from: viewController, sender: sender)
    }
}

//
//  RegisterViewModel.swift
//  AdvancedCoordinator
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

import Foundation

protocol RegisterViewModelToControllerDelegate: AnyObject {
    func updateView()
    func updateViewWithError(_ error: Error)
}

protocol RegisterViewModelToCoordinatorDelegate: AnyObject {
    
}

protocol RegisterViewModelProtocol {
    var viewDelegate: RegisterViewModelToControllerDelegate? { get set }
}

final class RegisterViewModel: RegisterViewModelProtocol {
    
    weak var viewDelegate: RegisterViewModelToControllerDelegate?
    private weak var coordDelegate: RegisterViewModelToCoordinatorDelegate?
    
    private let service: RegisterServiceProtocol
    
    init(_ delegate: RegisterViewModelToCoordinatorDelegate, service: RegisterServiceProtocol) {
        self.coordDelegate = delegate
        self.service = service
    }
}

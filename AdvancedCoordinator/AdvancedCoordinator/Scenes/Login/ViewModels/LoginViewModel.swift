//
//  LoginViewModelProtocol.swift
//  AdvancedCoordinator
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

import Foundation

protocol LoginViewModelProtocol {
    
}

final class LoginViewModel: LoginViewModelProtocol {
    
    let service: LoginServiceProtocol
    
    init(service: LoginServiceProtocol) {
        self.service = service
    }
    
}

//
//  AppService.swift
//  AdvancedCoordinator
//
//  Created by Paolo Prodossimo Lopes on 27/02/22.
//

import Foundation

protocol AppServiceProtocol {
    func userIsLogged(completion: (Bool) -> Void)
}

final class AppService: AppServiceProtocol {
    
    private var isLogged: Bool = false
    
    func userIsLogged(completion: (Bool) -> Void) {
        completion(isLogged)
    }
}

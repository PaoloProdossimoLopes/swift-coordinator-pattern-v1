//
//  UserViewDataModel.swift
//  Coord
//
//  Created by Paolo Prodossimo Lopes on 24/02/22.
//

protocol UserViewDataModelProtocol {
    func getUsernameFormatted() -> String
    func getName() -> String
}

struct UserViewDataModel {
    
    private let model: UserModel
    
    init(model: UserModel) {
        self.model = model
    }
}

//MARK: - UserViewDataModelProtocol
extension UserViewDataModel: UserViewDataModelProtocol {
    
    func getUsernameFormatted() -> String { return ("@" + model.userName) }
    
    func getName() -> String { return model.name }
}

/*
 NOTE: A DATA VIEW MODEL É O MODELO QUE TERA CONTATO COM A VIEW, OU SEJA, ELE SERA
 PASSADO DA VIEWMODEL PARA A CONTROLLER E POR CONSEQUENCIA PARA A VIEW.
 */

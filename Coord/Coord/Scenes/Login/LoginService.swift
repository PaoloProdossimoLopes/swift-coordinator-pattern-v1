//
//  LoginService.swift
//  Coord
//
//  Created by Paolo Prodossimo Lopes on 24/02/22.
//

import Foundation

protocol LoginServiceProtocol {
    func perform(_ completion: @escaping ([UserModelResponse]) -> Void)
}

final class LoginService: LoginServiceProtocol {
    
    func perform(_ completion: @escaping ([UserModelResponse]) -> Void) {
        let urlString: String = "https://jsonplaceholder.typicode.com/users"
        guard let url: URL = URL(string: urlString) else { return }
        
        comunicateWithAPI(url: url, completion: completion)
    }
    
    private func comunicateWithAPI<T: Codable>(url: URL, completion: @escaping (T) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] (dat, resp, error) in
            guard let strongSelf = self, let data = dat, error == nil else { return }
            strongSelf.decodeObject(data: data, completion: completion)
        }
        task.resume()
    }
    
    private func decodeObject<T: Codable>(data: Data, completion: @escaping (T) -> Void) {
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(T.self, from: data)
            completion(response)
        } catch {
            print("Error")
        }
    }
}

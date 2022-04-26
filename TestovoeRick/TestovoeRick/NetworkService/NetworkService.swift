//
//  NetworkService.swift
//  TestovoeRick
//
//  Created by Kalandarov Vakil on 16.04.2022.
//

import Foundation

class NetworkService {
    
    func createNetworkService(http: String, complition: @escaping(Result<CharactersModel, Error>)-> Void) {
        guard let url = URL(string: http) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                complition(.failure(error))
                print(error)
                return
            }
            guard let data = data else { return }
            do {
                let text = try JSONDecoder().decode(CharactersModel.self, from: data)
                complition(.success(text))
            } catch let jsonError {
                complition(.failure(jsonError))
            }
        }.resume()
    }
}

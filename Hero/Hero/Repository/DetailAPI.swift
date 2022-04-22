//
//  DetailAPI.swift
//  Hero
//
//  Created by Usr_Prime on 22/04/22.
//

import Foundation

class DetailAPI {
    static let shared = DetailAPI()
    
    func getDetailsHero(with heroName: String, completion: @escaping (Result<[Details], Error>) -> Void) {
        guard let url = URL(string: "https://www.superheroapi.com/api.php/2019125954935922/search/\(heroName)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let results = try JSONDecoder().decode(DetailAPIResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

//
//  SearchViewModel.swift
//  Hero
//
//  Created by Usr_Prime on 19/04/22.
//

import Foundation

protocol SearchViewDelegate: AnyObject {
    func setCellHero()
    func reloadData()
}

class SearchViewModel {
    var delegate: SearchViewDelegate?
    var detailsHero: [Details] = []
    
    func getHeroList() -> [Details] {
        return self.detailsHero
    }
    func searchData(with text: String?) {
        guard let name = text else { return }
        foundData(heroName: name)
    }
    private func foundData(heroName: String) {
        DetailAPI.shared.getDetailsHero(with: heroName) { result in
            switch result {
            case .success(let details):
                self.detailsHero = details
                self.delegate?.reloadData()
            case .failure(_):
                self.detailsHero = []
                self.delegate?.reloadData()
            }
        }
    }
}

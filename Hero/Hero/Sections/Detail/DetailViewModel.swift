//
//  DetailViewModel.swift
//  Hero
//
//  Created by Usr_Prime on 20/04/22.
//

import Foundation

protocol DetailViewDelegate: AnyObject {
    func setHeader(with fullName: String, _ characterName: String, and characterImage: String)
    func setPowerStats(with powerstats: Powerstats)
    func setOuthesInfo(with hero: Details)
}

class DetailViewModel {
    var delegate: DetailViewDelegate?
    var detailsHero: Details?
    
    func setupCamps() {
        guard let hero = detailsHero else { return }
        
        delegate?.setHeader(with: hero.biography.fullName, hero.name, and: hero.image.url)
        delegate?.setPowerStats(with: hero.powerstats)
        delegate?.setOuthesInfo(with: hero)
    }
}

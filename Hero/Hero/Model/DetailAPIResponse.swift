//
//  DetailAPIResponse.swift
//  Hero
//
//  Created by Usr_Prime on 22/04/22.
//

import Foundation
import UIKit

class DetailAPIResponse {
    struct DetailAPIResponse: Codable {
        let results: [Details]
    }
    struct Details: Codable {
        let id: Int
        let name: String
        let powerstats: Powerstats
        let biography: Biography
        let appearance: Appearance
        let work: Work
        let connections: Connections
        let image: Image
    }
    struct Powerstats: Codable {
        let inteligence: String
        let strength: String
        let speed: String
        let durability: String
        let power: String
        let combat: String
    }
    struct Biography: Codable {
//        let full-name: String
//        let place-of-appearance: String
//        let first-appearance: String
        let publisher: String
    }
    struct Appearance: Codable {
        let race: String
    }
    struct Work: Codable {
        let base: String
    }
    struct Connections: Codable {
//        let group-affiliation: String
    }
    struct Image: Codable {
        let url: String
    }
}

//
//  DetailAPIResponse.swift
//  Hero
//
//  Created by Usr_Prime on 22/04/22.
//

import Foundation

struct DetailAPIResponse: Codable {
    let results: [Details]
}
struct Details: Codable {
    let id: String
    let name: String
    let powerstats: Powerstats
    let biography: Biography
    let appearance: Appearance
    let work: Work
    let connections: Connections
    let image: Image
}
struct Powerstats: Codable {
    let intelligence: String
    let strength: String
    let speed: String
    let durability: String
    let power: String
    let combat: String
}
struct Biography: Codable {
    let fullName: String
    let placeOfAppearance: String
    let firstAppearance: String
    let publisher: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case placeOfAppearance = "place-of-birth"
        case firstAppearance = "first-appearance"
        case publisher
    }
    static func codingKey<Value>(for KeyPath: KeyPath<Biography, Value>) -> String? {
        let codingKey: CodingKeys
        switch KeyPath {
        case \Biography.fullName:
            codingKey = .fullName
        case \Biography.placeOfAppearance:
            codingKey = .placeOfAppearance
        case \Biography.firstAppearance:
            codingKey = .firstAppearance
        default: return nil
        }
        return codingKey.rawValue
    }
}
struct Appearance: Codable {
    let race: String
}
struct Work: Codable {
    let base: String
}
struct Connections: Codable {
    let groupAffiliation: String
    
    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "group-affiliation"
    }
    static func codingKey<Value>(for KeyPath: KeyPath<Connections, Value>) -> String? {
        let codingKey: CodingKeys
        switch KeyPath {
        case \Connections.groupAffiliation:
            codingKey = .groupAffiliation
        default: return nil
        }
        return codingKey.rawValue
    }
}
struct Image: Codable {
    let url: String
}

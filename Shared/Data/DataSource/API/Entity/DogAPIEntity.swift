//
//  Dog.swift
//  DogsApp
//
//  Created by Jorge Flores Carlos on 13/04/22.
//

import Foundation

struct DogAPIEntity: Codable {
    let dogName, description: String
    let age: Int
    let image: String
}

typealias APIEntityDogs = [DogAPIEntity]

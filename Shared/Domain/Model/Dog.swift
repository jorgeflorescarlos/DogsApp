//
//  Dog.swift
//  DogsApp
//
//  Created by Jorge Flores Carlos on 13/04/22.
//

import Foundation

struct Dog: Identifiable {
    let id: String
    let name, description: String
    let age: Int
    let image: String
}

typealias Dogs = [Dog]

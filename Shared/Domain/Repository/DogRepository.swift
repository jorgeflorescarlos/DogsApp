//
//  DogRepository.swift
//  DogsApp
//
//  Created by Jorge Flores Carlos on 13/04/22.
//

import Foundation

protocol DogRepository{
    
    func getDogs() async throws -> Dogs
    
}

protocol StorableDogRepository: DogRepository {
    func saveDogs(dogs: Dogs) async throws
}

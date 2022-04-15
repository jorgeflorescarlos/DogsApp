//
//  DogDataSource.swift
//  DogsApp
//
//  Created by Jorge Flores Carlos on 13/04/22.
//

import Foundation

protocol DogDataSource {
    
    func getDogs() async throws -> Dogs
    
}

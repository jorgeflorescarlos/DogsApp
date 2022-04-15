//
//  DogRepositoryImpl.swift
//  DogsApp
//
//  Created by Jorge Flores Carlos on 13/04/22.
//

import Foundation

struct DogRepositoryImpl: DogRepository{
    
    var dataSource: DogDataSource
    
    func getDogs() async throws -> Dogs {
        let _dogs =  try await dataSource.getDogs()
        return _dogs
    }
}

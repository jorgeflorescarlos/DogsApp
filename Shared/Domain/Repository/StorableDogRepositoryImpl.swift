//
//  StorableDogRepositoryImpl.swift
//  DogsApp
//
//  Created by Jorge Flores Carlos on 14/04/22.
//

import Foundation

struct StorableDogRepositoryImpl: StorableDogRepository{
    
    
    var dataSource: Storable
    
    func getDogs() async throws -> Dogs {
        let _dogs =  try await dataSource.getDogs()
        return _dogs
    }
    
    func saveDogs(dogs: Dogs) async throws {
        _ = dogs.compactMap { dog in
            Task { try? await dataSource.store(dog: dog) }
        }
    }
}

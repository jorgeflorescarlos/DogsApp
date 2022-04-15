//
//  Storable.swift
//  DogsApp
//
//  Created by Jorge Flores Carlos on 13/04/22.
//

import Foundation
import CoreData

protocol Storable: DogDataSource {
    func store(dog: Dog) async throws
}

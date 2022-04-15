//
//  DogDBRealmImpl.swift
//  DogsApp
//
//  Created by Jorge Flores Carlos on 14/04/22.
//

import Foundation
import RealmSwift
import CoreData

class DogRMDBEntity: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var dogDescription = ""
    @objc dynamic var age = 0
    @objc dynamic var image = ""
}

struct DogDBRealmImpl: Storable {
    
    let realm : Realm
    
    init() {
        realm = try! Realm()
    }
    
    func getDogs() async throws -> Dogs {
        
        let results = realm.objects(DogRMDBEntity.self)
        
        let dogs: Dogs? = results.compactMap({ dog in
            
            return Dog(
                id: dog.id,
                name: dog.name,
                description: dog.dogDescription,
                age: dog.age,
                image: dog.image
            )
        })
        
        return dogs ?? []
        
    }
    
    func store(dog: Dog) async throws {
        let newDog = DogRMDBEntity()
        newDog.id = dog.id
        newDog.name = dog.name
        newDog.dogDescription = dog.description
        newDog.age = dog.age
        newDog.image = dog.image
        DispatchQueue.main.async {
            try? realm.write({
                realm.add(newDog)
            })
        }
        
    }
    
}

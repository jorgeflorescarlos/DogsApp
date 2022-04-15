//
//  DogDBCoreDataImpl.swift
//  DogsApp
//
//  Created by Jorge Flores Carlos on 13/04/22.
//

import Foundation
import CoreData

struct DogDBCoreDataImpl: Storable {
    
    let container: NSPersistentContainer?
    
    init() {
        container = NSPersistentContainer(name: "DogsApp")
        container?.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container?.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func getDogs() async throws -> Dogs {
        
        let context = container?.viewContext
        
        guard let result = try? context?.fetch(DogCDEntity.fetchRequest()) else{
            throw DBServiceError.readDrror
        }
        
        
        let dogs: Dogs? = result.compactMap({ dog in
            guard let id = dog.id, let name = dog.name, let description = dog.dog_description, let image = dog.image else { return nil }
            
            return Dog(
                id: id.uuidString,
                name: name,
                description: description,
                age: Int(dog.age),
                image: image
            )
        })
        
        return dogs ?? []
        
    }
    
    func store(dog: Dog) async throws {
        guard let context = container?.viewContext else{
            throw DBServiceError.readDrror
        }
        
        let newDog = DogCDEntity(context: context)
        newDog.id = UUID(uuidString: dog.id)
        newDog.name = dog.name
        newDog.age = Int16(dog.age)
        newDog.dog_description = dog.description
        newDog.image = dog.image
        
        do {
            try context.save()
        } catch {
            throw DBServiceError.writeError
        }
    }
}

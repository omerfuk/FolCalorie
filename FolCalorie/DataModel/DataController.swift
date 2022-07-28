//
//  DataController.swift
//  FolCalorie
//
//  Created by Ömer Faruk Kılıçaslan on 28.07.2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "FoodModel") // CoreData Model
    
    init() {
        container.loadPersistentStores { description, error in
            
            if let error = error {
                print("Failed to load the data : \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        
        do {
            try context.save()
            print("Data Saved!!! Wuhu!!")
        } catch {
            print("We could not save the data... :(")
        }
        
    }
    
    func addFood(name: String, calories: Double, context: NSManagedObjectContext) {
        
        let food = Food(context: context)
        food.id = UUID()
        food.date = Date()
        food.name = name
        food.calories = calories
        
        save(context: context)
        
    }
    
    func editFood(food: Food, name: String, calories: Double, context: NSManagedObjectContext) {
        
        food.date = Date()
        food.name = name
        food.calories = calories
        
        save(context: context)
    }
    
}

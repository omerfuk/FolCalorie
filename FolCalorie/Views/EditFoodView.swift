//
//  EditFoodView.swift
//  FolCalorie
//
//  Created by Ömer Faruk Kılıçaslan on 28.07.2022.
//

import SwiftUI
import CoreData

struct EditFoodView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    var food: FetchedResults<Food>.Element
    
    @State private var name = ""
    @State private var calories: Double = 0
    
    var body: some View {
        Form {
            Section{
                TextField("\(food.name!)", text: $name)
                    .onAppear {
                        name = food.name!
                        calories = food.calories
                    }
                VStack{
                    Text("Calories : \(Int(calories))")
                    Slider(value: $calories, in: 0...1000, step: 10)
                }
                .padding()
                
                HStack{
                    Spacer()
                    
                    Button {
                        DataController().editFood(food: food, name: name, calories: calories, context: managedObjectContext)
                        dismiss()
                    } label: {
                        Text("Submit")
                    }

                    Spacer()
                }
            }
        }
    }
}


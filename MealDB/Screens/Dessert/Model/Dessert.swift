//
//  Dessert.swift
//  MealDB
//
//  Created by csuftitan on 10/26/23.
//

import Foundation

struct Dessert: Decodable  {
    var meals: [Meal]
    
    struct Meal: Decodable {
        var strMeal: String
        var idMeal: String
        var strMealThumb: String
    }
}

//
//  PizzaModel.swift
//  pizza
//
//  Created by MD-HeryHamzah on 09/04/24.
//

import Foundation

struct PizzaModel: Identifiable, Hashable {
    
    var id = UUID()
    
    var image: String
    var name: String
    var price: [Double]
    var desc: String
}

var pizzaList = [
    PizzaModel(
         image: "cheese-pizza-2",
         name: "Tomato & Cheese Pizza",
         price: [13.49, 14.49, 15.49],
         desc: "crust topped with our homemade pizza sauce and cheese"),
     PizzaModel(
         image: "deluxe-pizza",
         name: "Deluxe Pizza",
         price: [17.99, 20.99, 23.99],
         desc: "fresh veggies & extra cheese"),
     PizzaModel(
         image: "margherita-2",
         name: "Margherita",
         price: [14.99, 16.99, 18.99],
         desc: "topped with homemade pizza & mozzarella"),
     PizzaModel(
         image: "WhiteVeggie",
         name: "White Veggie",
         price: [16.99, 19.99, 22.99],
         desc: "fresh veggies & mozzarella"),
]

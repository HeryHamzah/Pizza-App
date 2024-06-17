//
//  ToppingModel.swift
//  pizza
//
//  Created by MD-HeryHamzah on 09/04/24.
//

import Foundation

struct ToppingPosition {
    var x: Double
    var y: Double
}

struct ToppingModel: Identifiable, Equatable {
    static func == (lhs: ToppingModel, rhs: ToppingModel) -> Bool {
        lhs.size == rhs.size && lhs.onList == rhs.onList && lhs.onPizza == rhs.onPizza
    }
    
    
    var id = UUID()
    
    var onList: String
    var onPizza: String
    var size: Double
    var positions: [ToppingPosition] = []
    
    func copyWith(positions: [ToppingPosition]) -> ToppingModel {
        return ToppingModel(id: id,
            onList: onList, onPizza: onPizza, size: size, positions: positions)
    }
}

var toppings = [
    ToppingModel(
        onList: "corn",
        onPizza: "corn (1)",
        size: 15
    ),
    ToppingModel(
        onList: "tomato",
        onPizza: "tomato (1)",
        size: 40
    ),
    ToppingModel(
        onList: "mushroom",
        onPizza: "mushroom (1)",       
        size: 40
    ),
    ToppingModel(
        onList: "bassil",
        onPizza: "bassil (4)",
        size: 25
    ),
    ToppingModel(
        onList: "cheese",
        onPizza: "cheese (1)",
        size: 40
    ),
    ToppingModel(
        onList: "onion",
        onPizza: "onion (1)",
        size: 40
    ),
    ToppingModel(
        onList: "sausage",
        onPizza: "sausage (1)",
        size: 40
    ),
    
]

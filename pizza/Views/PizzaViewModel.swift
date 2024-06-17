//
//  PizzaViewModel.swift
//  pizza
//
//  Created by MD-HeryHamzah on 17/06/24.
//

import Foundation
import SwiftUI

@Observable class PizzaViewModel {
    
     var currentPizza: PizzaModel = pizzaList[0]
     var total: Double = 1
     var selectedSize: SizeModel = sizeList[1]
     var currentPage: Int = 0
    
     var selectedToppings: [ToppingModel] = []
    
    
    let transitions: [AnyTransition] = [
        .asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)),
        .asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)),
        .asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)),
        .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    ]
    
    func addTopping(topping: ToppingModel) {
        var positions: [ToppingPosition] = []
        
        for _ in 0..<10 {
            let position = ToppingPosition(
                x: Double.random(in: 45..<self.selectedSize.size - 45),
                y: Double.random(in: 45..<self.selectedSize.size - 45)
            )
            
            positions.append(position)
        }
        
        selectedToppings.append(topping.copyWith(positions: positions))
    }
    
    
    func randomToppingPositions()  {
        selectedToppings = selectedToppings.map { topping in
            var positions: [ToppingPosition] = []

            for _ in 0..<10 {
                let position = ToppingPosition(
                    x: Double.random(in: 45..<self.selectedSize.size - 45),
                    y: Double.random(in: 45..<self.selectedSize.size - 45)
                )
                
                positions.append(position)
            }
            
            return topping.copyWith(positions: positions)
        }
        
      
    }
    

    
    
    
}

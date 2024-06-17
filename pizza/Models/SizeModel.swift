//
//  SizeModel.swift
//  pizza
//
//  Created by MD-HeryHamzah on 09/04/24.
//

import Foundation

struct SizeModel: Identifiable, Hashable {
    var id = UUID()
    
    var name: String
    var index: Int
    var size: Double
}

var sizeList = [
SizeModel(name: "S", index: 0, size: 220),
SizeModel(name: "M", index: 1, size: 250),
SizeModel(name: "L", index: 2, size: 270),
]

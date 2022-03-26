//
//  LogicModel.swift
//  Calculator
//
//  Created by Andrei Panasenko on 26.03.2022.
//

import Foundation

struct LogicModel {
    
    var number: Double
    
    init(num: Double) {
        self.number = num
    }
    
    func calculate(symbol: String) -> Double? {
        
            switch symbol {
            case "+/-":
               return number * -1
            case "AC":
                return 0
            case "%":
                return number * 0.01
            default:
                return nil
            }
        }

    
    
    
}

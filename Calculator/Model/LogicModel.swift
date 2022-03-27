//
//  LogicModel.swift
//  Calculator
//
//  Created by Andrei Panasenko on 26.03.2022.
//

import Foundation

struct LogicModel {
    
    private var number: Double?
    
    private var intermediateCalculation: (num1: Double, operation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
               return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (num1: n, operation: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.num1, let operation = intermediateCalculation?.operation {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "x":
                return n1 * n2
            case "/":
                guard n2 != 0 else { return 0 }
                return n1 / n2
            default:
                fatalError("the operation passed in does not match any of the cases")
            }
        }
        return nil
    }
    
}

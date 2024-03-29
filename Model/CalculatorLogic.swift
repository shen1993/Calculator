//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Hongyuan Shen on 3/9/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation


struct CalculatorLogic {
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func logics(symbol: String) -> Double? {
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            }
            else if symbol == "AC" {
                return 0
            }
            else if symbol == "%" {
                return n * 0.01
            }
            else if symbol == "=" {
                return performTwoNumCalculation(n2: n)
            } else {
                intermediateCalculation = (n1: n, calcMethod: symbol)
                return n
            }
        }
        return nil
        
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod{
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any cases.")
            }
        } else{
            return nil
        }
    }
    
}

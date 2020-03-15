//
//  CalculatorLogic.swift
//  calculator using stack view autolayout
//
//  Created by MAHMOUD on 3/15/20.
//  Copyright © 2020 MAHMOUD. All rights reserved.
//

import Foundation
struct CalculatorLogic{
    private var number:Double?
    private var intermediateCalculation:(n1:Double,calcMethod:String)?
    
    mutating func setNumber(_ number:Double)  {
        self.number = number
    }
    mutating func calculate(sympol:String) -> Double? {
        if let n = number{
            switch sympol{
            case "+/-" : return n * -1
            case "%" : return n/100
            case "AC" : return 0
            case "="  : return performCalculation(n2: n)
            default:
                intermediateCalculation=(n,sympol)
            }
        }
        return nil
    }
    func performCalculation(n2:Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
            let opertation = intermediateCalculation?.calcMethod{
            switch opertation{
            case "+" : return n1+n2
            case "-" :  return n1-n2
            case "*" : return n1*n2
            case "/" : return n1/n2
            default:
                return nil
            }
        }
        return nil
    }
}

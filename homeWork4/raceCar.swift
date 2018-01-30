//
//  Car.swift
//  homeWork4
//
//  Created by Younglee on 1/28/18.
//  Copyright © 2018 Younglee. All rights reserved.
//

import Foundation

class RaceCar {
    var carBroke : Bool
    let typeCar : typeCar
    var gas : Double
    var mileage : Double
    private var crashTime : Int
    
    
    init (carBroke: Bool,
         typeCar: typeCar,
         gas : Double,
         mileage: Double,
         crashTime : Int = 0) {
        
        self.carBroke = carBroke
        self.typeCar = typeCar
        self.gas = gas
        self.mileage = mileage
        self.crashTime = crashTime
    }
    
    
    func refillGas (gasToReffill : Double) {
        if gas < 0 {
            carBroke = true
            print("The car is broken, there no gas in car!")
        }
        gas += gasToReffill
        if gas >= 100 {
            print("Gas tank, is full")
        }
        if gas > 100 {
            carBroke = true
            print("The Car is broken, you cannot refine more than 100")
        }
    }
    
    func move(kilometers: Double) {
        let gasLoss = kilometers * 0.01
        gas -= gasLoss
        if gas == 0 {
            crashTime += 1
            if crashTime == 10 {
                carBroke = true
                print("Your car is broken, theres no gas anymore")
            }
        }
    }
    
    func mileagePast (kilometers: Double) {
        mileage += kilometers
        if mileage == 500000 {
            carBroke = true
        }
       
    }
    
    
    
    
    enum typeCar {
        case sedan
        case truck
        case hatchback
    }
    
}


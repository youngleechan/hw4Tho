//
//  ViewController.swift
//  homeWork4
//
//  Created by Younglee on 1/28/18.
//  Copyright © 2018 Younglee. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var GasLabel: UILabel!
    @IBOutlet weak var mileageLabel: UILabel!
    @IBOutlet weak var CarIsBroken: UILabel!
    @IBOutlet weak var GasRefillTextField: UITextField!
    @IBOutlet weak var raceKmTextField: UITextField!
    
    let carName = RaceCar.init(carBroke: false, typeCar: .sedan, gas: 0, mileage: 0)
    override func viewDidLoad() {
        print("Please refill gas before the race! there are no gas in car!")
                GasRefillTextField.keyboardType = .decimalPad
        raceKmTextField.keyboardType = . decimalPad
    }
    
    func setupData() {
        GasLabel.text = "\(carName.gas)"
        CarIsBroken.text = "\(carName.carBroke)"
        mileageLabel.text = "\(carName.mileage)"
    }
    
    @IBAction func gasRefilButton(_ sender: UIButton) {
        let literOfGas = GasRefillTextField.text
        
        if let literOfGas = literOfGas {
            if let literOfGasDouble = Double(literOfGas) {
                carName.refillGas(gasToReffill: literOfGasDouble)
                setupData()
            }
            else {
                print("The text is not a number")
            }
        }
    }
    
    
    @IBAction func raceKmButton(_ sender: UIButton) {
        if let kmRaceString = raceKmTextField.text {
            if let kmDouble = Double (kmRaceString) {
                carName.move(kilometers: kmDouble)
                carName.mileagePast(kilometers: kmDouble)
                setupData()
            }
            else {
                print("the text is not a number")
            }
        }
    }
}


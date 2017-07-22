//
//  CalculatorViewController.swift
//  ConversionCalculator
//
//  Created by Bruce Thomson on 7/20/17.
//  Copyright © 2017 Bruce Thomson. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var upperText: UITextField!
    @IBOutlet weak var bottomText: UITextField!
    
    enum status {
        case f2c
        case c2f
        case m2k
        case k2m
    }
    var myStatus: status = .f2c
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fahrenheitToCelsius()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func convert(_ sender: Any) {
        let converter = UIAlertController(title: "Choose Conversion", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        converter.addAction(UIAlertAction(title: "Fahrenheit to Celsius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
                self.fahrenheitToCelsius()
        }))
        converter.addAction(UIAlertAction(title: "Celsius to Fahrenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
                self.celsiusToFahrenheit()
        }))
        converter.addAction(UIAlertAction(title: "Miles to Kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
                self.milesToKilometers()
        }))
        converter.addAction(UIAlertAction(title: "Kilometers to Miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
                self.kilometersToMiles()
        }))
        converter.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {
            (alertAction) -> Void in
        }))
        
        self.present(converter, animated: true, completion: nil)
        
    }
    @IBAction func clear(_ sender: Any) {
        
        bottomText.text = bottomText.text?.components(separatedBy: CharacterSet.decimalDigits).joined()
        upperText.text = upperText.text?.components(separatedBy: CharacterSet.decimalDigits).joined()
        
        if((bottomText.text?.contains("-"))! || bottomText.text?.contains(".")  == true){
            bottomText.text?.remove(at: (bottomText.text?.startIndex)!)
            if(bottomText.text?.contains(".") == true){
                bottomText.text?.remove(at: (bottomText.text?.startIndex)!)
            }
        }
        if((upperText.text?.contains("-"))! || upperText.text?.contains(".") == true){
            upperText.text?.remove(at: (upperText.text?.startIndex)!)
            if(upperText.text?.contains(".") == true){
                upperText.text?.remove(at: (upperText.text?.startIndex)!)
            }
        }
    }
    
    @IBAction func plusMinus(_ sender: Any) {
        if(bottomText.text?.contains("-") == true){
            bottomText.text?.remove(at: (bottomText.text?.startIndex)!)
        } else{
            bottomText.text?.insert("-", at: (bottomText.text?.startIndex)!)
        }
        recalculate()
    }
    
    @IBAction func zero(_ sender: Any) {
        insertNewChar(newChar: "0")
    }
    @IBAction func decimal(_ sender: Any) {
        insertNewChar(newChar: ".")
    }
    @IBAction func one(_ sender: Any) {
        insertNewChar(newChar: "1")
    }
    @IBAction func two(_ sender: Any) {
        insertNewChar(newChar: "2")
    }
    @IBAction func three(_ sender: Any) {
        insertNewChar(newChar: "3")
    }
    @IBAction func four(_ sender: Any) {
        insertNewChar(newChar: "4")
    }
    @IBAction func five(_ sender: Any) {
        insertNewChar(newChar: "5")
    }
    @IBAction func six(_ sender: Any) {
        insertNewChar(newChar: "6")
    }
    @IBAction func seven(_ sender: Any) {
        insertNewChar(newChar: "7")
    }
    @IBAction func eight(_ sender: Any) {
        insertNewChar(newChar: "8")
    }
    @IBAction func nine(_ sender: Any) {
        insertNewChar(newChar: "9")
    }
    
    func fahrenheitToCelsius() {
        myStatus = .f2c
        if bottomText.text?.isEmpty == true {
            self.upperText.text = " ºC"
            self.bottomText.text = " ºF"
            return
        }
        
        self.bottomText.text = calculateString(calculation: calculateValue())! + " ºF"
        
        let calculation = (calculateValue() - 32) * 0.5556

        self.upperText.text = calculateString(calculation: calculation)! + " ºC"
    }
    
    func celsiusToFahrenheit() {
        myStatus = .c2f
        if bottomText.text?.isEmpty == true {
            self.upperText.text = " ºC"
            self.bottomText.text = " ºF"
            return
        }
        self.bottomText.text = calculateString(calculation: calculateValue())! + " ºC"
        
        let calculation = (calculateValue() * 1.8) + 32
        
        self.upperText.text = calculateString(calculation: calculation)! + " ºF"
    }
    
    func milesToKilometers() {
        myStatus = .m2k
        if bottomText.text?.isEmpty == true {
            self.upperText.text = " km"
            self.bottomText.text = " mi"
            return
        }
        self.bottomText.text = calculateString(calculation: calculateValue())! + " mi"
        
        let calculation = (calculateValue() * 1.609344)
        
        self.upperText.text = calculateString(calculation: calculation)! + " km"
    }
    
    func kilometersToMiles() {
        myStatus = .k2m
        if bottomText.text?.isEmpty == true {
            self.upperText.text = " mi"
            self.bottomText.text = " km"
            return
        }
        self.bottomText.text = calculateString(calculation: calculateValue())! + " km"
        
        let calculation = (calculateValue() * 0.621371)
        
        self.upperText.text = calculateString(calculation: calculation)! + " mi"
    }
    
    func recalculate() {
        switch myStatus {
        case .f2c:
            fahrenheitToCelsius()
        case .c2f:
            celsiusToFahrenheit()
        case .m2k:
            milesToKilometers()
        case .k2m:
            kilometersToMiles()
        }
    }
    
    func calculateValue () -> Double {
        return (bottomText.text?.substring(to: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!) as NSString?)!.doubleValue
    }
    
    func calculateString (calculation: Double) -> String? {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.roundingMode = .down
        return formatter.string(from: NSNumber(value: calculation))
    }
    
    func insertNewChar (newChar: Character) {
        bottomText.text?.insert(newChar, at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
        if newChar != "." {
            if bottomText.text?[(bottomText.text?.characters.index((bottomText.text?.startIndex)!, offsetBy: 1))!] != "." && newChar != "0"{
                recalculate()
            }
        }
//        var previousChar = bottomText.text?.characters.startIndex
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
}


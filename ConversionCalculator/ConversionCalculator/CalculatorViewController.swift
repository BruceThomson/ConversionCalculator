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
    
    var status: String = ""
    
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
        
        self.present(converter, animated: true, completion: nil)
        
    }
    @IBAction func clear(_ sender: Any) {
        
        bottomText.text = bottomText.text?.components(separatedBy: CharacterSet.decimalDigits).joined()
        upperText.text = upperText.text?.components(separatedBy: CharacterSet.decimalDigits).joined()
        if(bottomText.text?.contains(".") == true){
            bottomText.text?.remove(at: (bottomText.text?.startIndex)!)
        }
        if(upperText.text?.contains(".") == true){
            upperText.text?.remove(at: (bottomText.text?.startIndex)!)
        }
        
    }
    
    
    
    @IBAction func zero(_ sender: Any) {

        bottomText.text?.insert("0", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
        recalculate()
        
    }
    @IBAction func decimal(_ sender: Any) {
        bottomText.text?.insert(".", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
        
    }
    @IBAction func one(_ sender: Any) {
        bottomText.text?.insert("1", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
        recalculate()
    }
    @IBAction func two(_ sender: Any) {
        bottomText.text?.insert("2", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
        recalculate()
    }
    @IBAction func three(_ sender: Any) {
        bottomText.text?.insert("3", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
        recalculate()
    }
    @IBAction func four(_ sender: Any) {
        bottomText.text?.insert("4", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
        recalculate()
    }
    @IBAction func five(_ sender: Any) {
        bottomText.text?.insert("5", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
        recalculate()
    }
    @IBAction func six(_ sender: Any) {
        bottomText.text?.insert("6", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
        recalculate()
    }
    @IBAction func seven(_ sender: Any) {
        bottomText.text?.insert("7", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
        recalculate()
    }
    @IBAction func eight(_ sender: Any) {
        bottomText.text?.insert("8", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
        recalculate()
    }
    @IBAction func nine(_ sender: Any) {
        bottomText.text?.insert("9", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
        recalculate()
    }
    
    func fahrenheitToCelsius() {
        status = "f2c"
        if bottomText.text?.isEmpty == true {
            self.upperText.text = " ºC"
            self.bottomText.text = " ºF"
            return
        }
        
        
        var calculation = (bottomText.text?.substring(to: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!) as NSString?)!.doubleValue
        
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.roundingMode = .down
        var result = formatter.string(from: NSNumber(value: calculation))
        
        
        self.bottomText.text = result! + " ºF"
        
        calculation = (calculation - 32) * 0.5556
        result = formatter.string(from: NSNumber(value: calculation))
        self.upperText.text = result! + " ºC"
    
        
        
//        var number = bottomText.text?.components(separatedBy: CharacterSet.decimalDigits).joined()
//        number.
//        return bottomText.text?.substringWithRange(Range<(bottomText.text?).Index>(start: (bottomText.text?).startIndex, end: (bottomText.text?).endIndex, offsetBy: 3))
    }
    
    func celsiusToFahrenheit() {
        self.upperText.text = " ºF"
        self.bottomText.text = " ºC"
    }
    
    func milesToKilometers() {
        self.upperText.text = " km"
        self.bottomText.text = " mi"
    }
    
    func kilometersToMiles() {
        self.upperText.text = " mi"
        self.bottomText.text = " km"
    }
    
    func recalculate() {
        switch status {
        case "f2c":
            fahrenheitToCelsius()
        default:
            return
        }
    }


}

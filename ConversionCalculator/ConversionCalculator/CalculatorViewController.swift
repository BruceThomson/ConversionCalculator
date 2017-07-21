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
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
            self.upperText.text = " ºC"
            self.bottomText.text = " ºF"
        }))
        converter.addAction(UIAlertAction(title: "Celsius to Fahrenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.upperText.text = " ºF"
            self.bottomText.text = " ºC"
        }))
        converter.addAction(UIAlertAction(title: "Miles to Kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.upperText.text = " km"
            self.bottomText.text = " mi"
        }))
        converter.addAction(UIAlertAction(title: "Kilometers to Miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.upperText.text = " mi"
            self.bottomText.text = " km"
        }))
        
        self.present(converter, animated: true, completion: nil)
    }
    @IBAction func clear(_ sender: Any) {
        
        bottomText.text = bottomText.text?.components(separatedBy: CharacterSet.decimalDigits).joined()
        if(bottomText.text?.contains(".") == true){
            bottomText.text?.remove(at: (bottomText.text?.startIndex)!)
        }
        
    }
    
    @IBAction func zero(_ sender: Any) {

        bottomText.text?.insert("0", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
        
    }
    @IBAction func decimal(_ sender: Any) {
         bottomText.text?.insert(".", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
    }
    @IBAction func one(_ sender: Any) {
        bottomText.text?.insert("1", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
    }
    @IBAction func two(_ sender: Any) {
        bottomText.text?.insert("2", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
    }
    @IBAction func three(_ sender: Any) {
        bottomText.text?.insert("3", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
    }
    @IBAction func four(_ sender: Any) {
        bottomText.text?.insert("4", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
    }
    @IBAction func five(_ sender: Any) {
        bottomText.text?.insert("5", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
    }
    @IBAction func six(_ sender: Any) {
        bottomText.text?.insert("6", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
    }
    @IBAction func seven(_ sender: Any) {
        bottomText.text?.insert("7", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
    }
    @IBAction func eight(_ sender: Any) {
        bottomText.text?.insert("8", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
    }
    @IBAction func nine(_ sender: Any) {
        bottomText.text?.insert("9", at: (bottomText.text?.index((bottomText.text?.endIndex)!, offsetBy: -3))!)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

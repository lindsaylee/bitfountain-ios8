//
//  ViewController.swift
//  lemonadeStand
//
//  Created by Lindsay Lee Siovaila on 10/26/14.
//  Copyright (c) 2014 lindsay.siovaila. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Hook up UILabels
    @IBOutlet weak var moneySupplyCount: UILabel!
    @IBOutlet weak var lemonSupplyCount: UILabel!
    @IBOutlet weak var iceCubeSupplyCount: UILabel!
    @IBOutlet weak var lemonPurchaseCount: UILabel!
    @IBOutlet weak var iceCubePurchaseCount: UILabel!
    @IBOutlet weak var lemonMixCount: UILabel!
    @IBOutlet weak var iceCubeMixCount: UILabel!

    var supplies = Supplies(aMoney: 10, aLemons: 1, aIceCubes: 1)
    var price = Price()
    
    var lemonsToPurchase = 0
    var iceCubesToPurchase = 0
    var lemonsToMix = 0
    var iceCubesToMix = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateMainView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //Hook up UIButtons
    @IBAction func purchaseLemonButtonPressed(sender: UIButton) {
        
        if supplies.money >= price.lemon {
            lemonsToPurchase += 1
            supplies.money -= price.lemon
            supplies.lemons += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have enough money.")
        }
        
    }
    
    @IBAction func purchaseIceCubeButtonPressed(sender: UIButton) {
        
        if supplies.money >= price.iceCube {
            iceCubesToPurchase += 1
            supplies.money -= price.iceCube
            supplies.iceCubes += 1
            updateMainView()
        }
        else {
            showAlertWithText(header: "Error:", message: "You don't have enough money.")
        }
        
    }
    
    @IBAction func unpurchaseLemonButtonPressed(sender: UIButton) {
        
        if lemonsToPurchase > 0 {
            lemonsToPurchase -= 1
            supplies.money += price.lemon
            supplies.lemons -= 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have any lemons to return.")
        }
        
    }

    @IBAction func unpurchaseIceCubeButtonPressed(sender: UIButton) {
        
        if iceCubesToPurchase > 0 {
            iceCubesToPurchase -= 1
            supplies.money += price.iceCube
            supplies.iceCubes -= 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have any ice cubes to return.")
        }
        
    }
    
    @IBAction func mixLemonButtonPressed(sender: UIButton) {
        
        if supplies.lemons > 0 {
            lemonsToPurchase = 0
            supplies.lemons -= 1
            lemonsToMix += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have enough inventory.")
        }
        
    }
    
    @IBAction func mixIceCubeButtonPressed(sender: UIButton) {
        
        if supplies.iceCubes > 0 {
            iceCubesToPurchase = 0
            supplies.iceCubes -= 1
            iceCubesToMix += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have enough inventory.")
        }
        
    }
    
    @IBAction func unmixLemonButtonPressed(sender: UIButton) {
        
        if lemonsToMix > 0 {
            lemonsToPurchase = 0
            lemonsToMix -= 1
            supplies.lemons += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have nothing to unmix.")
        }
        
    }
    
    @IBAction func unmixIceCubeButtonPressed(sender: UIButton) {
        
        if iceCubesToMix > 0 {
            iceCubesToPurchase = 0
            iceCubesToMix -= 1
            supplies.iceCubes += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have nothing to unmix.")
        }
        
    }
    
    @IBAction func startDayButtonPressed(sender: UIButton) {
        let customers = Int(arc4random_uniform(UInt32(11))) //numbers 0-10
        println("customers: \(customers)")
        
        if lemonsToMix == 0 || iceCubesToMix == 0 {
            showAlertWithText(message: "You need to add at least 1 Lemon and 1 Ice Cube")
        }
        else {
            let lemonadeRatio = Double(lemonsToMix) / Double(iceCubesToMix)
            
            for x in 0...customers {
                let preference = Double(arc4random_uniform(UInt32(101))) / 100
                if preference < 0.4 && lemonadeRatio > 1 {
                    supplies.money += 1
                    println("Paid")
                }
                else if preference > 0.6 && lemonadeRatio < 1 {
                    supplies.money += 1
                    println("Paid")
                }
                else if preference <= 0.6 && preference >= 0.4 && lemonadeRatio == 1 {
                    supplies.money += 1
                    println("Paid")
                }
                else {
                    println("else statement evaluating")
                }
            }
         
            lemonsToPurchase = 0
            iceCubesToPurchase = 0
            lemonsToMix = 0
            iceCubesToMix = 0
            
        }
    }
    
    //Helper Functions
    func updateMainView () {
        moneySupplyCount.text = "$\(supplies.money)"
        lemonSupplyCount.text = "\(supplies.lemons) lemons"
        iceCubeSupplyCount.text = "\(supplies.iceCubes) Ice Cubes"
        
        lemonPurchaseCount.text = "\(lemonsToPurchase)"
        iceCubePurchaseCount.text = "\(iceCubesToPurchase)"
        
        lemonMixCount.text = "\(lemonsToMix)"
        iceCubeMixCount.text = "\(iceCubesToMix)"
        
    }
    
    func showAlertWithText (header : String = "Warning", message : String) {
        
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert) //makes the default alert 
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil) //present it on the screen
        
    }
    
    
    
    
    
    
    
    
    

}


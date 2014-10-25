//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Lindsay Lee Siovaila on 10/9/14.
//  Copyright (c) 2014 lindsay.siovaila. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myBalloonLabel: UILabel!
    
    var myBalloons:[Balloon] = []
    
    var currentIndex = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.make99Balloons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBalloonBarButtonItemPressed(sender: UIBarButtonItem) {
        
        let balloon = myBalloons[currentIndex]
        
        myBalloonLabel.text = "\(balloon.number) balloon"
        myImageView.image = balloon.image
        
        currentIndex += 1
    }
    
    
    func make99Balloons() {
        
        for var x = 0; x<100; ++x {
            var balloon = Balloon()
            balloon.number = x
            let imageNumber = Int(arc4random_uniform(UInt32(4)))
            
            switch x {
            case 1:
                balloon.image = UIImage(named: "RedBalloon1.jpg")
            case 2:
                balloon.image = UIImage(named: "RedBalloon2.jpg")
            case 3:
                balloon.image = UIImage(named: "RedBalloon3.jpg")
            default:
                balloon.image = UIImage(named: "RedBalloon4.jpg")
            }
            self.myBalloons.append(balloon)
        }

    }
    
}

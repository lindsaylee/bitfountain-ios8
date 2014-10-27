//
//  Supplies.swift
//  lemonadeStand
//
//  Created by Lindsay Lee Siovaila on 10/26/14.
//  Copyright (c) 2014 lindsay.siovaila. All rights reserved.
//

import Foundation

struct Supplies {
    var money = 0
    var lemons = 0
    var iceCubes = 0
    
    init (aMoney : Int, aLemons: Int, aIceCubes: Int) {
        money = aMoney
        lemons = aLemons
        iceCubes = aIceCubes
    }
}
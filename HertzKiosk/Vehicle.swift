//
//  Vehicle.swift
//  HertzKiosk
//
//  Created by Haley Ovenhouse on 2/20/19.
//  Copyright © 2019 Haley Ovenhouse. All rights reserved.
//

import Foundation

class Vehicle {
    var year: String
    var make: String
    var model: String
    var image: String
    
    init(year: String, make: String, model: String, image: String) {
        self.year = year
        self.make = make
        self.model = model
        self.image = image
    }
}

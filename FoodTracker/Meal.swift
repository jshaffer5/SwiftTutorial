//
//  Meal.swift
//  FoodTracker
//
//  Created by js on 2/3/17.
//  Copyright © 2017 js. All rights reserved.
//

import UIKit

class Meal {
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
       
        // Name can't be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // Rating must be in range 0..5
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Init stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
}

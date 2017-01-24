//
//  RatingControl.swift
//  FoodTracker
//
//  Created by js on 1/24/17.
//  Copyright © 2017 js. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    required init(coder: NSCoder){
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton){
        print("Button pressed")
    }
    
    //MARK: Private Methods

    private func setupButtons(){
        
        // Create the button
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        
        //add constraints
        button.translatesAutoresizingMaskIntoConstraints = false //disables auto-generated constraints
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        // Setup the button action
        button.addTarget(self, action:
            #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        //note: last argument is the same as saying for: UIControlEvents.touchUpInside
        
        //add the button to the stack
        addArrangedSubview(button)
    }
}

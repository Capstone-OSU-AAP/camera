//
//  HomeController.swift
//  Automotive English Program
//
//  Created by Tyler Stone on 5/25/16.
//  Copyright © 2016 Honda+OSU. All rights reserved.
//

import UIKit
import Foundation

class HomeController: UIViewController{
    
    @IBOutlet weak var WelcomeTextLabel: UILabel!
    @IBOutlet weak var HowToGetStartedTextButton: UIButton!
    @IBOutlet weak var MyCoachTextButton: UIButton!
    @IBOutlet weak var LessonsTextButton: UIButton!
    @IBOutlet weak var MyProfileTextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Home Page loaded.")
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
     
            WelcomeTextLabel.text = "Welcome!"
            HowToGetStartedTextButton.setTitle("How to get started", forState: UIControlState())
            MyCoachTextButton.setTitle("My Coach", forState: UIControlState())
            LessonsTextButton.setTitle("Lessons", forState: UIControlState())
            MyProfileTextButton.setTitle("My Profile", forState: UIControlState())

    }
   
}

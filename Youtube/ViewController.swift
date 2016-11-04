//
//  ViewController.swift
//  Youtube
//
//  Created by Sophia KC on 01/11/2016.
//  Copyright © 2016 Sophia KC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // Outlets
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var feedView: UIView!
    
    // Variables
    var menuViewController: UIViewController!
    var feedViewController: UIViewController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a reference to the the appropriate storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate the desired view controller from the storyboard using the view controllers identifier
        // Cast is as the custom view controller type you created in order to access it's properties and methods
        let MenuViewController = storyboard.instantiateViewController(withIdentifier: "menuViewController") as! ViewController
        
        let FeedViewController = storyboard.instantiateViewController(withIdentifier: "feedViewController") as! ViewController
        
        
        
    }



}


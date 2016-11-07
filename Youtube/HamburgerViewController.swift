//
//  HamburgerViewController.swift
//  Youtube
//
//  Created by Sophia KC on 01/11/2016.
//  Copyright © 2016 Sophia KC. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var menuHamburgerView: UIView!
    @IBOutlet weak var feedHamburgerView: UIView!
    
    
    // Variables
    var feedViewController: UIViewController!
    var menuViewController: UIViewController!
    
    var feedViewRightOffset: CGFloat!
    var feedViewLeft: CGPoint!
    var feedViewRight: CGPoint!
    var feedViewOriginalCenter: CGPoint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        
        // To show a certain view, pick the right order in the storyboard, not below
        // To do some book keeping: addChildViewController
        menuViewController = main.instantiateViewController(withIdentifier: "MenuViewController")
        menuViewController.view.frame = menuHamburgerView.bounds
        addChildViewController(menuViewController)
        menuHamburgerView.addSubview(menuViewController.view)
        
        feedViewController = main.instantiateViewController(withIdentifier: "FeedViewController")
        feedViewController.view.frame = feedHamburgerView.bounds
        addChildViewController(feedViewController)
        feedHamburgerView.addSubview(feedViewController.view)
        
        // Hide Menu View
        feedViewLeft = feedHamburgerView.center
        // Reveal Menu View of the given offset
        feedViewRightOffset = 274
        feedViewRight = CGPoint(x: feedHamburgerView.center.x + feedViewRightOffset ,y: feedHamburgerView.center.y)
        
    }
    
    
    @IBAction func didPanFeed(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        //        let location = sender.location(in: view)
        
        
        if sender.state == .began {
            print (translation.x)
            
            // Record the original center of feedView
            feedViewOriginalCenter = feedHamburgerView.center
            
        } else if sender.state == .changed {
            
            //            if translation
            feedHamburgerView.center.x = feedViewOriginalCenter.x + translation.x
            print (translation.x)
            
            
        } else if sender.state == .ended {
            
            print (translation.x)
            
            // If panning right
            if velocity.x > 0 {
                UIView.animate(withDuration:0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.feedHamburgerView.center = self.feedViewRight
                    }, completion: nil)
            } else {
                UIView.animate(withDuration:0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.feedHamburgerView.center = self.feedViewLeft
                    }, completion: nil)
            }
        }

    }
}

//
//  ViewController.swift
//  ZDT_ExpandCircle
//
//  Created by Sztanyi Szabolcs on 27/02/15.
//  Copyright (c) 2015 Sztanyi Szabolcs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    let loginTransitionDelegate = LoginTransitionDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = CGRectGetHeight(button.frame)/2 // make the button rounded
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController: UIViewController = segue.destinationViewController as UIViewController
        destinationViewController.transitioningDelegate = loginTransitionDelegate
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}


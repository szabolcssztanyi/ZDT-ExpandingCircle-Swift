//
//  LoginTransitionDelegate.swift
//  ZDT_ExpandCircle
//
//  Created by Sztanyi Szabolcs on 27/02/15.
//  Copyright (c) 2015 Sztanyi Szabolcs. All rights reserved.
//

import UIKit

class LoginTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
   
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LoginTransitionAnimator()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LoginTransitionAnimatorDismiss()
    }
}

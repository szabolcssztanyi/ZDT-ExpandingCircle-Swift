//
//  LoginTransitionAnimatorDismiss.swift
//  ZDT_ExpandCircle
//
//  Created by Sztanyi Szabolcs on 13/03/15.
//  Copyright (c) 2015 Sztanyi Szabolcs. All rights reserved.
//

import UIKit

class LoginTransitionAnimatorDismiss: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as DetailViewController
        let destinationController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)! as ViewController
        
        let containerView = transitionContext.containerView() as UIView

        destinationController.view.alpha = 0.0
        containerView.addSubview(destinationController.view)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
            destinationController.view.alpha = 1.0
        }) { (finished) -> Void in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}

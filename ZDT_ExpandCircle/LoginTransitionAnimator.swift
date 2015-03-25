//
//  LoginTransitionAnimator.swift
//  ZDT_ExpandCircle
//
//  Created by Sztanyi Szabolcs on 27/02/15.
//  Copyright (c) 2015 Sztanyi Szabolcs. All rights reserved.
//

import UIKit

class LoginTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
   
    var transitionContext: UIViewControllerContextTransitioning?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
 
    /**
        With masking transition
    */
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as ViewController
        let destinationController: UIViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let destinationView = destinationController.view
        
        let containerView = transitionContext.containerView()
        
        containerView.addSubview(destinationController.view)
        
        let buttonFrame = fromViewController.button.frame
        let endFrame = CGRectMake(-CGRectGetWidth(destinationView.frame)/2, -CGRectGetHeight(destinationView.frame)/2, CGRectGetWidth(destinationView.frame)*2, CGRectGetHeight(destinationView.frame)*2)
        
        containerView.addSubview(fromViewController.view)
        containerView.addSubview(destinationView)
        
        var maskPath = UIBezierPath(ovalInRect: buttonFrame)
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = destinationView.frame
        maskLayer.path = maskPath.CGPath
        destinationController.view.layer.mask = maskLayer
        
        let bigCirclePath = UIBezierPath(ovalInRect: endFrame)
        
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.delegate = self
        pathAnimation.fromValue = maskPath.CGPath
        pathAnimation.toValue = bigCirclePath
        pathAnimation.duration = transitionDuration(transitionContext)
        maskLayer.path = bigCirclePath.CGPath
        maskLayer.addAnimation(pathAnimation, forKey: "pathAnimation")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        if let transitionContext = self.transitionContext {
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}

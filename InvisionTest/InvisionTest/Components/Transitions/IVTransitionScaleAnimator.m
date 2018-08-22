//
//  IVTransitionScaleAnimator.m
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import "IVTransitionScaleAnimator.h"

@implementation IVTransitionScaleAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    //TODO: PASS THE ORIGIN RECT FROM THE CELL instead
    
    CGAffineTransform origin =CGAffineTransformMakeScale(0.1, 0.1);
    
    if(self.reversed){
        
        [[transitionContext containerView] sendSubviewToBack:toViewController.view];
        
        fromViewController.view.alpha = 1;
        fromViewController.view.transform = CGAffineTransformIdentity;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromViewController.view.alpha = 0;
            fromViewController.view.transform = origin;
            
        } completion:^(BOOL finished) {
            //        fromViewController.view.transform = CGAffineTransformIdentity;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            
        }];
        
    } else{
        
        toViewController.view.alpha = 0;
        toViewController.view.transform = origin;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toViewController.view.alpha = 1;
            toViewController.view.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            //        fromViewController.view.transform = CGAffineTransformIdentity;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            
        }];
    }
    
    
}

@end

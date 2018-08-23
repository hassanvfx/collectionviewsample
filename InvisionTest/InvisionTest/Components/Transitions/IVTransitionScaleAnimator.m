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
    return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
   
    //TODO: PASS THE ORIGIN RECT FROM THE CELL instead
    
//    CGAffineTransform origin =CGAffineTransformMakeScale(0.1, 0.1);
    
    NSAssert(!CGRectIsEmpty(self.originRect), @"origin rect must be set");
    
    CGAffineTransform scaleTransform = [self transformFromRect:toViewController.view.frame toRect:self.originRect];
    
    if(self.reversed){
        
        //SCALE OUT
        

        [[transitionContext containerView] sendSubviewToBack:toViewController.view];
        
     
        fromViewController.view.backgroundColor=[UIColor whiteColor];
        fromViewController.view.transform = CGAffineTransformIdentity;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            
          
            
            fromViewController.view.backgroundColor=[UIColor clearColor];
            fromViewController.view.transform = scaleTransform;
            
        } completion:^(BOOL finished) {
            //        fromViewController.view.transform = CGAffineTransformIdentity;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            
        }];
        
    } else{
        
        /// SCALE IN
        
        
        toViewController.view.backgroundColor=[UIColor clearColor];
        toViewController.view.transform = scaleTransform;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            
           
            toViewController.view.backgroundColor=[UIColor whiteColor];
            toViewController.view.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            //        fromViewController.view.transform = CGAffineTransformIdentity;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            
        }];
    }
    
    
}

- (CGAffineTransform) transformFromRect:(CGRect)sourceRect toRect:(CGRect)finalRect {
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformTranslate(transform, -(CGRectGetMidX(sourceRect)-CGRectGetMidX(finalRect)), -(CGRectGetMidY(sourceRect)-CGRectGetMidY(finalRect)));
    transform = CGAffineTransformScale(transform, finalRect.size.width/sourceRect.size.width, finalRect.size.height/sourceRect.size.height);
    
    return transform;
}


@end

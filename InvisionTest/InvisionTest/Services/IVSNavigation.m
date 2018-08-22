//
//  IVSNavigation.m
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import "IVRootViewController.h"
#import "IVNavigationViewController.h"
#import "IVFullScreenController.h"
#import "IVTransitionScaleAnimator.h"

@interface IVSNavigation()<UINavigationControllerDelegate>
@property(strong)IVNavigationViewController *navigationController;
@end

@implementation IVSNavigation

-(void)setupWithWindow:(UIWindow*)window{
    
    IVRootViewController *mainNav=[IVRootViewController new];
    
    mainNav.view.backgroundColor=[UIColor redColor];
  
    self.navigationController = [[IVNavigationViewController alloc] initWithRootViewController:mainNav];
    self.navigationController.delegate=self;
    
    [self.navigationController setNavigationBarHidden:YES];
    
    self.interactionController = [UIPercentDrivenInteractiveTransition new];
    
    window.rootViewController = self.navigationController;
    [window makeKeyAndVisible];
}


-(void)presentListItemPreview:(IVListItem*)listItem{
    
    NSAssert(listItem, @"listitem must be provided!");
    IVFullScreenController *controller = [IVFullScreenController new];
    [controller setupWithListItem:listItem];
    
    [self.navigationController pushViewController:controller animated:YES];
    
}

-(void)presentRootController{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma makr - TRANSITIONS STUFF

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    
    IVTransitionScaleAnimator *animator= [IVTransitionScaleAnimator new];
    animator.originRect=self.lastAnimationOriginRect;
    
    if([fromVC isKindOfClass:IVFullScreenController.class]){
        animator.reversed=YES;
    }
    return  animator;
}





- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                         interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    
      return nil;
}


@end

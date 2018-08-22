//
//  IVTransitionScaleAnimator.h
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IVTransitionScaleAnimator :  NSObject <UIViewControllerAnimatedTransitioning>

@property(assign)BOOL reversed;
@property(assign)CGRect originRect;

@end

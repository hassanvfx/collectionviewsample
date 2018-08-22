//
//  IVSNavigation.h
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IVSNavigation : NSObject

@property (strong, nonatomic) UIPercentDrivenInteractiveTransition* interactionController;
@property(assign)CGRect lastAnimationOriginRect;

-(void)setupWithWindow:(UIWindow*)window;

-(void)presentListItemPreview:(IVListItem*)listItem;
-(void)presentRootController;
-(void)presentRootControllerWithInteractivity;

-(void)updateInteractiveTransition:(float)percent;
-(void)finishTransition:(BOOL)completed;
@end

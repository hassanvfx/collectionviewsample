//
//  IVFullScreenController.h
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IVFullScreenController : UIViewController

@property(strong)IVListItem *listItem;

-(void)setupWithListItem:(IVListItem*)listItem;
@end

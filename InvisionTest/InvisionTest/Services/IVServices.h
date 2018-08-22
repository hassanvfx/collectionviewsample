//
//  IVServices.h
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import "IVSNavigation.h"
#import "IVSSeedData.h"
@interface IVServices : NSObject

+(IVSNavigation*)navigation;
+(IVSSeedData*)seed;
@end

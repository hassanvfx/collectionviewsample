//
//  IVImageDisplay.h
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IVImageDisplay : UIView

@property(strong,nonatomic)UIImageView *imageView;
-(void)displayImage:(UIImage*)image;
@end

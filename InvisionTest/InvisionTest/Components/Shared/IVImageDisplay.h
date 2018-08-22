//
//  IVImageDisplay.h
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IVImageDisplay;
BLOCK_TYPEDEF(IVImageDisplayTouchBlock, void, (IVImageDisplay *view))

@interface IVImageDisplay : UIView

@property(strong,nonatomic)UIImageView *imageView;
@property(copy)IVImageDisplayTouchBlock didTouchBlock;

-(void)setupWithFrame:(CGRect)frame;
-(void)setDidTouchBlock:(IVImageDisplayTouchBlock)didTouchBlock; // for autocompletion
-(void)displayImage:(UIImage*)image;

@end

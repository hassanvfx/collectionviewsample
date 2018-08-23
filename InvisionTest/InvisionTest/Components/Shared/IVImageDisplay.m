//
//  IVImageDisplay.m
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import "IVImageDisplay.h"

@implementation IVImageDisplay


-(void)setupWithFrame:(CGRect)frame{
    self.frame=frame;
    
    _imageView=[UIImageView new];
    _imageView.frame=self.bounds;
    _imageView.contentMode=UIViewContentModeScaleAspectFit;
    
    self.backgroundColor=[UIColor whiteColor];
    
    [self addSubview:_imageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [tap addTarget:self action:@selector(didTap:)];
    
    [self addGestureRecognizer:tap];
    
}

#pragma mark -

-(void)displayImage:(UIImage*)image{
    
    WEAK_SELF
    ASYNC_MAIN( ^{
        wself.imageView.frame=wself.bounds;
        wself.imageView.image=image;
        [wself.imageView setNeedsDisplay];
    });
    
}
#pragma mark -gesture

-(void)didTap:(UIGestureRecognizer*)gesture{
    
    WEAK_SELF
    if(!self.didTouchBlock)return;
    
    self.didTouchBlock(wself);
}


@end

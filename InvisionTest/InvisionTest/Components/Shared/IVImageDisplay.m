//
//  IVImageDisplay.m
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import "IVImageDisplay.h"

@implementation IVImageDisplay

-(UIImageView*)imageView{
    @synchronized(self){
        if(!_imageView){
            _imageView=[UIImageView new];
            _imageView.contentMode=UIViewContentModeScaleAspectFit;
            [self addSubview:_imageView];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
            [tap addTarget:self action:@selector(didTap:)];
            
            [self addGestureRecognizer:tap];
        }
        return  _imageView;
    }
}


#pragma mark -
-(void)layoutSubviews{
    self.imageView.frame=self.bounds;
}
-(void)displayImage:(UIImage*)image{
    ASYNC_MAIN(^{
        self.imageView.image=image;
    });
    
}
#pragma mark -gesture

-(void)didTap:(UIGestureRecognizer*)gesture{
    
    WEAK_SELF
    if(!self.didTouchBlock)return;
    
    self.didTouchBlock(wself);
}


@end

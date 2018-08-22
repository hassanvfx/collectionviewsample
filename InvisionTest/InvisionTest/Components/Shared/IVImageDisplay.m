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
        }
        return  _imageView;
    }
}

-(void)layoutSubviews{
    self.imageView.frame=self.bounds;
}
-(void)displayImage:(UIImage*)image{
    self.imageView.image=image;
}
@end

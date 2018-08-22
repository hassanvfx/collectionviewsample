//
//  IVImagePreviewCell.m
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import "IVListItemCell.h"

@interface IVListItemCell ()

@end

@implementation IVListItemCell


-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame: frame];
    [self setupCell];
    return self;
}

-(void)setupCell{
    WEAK_SELF
    _imageDisplay = [IVImageDisplay new];
    
    [_imageDisplay setDidTouchBlock:^(IVImageDisplay *imageDisplay) {
        [wself didTapImageDisplay:imageDisplay];
    }];
    [self addSubview:_imageDisplay];
}

-(void)didTapImageDisplay:(IVImageDisplay*)imageDisplay{
    WEAK_SELF
    
    if(!self.didTouchBlock)return;
    self.didTouchBlock(wself);
}

-(void)layoutSubviews{
    
    self.imageDisplay.frame =self.bounds;
}

-(void)updateWithListItem:(IVListItem*)listItem{
  
    self.listItem=listItem;
    
//    if([self.listItem.index integerValue]%2==0){
//        self.imageDisplay.backgroundColor=[UIColor redColor];
//    }else{
//        self.imageDisplay.backgroundColor=[UIColor blueColor];
//    }
    
    [self.listItem loadImageWithCompletionBlock:^(UIImage *image) {
        
        NSAssert(image, @"an image is expected to exist!");
        [self.imageDisplay displayImage:image];
    }];
    
    
    
}


@end

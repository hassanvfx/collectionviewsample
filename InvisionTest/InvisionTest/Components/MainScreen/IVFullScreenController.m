//
//  IVFullScreenController.m
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import "IVFullScreenController.h"
#import "IVImageDisplay.h"

@interface IVFullScreenController()
@property(strong)IVImageDisplay *imageDisplay;
@end

@implementation IVFullScreenController

-(void)viewDidLoad{
    [super viewDidLoad];
    
//    self.view.clipsToBounds=YES;
    [self setupSubviews];
}


-(void)setupSubviews{
    
    
    _imageDisplay = [IVImageDisplay new];
    _imageDisplay.autoresizingMask=UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    _imageDisplay.frame=self.view.bounds;
    
    [self.view addSubview:_imageDisplay];
    
    _imageDisplay.backgroundColor=[UIColor redColor];
    
    [_imageDisplay setDidTouchBlock:^(IVImageDisplay *view) {
        [[IVServices navigation]presentRootController];
    }];
}


-(void)setupWithListItem:(IVListItem*)listItem{
   
    NSAssert(listItem, @"listitem must be provided");
    
    self.listItem = listItem;
    [self.listItem loadImageWithCompletionBlock:^(UIImage *image) {
        
        NSAssert(image, @"an image is expected to exist!");
        [self.imageDisplay displayImage:image];
    }];
    
}

@end

//
//  IVFullScreenController.m
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import "IVFullScreenController.h"
#import "IVImageDisplay.h"

#define MINIMUM_SCALE_TO_TRANSITION 0.5

@interface IVFullScreenController()
@property(strong)IVImageDisplay *imageDisplay;
@property(assign)float currentScale;
@end

@implementation IVFullScreenController


#pragma mark - helpers

-(void)setupWithListItem:(IVListItem*)listItem{
    
    WEAK_SELF
    NSAssert(listItem, @"listitem must be provided");
    
    [self setupSubviews];
    [self setupGestures];
    
    self.listItem = listItem;
    [self.listItem loadImageWithCompletionBlock:^(UIImage *image) {
        
        NSAssert(YES, @"an image is expected to exist!");
        [wself.imageDisplay displayImage:image];

    }];
    
}

-(void)setupSubviews{
    
    _imageDisplay = [IVImageDisplay new];
    [_imageDisplay setupWithFrame:self.view.bounds];
    
    [self.view addSubview:_imageDisplay];
    
    
    [_imageDisplay setDidTouchBlock:^(IVImageDisplay *view) {
        [[IVServices navigation]presentRootController];
    }];
}

#pragma mark - Gestures

-(void)setupGestures{
    
    UIPinchGestureRecognizer *pinch = [UIPinchGestureRecognizer new];
    [pinch addTarget:self action:@selector(didPinch:)];
    
    [self.view addGestureRecognizer:pinch];
    
}

-(void)didPinch:(UIPinchGestureRecognizer*)pinchGesture{
    
    if (pinchGesture.numberOfTouches != 2)return;
    
    if(pinchGesture.state == UIGestureRecognizerStateBegan){
        
        [self startTranstion];
        
    } else if(pinchGesture.state==UIGestureRecognizerStateChanged){
        
        
        [self applyScale:pinchGesture.scale];
        
    } else if (pinchGesture.state == UIGestureRecognizerStateEnded){
        
        if(self.currentScale<MINIMUM_SCALE_TO_TRANSITION){
            [self finishTransition:YES];
        }else{
            [self finishTransition:NO];
        }
        
    } else if (pinchGesture.state == UIGestureRecognizerStateFailed ||
               pinchGesture.state == UIGestureRecognizerStateCancelled ){
        
        [self finishTransition:NO];
        
    }
}

-(void)startTranstion{
    
    [[IVServices navigation]presentRootControllerWithInteractivity];
}

-(void)finishTransition:(BOOL)completed{
    [[IVServices navigation] finishTransition:completed];
}

-(void)applyScale:(float)scale{
    
    self.currentScale=scale;
    
    float percent=MIN(MAX(scale,0.0),1.0);
    percent=1.0-scale;
    NSLog(@"scale %f",percent);
    [[IVServices navigation]updateInteractiveTransition:percent];
}

@end

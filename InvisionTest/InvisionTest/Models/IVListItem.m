//
//  IVListItem.m
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import "IVListItem.h"

@implementation IVListItem

-(id)initWithImageName:(NSString*)imageName{
    self=[super init];
    _imageName=imageName;
    return self;
}


-(void)loadImageWithCompletionBlock:(IVListItemImageBlock)completion{
    
    NSAssert(completion, @"A completion block is required!");
    
    //we may want to load an image from a server url
    // for now we load from resources
    UIImage *image = [UIImage imageNamed:self.imageName];
    NSAssert(image, @"image is expected here");
    //    ASYNC_MAIN(^{
    completion(image);
    //    });
}

@end

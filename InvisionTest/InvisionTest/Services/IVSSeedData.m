//
//  IVSSeedData.m
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import "IVSSeedData.h"

#define FIRST_DUMMIE_IMAGE_INDEX 1
#define LAST_DUMMIE_IMAGE_INDEX 5 // see Assets/ImageList

@implementation IVSSeedData

#pragma mark -


// NOTE TODO: we need to add a test case to ensure the factory produces elements with both INDEX and IMAGENAME

-(NSArray*)listIitems{
    
    NSMutableArray *result =[ NSMutableArray new];
    
    for(int i=FIRST_DUMMIE_IMAGE_INDEX; i <=LAST_DUMMIE_IMAGE_INDEX; i ++){
        NSString *imageName = [NSString stringWithFormat:@"image%d",i];
        IVListItem *item=[self listItemFromAssetName:imageName] ;
        item.index=@(i);
        [result addObject:item];
    }
    
    return  result;
}

#pragma mark -
#pragma mark Dummie factories
/// DUMMIE FACTORY
-(IVListItem*)listItemFromAssetName:(NSString*)name{
    IVListItem *item = [[IVListItem alloc]initWithImageName:name];
    return item;
}

@end

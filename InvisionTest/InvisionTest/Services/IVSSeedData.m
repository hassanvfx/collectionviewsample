//
//  IVSSeedData.m
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import "IVSSeedData.h"


#define LAST_DUMMIE_IMAGE_INDEX 5 // see Assets/ImageList
#define TOTAL_DUMMIE_IMAGES 20

@implementation IVSSeedData

#pragma mark -


// NOTE TODO: we need to add a test case to ensure the factory produces elements with both INDEX and IMAGENAME

-(NSArray*)listIitems{
    
    NSMutableArray *result =[ NSMutableArray new];
    
    for(int i=0; i <=TOTAL_DUMMIE_IMAGES; i ++){
        int index = (i%LAST_DUMMIE_IMAGE_INDEX)+1;
        NSString *imageName = [NSString stringWithFormat:@"image%d",index];
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

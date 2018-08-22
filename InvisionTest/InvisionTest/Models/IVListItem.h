//
//  IVListItem.h
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import <Foundation/Foundation.h>

BLOCK_TYPEDEF(IVListItemImageBlock, void, (UIImage *view))

@interface IVListItem : NSObject

@property(strong)NSString *imageName;
@property(strong)NSNumber *index;

-(id)initWithImageName:(NSString*)imageName;

//we may want to load an image from a server like
-(void)loadImageWithCompletionBlock:(IVListItemImageBlock)completion;


@end

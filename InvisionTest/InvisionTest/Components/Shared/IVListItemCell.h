//
//  IVImagePreviewCell.h
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import "IVImageDisplay.h"

@class  IVListItemCell;
BLOCK_TYPEDEF(IVListItemCellTouchBlock, void, (IVListItemCell *view))


static NSString * const kIVIVListItemCellIdentifier = @"kIVIVListItemCellIdentifier";

@interface IVListItemCell : UICollectionViewCell

@property(strong)IVImageDisplay *imageDisplay;
@property(strong)IVListItem *listItem;

@property(copy)IVListItemCellTouchBlock didTouchBlock;
-(void)setDidTouchBlock:(IVListItemCellTouchBlock)didTouchBlock;

-(void)updateWithListItem:(IVListItem*)listItem;
@end

//
//  IVRootViewController.m
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import "IVRootViewController.h"
#import "IVListItemCell.h"

@interface IVRootViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property(strong)UICollectionView *collectionView;
@end

@implementation IVRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollectionView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setupCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [_collectionView setBounces:YES];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    _collectionView.alwaysBounceVertical = YES;
   
    [_collectionView registerClass:[IVListItemCell class] forCellWithReuseIdentifier:kIVIVListItemCellIdentifier];
    
//    _collectionView.backgroundColor=[UIColor blueColor];
    
    [self.view addSubview:_collectionView];
}

#pragma mark DATA SOURCE DELEGATE METHODS

// Number of sections
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self listItems].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    WEAK_SELF
    
    IVListItemCell *cell= (IVListItemCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kIVIVListItemCellIdentifier forIndexPath:indexPath];

    [cell setDidTouchBlock:^(IVListItemCell *cell) {
        [wself didTapCell:cell];
    }];
    
    IVListItem *item =[self listItemForIndex:indexPath.row];
    if(item){
        [cell updateWithListItem:item];
    }
    
    return cell;
}



#pragma  mark LAyout delegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
   
    NSInteger size=self.collectionView.bounds.size.width/2;
    return CGSizeMake(size,size);
}

- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}


#pragma mark -
#pragma mark Data Fetching Adaptor

//Note: This is temporary
// we can replace this later by data coming from an API
// or other resource

- (NSArray*) listItems{
    return  [[IVServices seed]listIitems];
}

-(IVListItem*) listItemForIndex:(NSInteger)index{
    if(index >= [self listItems].count){
        NSAssert(NO, @"Susbcript out of range!");
        return nil;
    }
    
    return [[self listItems]objectAtIndex:index];
}

#pragma mark -
#pragma mark responding

-(void)didTapCell:(IVListItemCell*)cell{
    
    CGRect rect=  [cell.superview convertRect:cell.frame toView:self.view];
   
//    rect=CGRectMake(0, 0, 100, 100);
    [IVServices navigation].lastAnimationOriginRect =rect;
   
    [[IVServices navigation]presentListItemPreview:cell.listItem];
}

@end

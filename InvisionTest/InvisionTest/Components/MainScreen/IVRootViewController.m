//
//  IVRootViewController.m
//  InvisionTest
//
//  Created by hassan uriostegui on 8/22/18.
//  Copyright © 2018 hassanvfx. All rights reserved.
//

#import "IVRootViewController.h"
#import "IVImagePreviewCell.h"

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
   
    [_collectionView registerClass:[IVImagePreviewCell class] forCellWithReuseIdentifier:kIVImagePreviewCellIdentifier];
    
    _collectionView.backgroundColor=[UIColor blueColor];
    
    [self.view addSubview:_collectionView];
}

#pragma mark DATA SOURCE DELEGATE METHODS

// Number of sections
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
  
    IVImagePreviewCell *cell= (IVImagePreviewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kIVImagePreviewCellIdentifier forIndexPath:indexPath];

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

@end

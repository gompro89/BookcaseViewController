//
//  BookcaseViewController.m
//  BookcaseViewController
//
//  Created by 朴 根佑 on 2015/11/27.
//  Copyright © 2015年 KWP. All rights reserved.
//

#import "BookcaseViewController.h"

#import "BookcaseImportLists.h"

@interface BookcaseViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSMutableArray *bookcaseConstraints;
    NSMutableArray *memberConstraints;
}

@end

@implementation BookcaseViewController


static NSString * const reuseMemberCellId = @"MemberListCell";
static NSString * const reuseBookcaseCellId = @"BookcaseListCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell nibs
    
    [self.vBookcaseCollectionView registerNib:[UINib nibWithNibName:reuseBookcaseCellId bundle:nil] forCellWithReuseIdentifier:reuseBookcaseCellId];
    [self.vMemberCollectionView registerNib:[UINib nibWithNibName:reuseMemberCellId bundle:nil] forCellWithReuseIdentifier:reuseMemberCellId];
    
    [self.lBookcaseCollectionView registerNib:[UINib nibWithNibName:reuseBookcaseCellId bundle:nil] forCellWithReuseIdentifier:reuseBookcaseCellId];
    [self.lMemberCollectionView registerNib:[UINib nibWithNibName:reuseMemberCellId bundle:nil] forCellWithReuseIdentifier:reuseMemberCellId];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView == self.vBookcaseCollectionView || collectionView == self.lBookcaseCollectionView)
        return [self customBookcaseCV:collectionView cellForItemAtIndexPath:indexPath];
    else
        return [self customMemberCV:collectionView cellForItemAtIndexPath:indexPath];
    
}

- (BookcaseListCell *)customBookcaseCV:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BookcaseListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseBookcaseCellId forIndexPath:indexPath];
    
    return cell;
}

- (MemberListCell *)customMemberCV:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MemberListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseMemberCellId forIndexPath:indexPath];
    
    return cell;
}


#pragma mark <UICollectionViewDelegate>

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */


#pragma mark -
#pragma mark orientation

@end

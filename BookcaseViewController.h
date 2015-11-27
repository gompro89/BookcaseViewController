//
//  BookcaseViewController.h
//  BookcaseViewController
//
//  Created by 朴 根佑 on 2015/11/27.
//  Copyright © 2015年 KWP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookcaseViewController : UIViewController

//vertical
@property (weak, nonatomic) IBOutlet UICollectionView *vMemberCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *vBookcaseCollectionView;

//landscape
@property (weak, nonatomic) IBOutlet UICollectionView *lMemberCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *lBookcaseCollectionView;


@end


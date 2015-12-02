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
@property (weak, nonatomic) IBOutlet UICollectionView *memberCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *bookcaseCollectionView;

@property (weak, nonatomic) IBOutlet UIView *detailView;
@property (weak, nonatomic) IBOutlet UIImageView *detailMainImage;
@property (weak, nonatomic) IBOutlet UIButton *bookCaseCVSizeBtn;
//@property (weak, nonatomic) IBOutlet UIView *grayView;

@end


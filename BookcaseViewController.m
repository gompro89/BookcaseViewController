//
//  BookcaseViewController.m
//  BookcaseViewController
//
//  Created by 朴 根佑 on 2015/11/27.
//  Copyright © 2015年 KWP. All rights reserved.
//

#import "BookcaseViewController.h"
#import "UIImage+KWImageEdit.h"
#import "BookcaseImportLists.h"
#import "TextImage/TextImage.h"
#import "AppDelegate.h"

@interface BookcaseViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    //bookcase、memberListのcollectionViewが回転するたびに、flowLayoutを変える。
    UICollectionViewFlowLayout *bookcaseflowLayout;
    UICollectionViewFlowLayout *memberListflowLayout;
    
    //bookcaseのサイズのフラグ（bookcaseBtnの位置も調整）
    //1：サイズ　100、位置　現在位置の+100
    //2：サイズ　200、位置　現在位置の-100
    NSInteger bookcaseLV;
    
    //Vertical BookcaseCollectionViewの高さ constant
    __weak IBOutlet NSLayoutConstraint *bookcaseCVConstraint;
    
    //Landscape BookcaseCollectionViewの高さ constant
    __weak IBOutlet NSLayoutConstraint *lbookcaseCVConstraint;
    
}

@end

@implementation BookcaseViewController


static NSString * const reuseMemberCellId = @"MemberListCell";
static NSString * const reuseBookcaseCellId = @"BookcaseListCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Register cell nibs
    
    [self.bookcaseCollectionView registerNib:[UINib nibWithNibName:reuseBookcaseCellId bundle:nil] forCellWithReuseIdentifier:reuseBookcaseCellId];
    [self.memberCollectionView registerNib:[UINib nibWithNibName:reuseMemberCellId bundle:nil] forCellWithReuseIdentifier:reuseMemberCellId];
    
    // Do any additional setup after loading the view.
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initData
{
    [self.grayView setHidden:YES];
    bookcaseLV = 1;
}

-(void)viewDidAppear:(BOOL)animated
{
    [self collectionView:self.bookcaseCollectionView didSelectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}

#pragma mark checkOrientation
-(BOOL)isCurrentPortraitOrientation
{
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        return YES;
    }
    else {
        return NO;
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView == self.bookcaseCollectionView)
        return [self customBookcaseCV:collectionView cellForItemAtIndexPath:indexPath];
    else
        return [self customMemberCV:collectionView cellForItemAtIndexPath:indexPath];
    
}

- (BookcaseListCell *)customBookcaseCV:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BookcaseListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseBookcaseCellId forIndexPath:indexPath];
    
    [cell.bookImage setImage:[TextImage textImage:[@(indexPath.row) stringValue] size:cell.frame.size fontSize:40.f]];
        
    
    return cell;
}

- (MemberListCell *)customMemberCV:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MemberListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseMemberCellId forIndexPath:indexPath];
    
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (![self isCurrentPortraitOrientation])
    {
        if (bookcaseLV == 1)
        {
            if (collectionView == self.bookcaseCollectionView) {
                return CGSizeMake(90, 75);
            }
            return CGSizeMake(50, 50);
        }
        
        else
        {
            if (collectionView == self.bookcaseCollectionView) {
                return CGSizeMake(190, 150);
            }
            return CGSizeMake(50, 50);
        }
        
    }
    else
    {
        if (bookcaseLV == 1)
        {
            if (collectionView == self.bookcaseCollectionView) {
                return CGSizeMake(75, 90);
            }
            return CGSizeMake(50, 50);
        }
        
        else
        {
            if (collectionView == self.bookcaseCollectionView) {
                return CGSizeMake(150, 190);
            }
            return CGSizeMake(50, 50);
        }
    }
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

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    BookcaseListCell *cell = (BookcaseListCell*)[self collectionView:collectionView cellForItemAtIndexPath:indexPath];
    
    CGRect frameRelativeToViewControllerView;
    
    CGRect collectionViewRect = collectionView.frame;
    
    if ([self isCurrentPortraitOrientation]) {
        // portrait
        CGFloat cellx = cell.frame.origin.x - [collectionView contentOffset].x;
        
        frameRelativeToViewControllerView = cell.frame;
        frameRelativeToViewControllerView.origin.x = cellx + collectionViewRect.origin.x;
        frameRelativeToViewControllerView.origin.y += collectionViewRect.origin.y;

    } else {
        // landscape
        CGFloat celly = cell.frame.origin.y - [collectionView contentOffset].y;
        
        frameRelativeToViewControllerView = cell.frame;
        frameRelativeToViewControllerView.origin.y = celly + collectionViewRect.origin.y;
        frameRelativeToViewControllerView.origin.x += collectionViewRect.origin.x;

        
    }
    
    if (collectionView == self.bookcaseCollectionView)
    {
        
        [UIView animateWithDuration:.2f animations:^{
            self.detailView.alpha = 0;
        } completion:^(BOOL finished) {
            //        UIView * wow = [cell snapshotViewAfterScreenUpdates:YES];
            UIView *wow = [[UIView alloc] init];
            [wow setFrame:frameRelativeToViewControllerView];
            [wow setBackgroundColor:[UIColor greenColor]];
            [wow setAlpha:0.5];
            [self.view addSubview:wow];
            
            [UIView animateWithDuration:.25f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [wow setFrame:[self.detailMainImage convertRect:self.detailMainImage.bounds toView:self.view]];
            } completion:^(BOOL finished) {
                [wow removeFromSuperview];
                [self.detailMainImage setImage:cell.bookImage.image];
                
                [UIView animateWithDuration:0.15f animations:^{
                    self.detailView.alpha =1;
                } completion:^(BOOL finished) {
                    
                }];
                
            }];

        }];

        
    }
    
}

#pragma mark -
#pragma mark orientation


- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [  self updateLayoutForNewOrientation: toInterfaceOrientation];
}


- (void) updateLayoutForNewOrientation: (UIInterfaceOrientation) orientation {
    
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        // Do some stuff
        bookcaseflowLayout = [[UICollectionViewFlowLayout alloc]init];
        bookcaseflowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        memberListflowLayout = [[UICollectionViewFlowLayout alloc]init];
        memberListflowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
    } else {
        // Do some other stuff
        bookcaseflowLayout = [[UICollectionViewFlowLayout alloc]init];
        bookcaseflowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        memberListflowLayout = [[UICollectionViewFlowLayout alloc]init];
        memberListflowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    
    
    [self.bookcaseCollectionView performBatchUpdates:^{
        [self.bookcaseCollectionView setCollectionViewLayout:bookcaseflowLayout animated:NO];
        
    } completion:^(BOOL finished) {
        
    }];
    
    
     [self.memberCollectionView performBatchUpdates:^{
         [self.memberCollectionView setCollectionViewLayout:memberListflowLayout animated:NO];
         
    } completion:^(BOOL finished) {
        
       

    }];
}

#pragma mark - 
#pragma mark change bookCaseView Size

- (IBAction)changeBookCaseSize:(id)sender {
    
    //init
    UIButton *btn = (UIButton*)sender;
    CGFloat constant = 0;
    CGRect btnFrame = btn.frame;
    
    //sizeによる設定値
    if (bookcaseLV == 1)
    {
        [self.grayView setHidden:NO];

        constant = 100;
        bookcaseLV = 2;
    }
    else
    {
        [self.grayView setHidden:YES];
       
        constant = -100;
        bookcaseLV = 1;
    }
    
    //constantの値を入れるとanimationが動かなくなるため
    //下記のlayouIfNeededを先処理
    [self.view layoutIfNeeded];
    
    if (![self isCurrentPortraitOrientation])
    {
        bookcaseCVConstraint.constant += constant;
        lbookcaseCVConstraint.constant += constant;
        btnFrame.origin.x -= constant;
    }else{
        bookcaseCVConstraint.constant += constant;
        lbookcaseCVConstraint.constant += constant;
        btnFrame.origin.y -= constant;
    }
    
    //セルのサイズが変わるので、真ん中にあるセルをサイズが変わっても真ん中にくるよう設定
    NSArray *indexPaths = self.bookcaseCollectionView.indexPathsForVisibleItems;
    NSArray *sortedArray = [indexPaths sortedArrayUsingComparator: ^(NSIndexPath *obj1, NSIndexPath *obj2) {
        
        if (obj1.row == 0 && obj2.row == 0)
        {
            return (NSComparisonResult)NSOrderedSame;
        }
        if (obj1.row == 0)
        {
            return (NSComparisonResult)NSOrderedDescending;
        }
        if (obj1.row == 0)
        {
            return (NSComparisonResult)NSOrderedAscending;
        }
        
        if (obj1.row > obj2.row)
        {
            return (NSComparisonResult)NSOrderedDescending;
        }

        if (obj1.row < obj2.row)
        {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    
    NSIndexPath *centerCellIndexPath = [sortedArray objectAtIndex:[indexPaths count] /2];
    NSLog(@"%@",[sortedArray description]);
    NSLog(@"%@",[centerCellIndexPath description]);
    
    [self.bookcaseCollectionView.collectionViewLayout invalidateLayout];
    [self.bookcaseCollectionView reloadData];
    
    [UIView animateWithDuration:.25f animations:^{
        btn.frame = btnFrame;
        
        //constantの値を入れるとanimationが動かなくなるため
        //constantの値を入れた後、layouIfNeededをまた呼び出す
        [self.view layoutIfNeeded]; // Called on parent view
        
        [self.bookcaseCollectionView scrollToItemAtIndexPath:centerCellIndexPath atScrollPosition:![self isCurrentPortraitOrientation] ?UICollectionViewScrollPositionCenteredVertically : UICollectionViewScrollPositionCenteredHorizontally animated:NO];
        
    } completion:^(BOOL finished) {
        
    }];

}
@end

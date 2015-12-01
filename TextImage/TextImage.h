//
//  TextImage.h
//  RakuRakuRenraku
//
//  Created by 朴 根佑 on 2015/06/10.
//  Copyright (c) 2015年 Glocal. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface TextImage : NSObject
+(UIImage*)textImage:(NSString*)text size:(CGSize)size;
+(UIImage*)textImage:(NSString*)text size:(CGSize)size fontSize:(CGFloat)fontSize textColor:(UIColor*)textColor bgColor:(UIColor*)bgColor;
+(UIImage*)textImage:(NSString*)text size:(CGSize)size fontSize:(CGFloat)fontSize textColor:(UIColor*)textColor;
+(UIImage*)textImage:(NSString*)text size:(CGSize)size fontSize:(CGFloat)fontSize;
@end

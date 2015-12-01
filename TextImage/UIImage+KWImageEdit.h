//
//  UIImage+KWImageEdit.h
//  RakuRakuRenraku
//
//  Created by 朴 根佑 on 2015/06/10.
//  Copyright (c) 2015年 Glocal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KWImageEdit)

//Convert text to Image
+ (UIImage *)imageForView:(UIView *)view;
+ (UIImage *)imageFromString:(NSString *)string attributes:(NSDictionary *)attributes size:(CGSize)size;
//+ (UIImage *)imageFromString:(NSString *)string font:(UIFont *)font size:(CGSize)size;

//Image size
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
- (UIImage *)imageScaledToFitSize:(CGSize)size;
@end

//
//  UIImage+KWPImage.h
//  BookcaseViewController
//
//  Created by 朴 根佑 on 2015/12/02.
//  Copyright © 2015年 KWP. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CIFilterNames)
{
    CIFilterNameOriginal = 0,
    CIFilterNameLinearToSRGBToneCurve,
    CIFilterNamePhotoEffectChrome,
    CIFilterNamePhotoEffectFade,
    CIFilterNamePhotoEffectInstant,
    CIFilterNamePhotoEffectMono,
    CIFilterNamePhotoEffectNoir,
    CIFilterNamePhotoEffectProcess,
    CIFilterNamePhotoEffectTonal,
    CIFilterNamePhotoEffectTransfer,
    CIFilterNameSRGBToneCurveToLinear,
    CIFilterNameVignetteEffect
};


@interface UIImage (KWPImage)

//Convert text to Image
+ (UIImage *)imageForView:(UIView *)view;
+ (UIImage *)imageFromString:(NSString *)string attributes:(NSDictionary *)attributes size:(CGSize)size;
//+ (UIImage *)imageFromString:(NSString *)string font:(UIFont *)font size:(CGSize)size;

//Image size
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
- (UIImage *)imageScaledToFitSize:(CGSize)size;

//filter Image
+ (UIImage *)brightImage:(UIImage *)image;
+ (UIImage*)setFilter:(UIImage*)image filter:(CIFilterNames)filter;
@end

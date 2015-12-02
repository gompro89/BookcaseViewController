//
//  UIImage+KWPImage.m
//  BookcaseViewController
//
//  Created by 朴 根佑 on 2015/12/02.
//  Copyright © 2015年 KWP. All rights reserved.
//

#import "UIImage+KWPImage.h"

@implementation UIImage (KWPImage)

#pragma mark -
#pragma mark Convert Text To Image
//UILabel, UITextField, UITextViewなどをイメージに変換
+ (UIImage *)imageForView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
    
    if ([view respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
        [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];  // if we have efficient iOS 7 method, use it ...
    else
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];         // ... otherwise, fall back to tried and true methods
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

//テキストをイメージに変換する
// ios 7以上のバージョン
+ (UIImage *)imageFromString:(NSString *)string attributes:(NSDictionary *)attributes size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [string drawInRect:CGRectMake(0, 0, size.width, size.height) withAttributes:attributes];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
// ios 7以下のバージョン
//+ (UIImage *)imageFromString:(NSString *)string font:(UIFont *)font size:(CGSize)size
//{
//    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
//    [string drawInRect:CGRectMake(0, 0, size.width, size.height) withFont:font lineBreakMode: NSLineBreakByWordWrapping];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
//    return image;
//}


#pragma mark -
#pragma mark ImageSize

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    //    [image drawAtPoint:CGPointMake(1, 1)];
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (UIImage *)imageScaledToSize:(CGSize)size
{
    //create drawing context
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    
    //draw
    [self drawInRect:CGRectMake(0.0f, 0.0f, size.width, size.height)];
    
    //capture resultant image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //return image
    return image;
}

- (UIImage *)imageScaledToFitSize:(CGSize)size
{
    //calculate rect
    CGFloat aspect = self.size.width / self.size.height;
    if (size.width / aspect <= size.height)
    {
        return [self imageScaledToSize:CGSizeMake(size.width, size.width / aspect)];
    }
    else
    {
        return [self imageScaledToSize:CGSizeMake(size.height * aspect, size.height)];
    }
}


#pragma mark -
#pragma mark Image Filter

+ (UIImage *)brightImage:(UIImage *)image{
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [[CIImage alloc] initWithImage:image]; //your input image
    
    CIFilter *filter= [CIFilter filterWithName:@"CIColorControls"];
    [filter setValue:inputImage forKey:@"inputImage"];
    [filter setValue:[NSNumber numberWithFloat:0.5] forKey:@"inputBrightness"];
    
    // Your output image
    UIImage *outputImage = [UIImage imageWithCGImage:[context createCGImage:filter.outputImage fromRect:filter.outputImage.extent]];
    
    return outputImage;
}

+ (UIImage*)setFilter:(UIImage*)image filter:(CIFilterNames)filter
{
    NSArray* filters = @[
                @"Original",
                @"CILinearToSRGBToneCurve",
                @"CIPhotoEffectChrome",
                @"CIPhotoEffectFade",
                @"CIPhotoEffectInstant",
                @"CIPhotoEffectMono",
                @"CIPhotoEffectNoir",
                @"CIPhotoEffectProcess",
                @"CIPhotoEffectTonal",
                @"CIPhotoEffectTransfer",
                @"CISRGBToneCurveToLinear",
                @"CIVignetteEffect",
                ];
    
    /* ファイルを読み込む */
    CIImage *ciImage = [[CIImage alloc] initWithImage:image];
    
    /* フィルタを読み込む */
    CIFilter *ciFilter = [CIFilter filterWithName:[filters objectAtIndex:filter]
                                    keysAndValues:kCIInputImageKey, ciImage, nil];
    
    /* ※注意※このフィルタは、パラメータの設定ができません */
    
    /* フィルタした内容を画面に表示する */
    CIContext *ciContext = [CIContext contextWithOptions:nil];
    CGImageRef cgimg = [ciContext createCGImage:[ciFilter outputImage] fromRect:[[ciFilter outputImage] extent]];
    
    UIImage *filterImage  = [UIImage imageWithCGImage:cgimg scale:1.0f orientation:UIImageOrientationUp];
    CGImageRelease(cgimg);
    
    return filterImage;
}

@end

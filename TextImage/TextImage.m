//
//  TextImage.m
//  RakuRakuRenraku
//
//  Created by 朴 根佑 on 2015/06/10.
//  Copyright (c) 2015年 Glocal. All rights reserved.
//

#import "TextImage.h"


@implementation TextImage


+(UIImage*)textImage:(NSString*)text size:(CGSize)size{
    NSDictionary *attributes = @{NSFontAttributeName            : [UIFont systemFontOfSize:280],
                                 NSForegroundColorAttributeName : [UIColor darkTextColor],
                                 NSBackgroundColorAttributeName : [UIColor clearColor]};
    
    UIImage *image = [UIImage imageFromString:text attributes:attributes size:CGSizeEqualToSize(size, CGSizeZero) == false ? size : CGSizeMake(250, 250)];
    
    return image;
}

+(UIImage*)textImage:(NSString*)text size:(CGSize)size fontSize:(CGFloat)fontSize{
    NSDictionary *attributes = @{NSFontAttributeName            : [UIFont systemFontOfSize:fontSize],
                                 NSForegroundColorAttributeName : [UIColor darkTextColor],
                                 NSBackgroundColorAttributeName : [UIColor clearColor]};
    
    UIImage *image = [UIImage imageFromString:text attributes:attributes size:CGSizeEqualToSize(size, CGSizeZero) == false ? size : CGSizeMake(250, 250)];
    
    return image;
}

+(UIImage*)textImage:(NSString*)text size:(CGSize)size fontSize:(CGFloat)fontSize textColor:(UIColor*)textColor{
    NSDictionary *attributes = @{NSFontAttributeName            : [UIFont systemFontOfSize:fontSize],
                                 NSForegroundColorAttributeName : textColor,
                                 NSBackgroundColorAttributeName : [UIColor clearColor]};
    
    UIImage *image = [UIImage imageFromString:text attributes:attributes size:CGSizeEqualToSize(size, CGSizeZero) == false ? size : CGSizeMake(250, 250)];
    
    return image;
}

+(UIImage*)textImage:(NSString*)text size:(CGSize)size fontSize:(CGFloat)fontSize textColor:(UIColor*)textColor bgColor:(UIColor*)bgColor{
    NSDictionary *attributes = @{NSFontAttributeName            : [UIFont systemFontOfSize:fontSize],
                                 NSForegroundColorAttributeName : textColor,
                                 NSBackgroundColorAttributeName : bgColor};
    
    UIImage *image = [UIImage imageFromString:text attributes:attributes size:CGSizeEqualToSize(size, CGSizeZero) == false ? size : CGSizeMake(250, 250)];
    
    return image;
}


@end

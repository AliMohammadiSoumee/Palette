//
//  UIImage+AMSExtension.m
//  Palette
//
//  Created by Ali Soume`e on 5/30/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import "UIImage+AMSExtension.h"

@implementation UIImage (AMSExtension)




+ (NSDictionary *)compressImageForPost:(UIImage *)image {
    float actualHeight = image.size.height;
    float actualWidth = image.size.width;
    float maxHeight = 1080;
    float maxWidth = 1080;
    float imgRatio = actualWidth/actualHeight;
    float maxRatio = maxWidth/maxHeight;
    float compressionQuality = 0.55;
    
    if (actualHeight > maxHeight || actualWidth > maxWidth){
        if(imgRatio < maxRatio){
            //adjust width according to maxHeight
            imgRatio = maxHeight / actualHeight;
            actualWidth = imgRatio * actualWidth;
            actualHeight = maxHeight;
        }
        else if(imgRatio > maxRatio){
            //adjust height according to maxWidth
            imgRatio = maxWidth / actualWidth;
            actualHeight = imgRatio * actualHeight;
            actualWidth = maxWidth;
        }
        else{
            actualHeight = maxHeight;
            actualWidth = maxWidth;
        }
    }
    
    CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
    UIGraphicsBeginImageContext(rect.size);
    [image drawInRect:rect];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    NSData *imageData = UIImageJPEGRepresentation(img, compressionQuality);
    UIGraphicsEndImageContext();
    
    return @{@"data": imageData, @"image": [UIImage imageWithData:imageData]};
}


@end

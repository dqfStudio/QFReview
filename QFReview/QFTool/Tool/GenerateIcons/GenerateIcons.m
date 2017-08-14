//
//  GenerateIcons.m
//  ReleaseReview
//
//  Created by dqf on 2017/7/16.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "GenerateIcons.h"
#import "IO.h"

@implementation GenerateIcons

+ (void)generateIcon
{
    if (![ConfigModel share].iconPath) return;
    
    UIImage *image = [UIImage imageWithContentsOfFile:[ConfigModel share].iconPath];
    
    //icon-72.png
    [self saveImage:image size:CGSizeMake(72, 72) fileName:@"icon-72.png"];
    
    //icon-72@2x.png
    [self saveImage:image size:CGSizeMake(144, 144) fileName:@"icon-72@2x.png"];
    
    //icon-76.png
    [self saveImage:image size:CGSizeMake(76, 76) fileName:@"icon-76.png"];
    
    //icon-76@2x.png
    [self saveImage:image size:CGSizeMake(152, 152) fileName:@"icon-76@2x.png"];
    
    //icon-20.png
    [self saveImage:image size:CGSizeMake(20, 20) fileName:@"icon-20.png"];
    
    //icon-20@2x.png
    [self saveImage:image size:CGSizeMake(40, 40) fileName:@"icon-20@2x.png"];
    
    //icon-29.png
    [self saveImage:image size:CGSizeMake(29, 29) fileName:@"icon-29.png"];
    
    //icon-29@2x.png
    [self saveImage:image size:CGSizeMake(58, 58) fileName:@"icon-29@2x.png"];
    
    //icon-40.png
    [self saveImage:image size:CGSizeMake(40, 40) fileName:@"icon-40.png"];
    
    //icon-40@2x.png
    [self saveImage:image size:CGSizeMake(80, 80) fileName:@"icon-40@2x.png"];
    
    //icon-50.png
    [self saveImage:image size:CGSizeMake(50, 50) fileName:@"icon-50.png"];
    
    //icon-50@2x.png
    [self saveImage:image size:CGSizeMake(100, 100) fileName:@"icon-50@2x.png"];
    
    //icon-83.5@2x.png
    [self saveImage:image size:CGSizeMake(167, 167) fileName:@"icon-83.5@2x.png"];
    
    //icon20@2x.png
    [self saveImage:image size:CGSizeMake(40, 40) fileName:@"icon20@2x.png"];
    
    //icon20@3x.png
    [self saveImage:image size:CGSizeMake(60, 60) fileName:@"icon20@3x.png"];
    
    //icon29.png
    [self saveImage:image size:CGSizeMake(29, 29) fileName:@"icon29.png"];
    
    //icon29@2x.png
    [self saveImage:image size:CGSizeMake(58, 58) fileName:@"icon29@2x.png"];
    
    //icon29@3x.png
    [self saveImage:image size:CGSizeMake(87, 87) fileName:@"icon29@3x.png"];
    
    //icon40@2x.png
    [self saveImage:image size:CGSizeMake(80, 80) fileName:@"icon40@2x.png"];
    
    //icon40@3x.png
    [self saveImage:image size:CGSizeMake(120, 120) fileName:@"icon40@3x.png"];
    
    //icon57.png
    [self saveImage:image size:CGSizeMake(57, 57) fileName:@"icon57.png"];
    
    //icon57@2x.png
    [self saveImage:image size:CGSizeMake(114, 114) fileName:@"icon57@2x.png"];
    
    //icon60@2x.png
    [self saveImage:image size:CGSizeMake(120, 120) fileName:@"icon60@2x.png"];
    
    //icon60@3x.png
    [self saveImage:image size:CGSizeMake(180, 180) fileName:@"icon60@3x.png"];
    
    //生成Contents.json文件
    NSData *data = [[NSFileManager defaultManager] contentsAtPath:[[NSBundle mainBundle] pathForResource:@"icons-Contents" ofType:@"json"]];
    [data writeToFile:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"Contents.json"] atomically:YES];
    
}

+ (void)saveImage:(UIImage *)image size:(CGSize)size fileName:(NSString *)name {
    UIImage *img = [self handleImage:image withSize:size];
    [self saveImage:img path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:name]];
}

+ (BOOL)saveImage:(UIImage *)image path:(NSString *)path
{
    NSData *imageData = UIImagePNGRepresentation(image);
    return [imageData writeToFile:path atomically:YES];
}

+ (UIImage *)handleImage:(UIImage *)originalImage withSize:(CGSize)size
{
    CGSize originalsize = [originalImage size];
    
    //原图长宽均小于标准长宽的，不作处理返回原图
    if (originalsize.width<size.width && originalsize.height<size.height)
    {
        return originalImage;
    }
    
    //原图长宽均大于标准长宽的，按比例缩小至最大适应值
    else if(originalsize.width>size.width && originalsize.height>size.height)
    {
        CGFloat rate = 1.0;
        CGFloat widthRate = originalsize.width/size.width;
        CGFloat heightRate = originalsize.height/size.height;
        
        rate = widthRate>heightRate?heightRate:widthRate;
        
        CGImageRef imageRef = nil;
        
        if (heightRate>widthRate)
        {
            imageRef = CGImageCreateWithImageInRect([originalImage CGImage], CGRectMake(0, originalsize.height/2-size.height*rate/2, originalsize.width, size.height*rate));//获取图片整体部分
        }
        else
        {
            imageRef = CGImageCreateWithImageInRect([originalImage CGImage], CGRectMake(originalsize.width/2-size.width*rate/2, 0, size.width*rate, originalsize.height));//获取图片整体部分
        }
        UIGraphicsBeginImageContext(size);//指定要绘画图片的大小
        CGContextRef con = UIGraphicsGetCurrentContext();
        
        CGContextTranslateCTM(con, 0.0, size.height);
        CGContextScaleCTM(con, 1.0, -1.0);
        
        CGContextDrawImage(con, CGRectMake(0, 0, size.width, size.height), imageRef);
        
        UIImage *standardImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        CGImageRelease(imageRef);
        
        return standardImage;
    }
    
    //原图长宽有一项大于标准长宽的，对大于标准的那一项进行裁剪，另一项保持不变
    else if(originalsize.height>size.height || originalsize.width>size.width)
    {
        CGImageRef imageRef = nil;
        
        if(originalsize.height>size.height)
        {
            imageRef = CGImageCreateWithImageInRect([originalImage CGImage], CGRectMake(0, originalsize.height/2-size.height/2, originalsize.width, size.height));//获取图片整体部分
        }
        else if (originalsize.width>size.width)
        {
            imageRef = CGImageCreateWithImageInRect([originalImage CGImage], CGRectMake(originalsize.width/2-size.width/2, 0, size.width, originalsize.height));//获取图片整体部分
        }
        
        UIGraphicsBeginImageContext(size);//指定要绘画图片的大小
        CGContextRef con = UIGraphicsGetCurrentContext();
        
        CGContextTranslateCTM(con, 0.0, size.height);
        CGContextScaleCTM(con, 1.0, -1.0);
        
        CGContextDrawImage(con, CGRectMake(0, 0, size.width, size.height), imageRef);
        
        UIImage *standardImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        CGImageRelease(imageRef);
        
        return standardImage;
    }
    
    //原图为标准长宽的，不做处理
    else
    {
        return originalImage;
    }
}

@end

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
    UIImage *image1 = [self handleImage:image withSize:CGSizeMake(72, 72)];
    [self saveImage:image1 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon-72.png"]];
    
    //icon-72@2x.png
    UIImage *image2 = [self handleImage:image withSize:CGSizeMake(144, 144)];
    [self saveImage:image2 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon-72@2x.png"]];
    
    //icon-76.png
    UIImage *image3 = [self handleImage:image withSize:CGSizeMake(76, 76)];
    [self saveImage:image3 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon-76.png"]];
    
    //icon-76@2x.png
    UIImage *image4 = [self handleImage:image withSize:CGSizeMake(152, 152)];
    [self saveImage:image4 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon-76@2x.png"]];
    
    
    //icon-20.png
    UIImage *image5 = [self handleImage:image withSize:CGSizeMake(20, 20)];
    [self saveImage:image5 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon-20.png"]];
    
    //icon-20@2x.png
    UIImage *image6 = [self handleImage:image withSize:CGSizeMake(40, 40)];
    [self saveImage:image6 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon-20@2x.png"]];
    
    //icon-29.png
    UIImage *image7 = [self handleImage:image withSize:CGSizeMake(29, 29)];
    [self saveImage:image7 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon-29.png"]];
    
    //icon-29@2x.png
    UIImage *image8 = [self handleImage:image withSize:CGSizeMake(58, 58)];
    [self saveImage:image8 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon-29@2x.png"]];
    
    //icon-40.png
    UIImage *image9 = [self handleImage:image withSize:CGSizeMake(40, 40)];
    [self saveImage:image9 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon-40.png"]];
    
    //icon-40@2x.png
    UIImage *image10 = [self handleImage:image withSize:CGSizeMake(80, 80)];
    [self saveImage:image10 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon-40@2x.png"]];
    
    //icon-50.png
    UIImage *image11 = [self handleImage:image withSize:CGSizeMake(50, 50)];
    [self saveImage:image11 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon-50.png"]];
    
    //icon-50@2x.png
    UIImage *image12 = [self handleImage:image withSize:CGSizeMake(100, 100)];
    [self saveImage:image12 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon-50@2x.png"]];
    
    //icon-83.5@2x.png
    UIImage *image13 = [self handleImage:image withSize:CGSizeMake(167, 167)];
    [self saveImage:image13 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon-83.5@2x.png"]];
    
    
    
    
    
    
    
    //icon20@2x.png
    UIImage *image14 = [self handleImage:image withSize:CGSizeMake(40, 40)];
    [self saveImage:image14 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon20@2x.png"]];
    
    //icon20@3x.png
    UIImage *image15 = [self handleImage:image withSize:CGSizeMake(60, 60)];
    [self saveImage:image15 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon20@3x.png"]];
    
    //icon29.png
    UIImage *image16 = [self handleImage:image withSize:CGSizeMake(29, 29)];
    [self saveImage:image16 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon29.png"]];
    
    //icon29@2x.png
    UIImage *image17 = [self handleImage:image withSize:CGSizeMake(58, 58)];
    [self saveImage:image17 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon29@2x.png"]];
    
    //icon29@3x.png
    UIImage *image18 = [self handleImage:image withSize:CGSizeMake(87, 87)];
    [self saveImage:image18 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon29@3x.png"]];
    
    //icon40@2x.png
    UIImage *image19 = [self handleImage:image withSize:CGSizeMake(80, 80)];
    [self saveImage:image19 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon40@2x.png"]];
    
    //icon40@3x.png
    UIImage *image20 = [self handleImage:image withSize:CGSizeMake(120, 120)];
    [self saveImage:image20 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon40@3x.png"]];
    
    //icon57.png
    UIImage *image21 = [self handleImage:image withSize:CGSizeMake(57, 57)];
    [self saveImage:image21 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon57.png"]];
    
    //icon57@2x.png
    UIImage *image22 = [self handleImage:image withSize:CGSizeMake(114, 114)];
    [self saveImage:image22 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon57@2x.png"]];
    
    //icon60@2x.png
    UIImage *image23 = [self handleImage:image withSize:CGSizeMake(120, 120)];
    [self saveImage:image23 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon60@2x.png"]];
    
    //icon60@3x.png
    UIImage *image24 = [self handleImage:image withSize:CGSizeMake(180, 180)];
    [self saveImage:image24 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"icon60@3x.png"]];
    
    //生成Contents.json文件
    NSData *data = [[NSFileManager defaultManager] contentsAtPath:[[NSBundle mainBundle] pathForResource:@"icons-Contents" ofType:@"json"]];
    [data writeToFile:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/icons/"] org2:@"Contents.json"] atomically:YES];
    
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

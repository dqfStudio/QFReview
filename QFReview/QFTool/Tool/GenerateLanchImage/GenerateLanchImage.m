//
//  GenerateLanchImage.m
//  ReleaseReview
//
//  Created by dqf on 2017/7/16.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "GenerateLanchImage.h"
#import "IO.h"

@implementation GenerateLanchImage

+ (void)generateLanchImage
{
    
    if (![ConfigModel share].launchImagePath) return;
    
    UIImage *image = [UIImage imageWithContentsOfFile:[ConfigModel share].launchImagePath];
    
    //LaunchImage.png
    UIImage *image1 = [self handleImage:image withSize:CGSizeMake(320, 480)];
    [self saveImage:image1 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/LaunchImages/"] org2:@"LaunchImage.png"]];
    
    //LaunchImage@2x.png
    UIImage *image2 = [self handleImage:image withSize:CGSizeMake(640, 960)];
    [self saveImage:image2 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/LaunchImages/"] org2:@"LaunchImage@2x.png"]];
    
    //LaunchImage-568h@2x.png
    UIImage *image3 = [self handleImage:image withSize:CGSizeMake(640, 1136)];
    [self saveImage:image3 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/LaunchImages/"] org2:@"LaunchImage-568h@2x.png"]];
    
    //LaunchImage-667h@2x.png
    UIImage *image4 = [self handleImage:image withSize:CGSizeMake(750, 1334)];
    [self saveImage:image4 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/LaunchImages/"] org2:@"LaunchImage-667h@2x.png"]];
    
    //LaunchImage-736h@3x.png
    UIImage *image5 = [self handleImage:image withSize:CGSizeMake(1242, 2208)];
    [self saveImage:image5 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/LaunchImages/"] org2:@"LaunchImage-736h@3x.png"]];
    
    //LaunchImage-landscape-736h@3x
//    UIImage *image6 = [self handleImage:image withSize:CGSizeMake(1242, 2208)];
//    //旋转90度
//    image6 = [self roateSourceImage:image6 ByDegrees:90];
//    [self saveImage:image6 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/LaunchImage/"] org2:@"LaunchImage-landscape-736h@3x.png"]];
    
    //生成Contents.json文件
    NSData *data = [[NSFileManager defaultManager] contentsAtPath:[[NSBundle mainBundle] pathForResource:@"lanchImage-Contents" ofType:@"json"]];
    [data writeToFile:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/LaunchImages/"] org2:@"Contents.json"] atomically:YES];
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

//
//  GenerateLanchImage.m
//  ReleaseReview
//
//  Created by dqf on 2017/7/16.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "GenerateLanchImage.h"
#import "QFImageTool.h"
#import "NSStringUtil.h"
#import "QFFileHelper.h"

@implementation GenerateLanchImage

+ (void)generateLanchImage {
    
    if (KLANCHIMAGEPATH.length == 0) return;

    NSArray *frameArr = @[@"{320, 480}",
                          @"{640, 960}",
                          @"{640, 1136}",
                          @"{750, 1334}",
                          @"{1242, 2208}"];
    
    NSArray *imgArr  = @[@"LaunchImage.png",
                         @"LaunchImage@2x.png",
                         @"LaunchImage-568h@2x.png",
                         @"LaunchImage-667h@2x.png",
                         @"LaunchImage-736h@3x.png"];
    
    for (int i=0; i<frameArr.count; i++) {
        NSString *frameStr = frameArr[i];
        NSString *imgStr = imgArr[i];
        [self saveWithSize:CGSizeFromString(frameStr) fileName:imgStr];
    }

    
    //LaunchImage-landscape-736h@3x
//    UIImage *image6 = [self handleImage:image withSize:CGSizeMake(1242, 2208)];
//    //旋转90度
//    image6 = [self roateSourceImage:image6 ByDegrees:90];
//    [self saveImage:image6 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/LaunchImage/"] org2:@"LaunchImage-landscape-736h@3x.png"]];
    
    //生成Contents.json文件
    NSData *data = [[NSFileManager defaultManager] contentsAtPath:[[NSBundle mainBundle] pathForResource:@"lanchImage-Contents" ofType:@"json"]];
    [data writeToFile:[QFFileHelper timePath].append(@"LaunchImages/Contents.json") atomically:YES];
}

+ (void)saveWithSize:(CGSize)size fileName:(NSString *)name {
    UIImage *image = [UIImage imageWithContentsOfFile:KLANCHIMAGEPATH];
    UIImage *img = [QFImageTool cutImage:image withSize:size];
    [self saveImage:img path:[QFFileHelper timePath].append(@"LaunchImages/").append(name)];
}

+ (BOOL)saveImage:(UIImage *)image path:(NSString *)path {
    NSData *imageData = UIImagePNGRepresentation(image);
    return [imageData writeToFile:path atomically:YES];
}

@end

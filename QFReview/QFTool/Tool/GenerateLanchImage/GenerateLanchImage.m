//
//  GenerateLanchImage.m
//  ReleaseReview
//
//  Created by dqf on 2017/7/16.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "GenerateLanchImage.h"
#import "UIImage+QFCut.h"
#import "NSStringUtil.h"
#import "QFFileHelper.h"

@implementation GenerateLanchImage

+ (void)filePath:(NSString *)path {
    
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
        [self saveWithSize:CGSizeFromString(frameStr) fileName:imgStr path:path];
    }

    
    //LaunchImage-landscape-736h@3x
//    UIImage *image6 = [self handleImage:image withSize:CGSizeMake(1242, 2208)];
//    //旋转90度
//    image6 = [self roateSourceImage:image6 ByDegrees:90];
//    [self saveImage:image6 path:[IO assembleOrg:[IO assembleOrg:[IO homePath] org2:@"/LaunchImage/"] org2:@"LaunchImage-landscape-736h@3x.png"]];
    
    //生成Contents.json文件
    NSData *data = [[NSFileManager defaultManager] contentsAtPath:[[NSBundle mainBundle] pathForResource:@"lanchImage-Contents" ofType:@"json"]];
    NSString *filePath = [QFFileHelper timePath].append(@"LaunchImages/Contents.json");
    [data writeToFile:filePath atomically:YES];
}

+ (void)saveWithSize:(CGSize)size fileName:(NSString *)name path:(NSString *)path {
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    UIImage *img = [image toSize:size];
    NSString *filePath = [QFFileHelper timePath].append(@"LaunchImages/").append(name);
    NSData *imageData = UIImagePNGRepresentation(img);
    [imageData writeToFile:filePath atomically:YES];
}

@end

//
//  GenerateIcons.m
//  ReleaseReview
//
//  Created by dqf on 2017/7/16.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "GenerateIcons.h"
#import "UIImage+QFCut.h"
#import "NSStringUtil.h"
#import "QFFileHelper.h"

@implementation GenerateIcons

+ (void)filePath:(NSString *)path {
    
    NSArray *frameArr = @[@"{72, 72}",
                          @"{144, 144}",
                          @"{76, 76}",
                          @"{152, 152}",
                          @"{20, 20}",
                          @"{40, 40}",
                          @"{29, 29}",
                          @"{58, 58}",
                          @"{40, 40}",
                          @"{80, 80}",
                          @"{50, 50}",
                          @"{100, 100}",
                          @"{167, 167}",
                          @"{40, 40}",
                          @"{60, 60}",
                          @"{29, 29}",
                          @"{58, 58}",
                          @"{87, 87}",
                          @"{80, 80}",
                          @"{120, 120}",
                          @"{57, 57}",
                          @"{114, 114}",
                          @"{120, 120}",
                          @"{180, 180}"];
    
    NSArray *imgArr  = @[@"icon-72.png",
                         @"icon-72@2x.png",
                         @"icon-76.png",
                         @"icon-76@2x.png",
                         @"icon-20.png",
                         @"icon-20@2x.png",
                         @"icon-29.png",
                         @"icon-29@2x.png",
                         @"icon-40.png",
                         @"icon-40@2x.png",
                         @"icon-50.png",
                         @"icon-50@2x.png",
                         @"icon-83.5@2x.png",
                         @"icon20@2x.png",
                         @"icon20@3x.png",
                         @"icon29.png",
                         @"icon29@2x.png",
                         @"icon29@3x.png",
                         @"icon40@2x.png",
                         @"icon40@3x.png",
                         @"icon57.png",
                         @"icon57@2x.png",
                         @"icon60@2x.png",
                         @"icon60@3x.png"];
    
    for (int i=0; i<frameArr.count; i++) {
        NSString *frameStr = frameArr[i];
        NSString *imgStr = imgArr[i];
        [self saveWithSize:CGSizeFromString(frameStr) fileName:imgStr path:path];
    }
    
    //生成Contents.json文件
    NSData *data = [[NSFileManager defaultManager] contentsAtPath:[[NSBundle mainBundle] pathForResource:@"icons-Contents" ofType:@"json"]];
    NSString *filePath = [QFFileHelper timePath].append(@"icons/").append(@"Contents.json");
    [data writeToFile:filePath atomically:YES];
    
}

+ (void)saveWithSize:(CGSize)size fileName:(NSString *)name path:(NSString *)path {
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    UIImage *img = [image toSize:size];
    NSString *filePath = [QFFileHelper timePath].append(@"icons/").append(name);
    NSData *imageData = UIImagePNGRepresentation(img);
    [imageData writeToFile:filePath atomically:YES];
}

@end

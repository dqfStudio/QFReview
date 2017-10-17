//
//  GenerateScreenshot.m
//  ReleaseReview
//
//  Created by dqf on 2017/7/16.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "GenerateScreenshot.h"
#import "UIImage+QFCut.h"
#import "QFFileHelper.h"
#import "NSStringUtil.h"

@implementation GenerateScreenshot

+ (void)folderPath:(NSString *)path {
    NSString *str = [path substringToIndex:path.length-1];
    if (![str isEqualToString:@"/"]) {
        path = path.append(@"/");
    }
    NSArray *arr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    
    for (int i=0; i<arr.count; i++) {
        NSString *name = arr[i];
        UIImage *image1 = [UIImage imageWithContentsOfFile:path.append(name)];
        UIImage *image2 = [image1 toSize:CGSizeMake(1242, 2208)];
        NSString *filePath = [QFFileHelper timePath].append(@"screenshots/").append(@(i+1));
        NSData *imageData = UIImagePNGRepresentation(image2);
        [imageData writeToFile:filePath atomically:YES];
    }
}

@end


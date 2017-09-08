//
//  GenerateScreenshot.m
//  ReleaseReview
//
//  Created by dqf on 2017/7/16.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "GenerateScreenshot.h"
#import "QFImageTool.h"
#import "QFFileHelper.h"
#import "NSStringUtil.h"

@implementation GenerateScreenshot

+ (void)generateScreenshot {
    
    if (KSCREENSHOTPATH.length == 0) return;
    
    NSString *folderPath = KSCREENSHOTPATH.append(@"/");
    NSArray *arr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:folderPath error:nil];
    
    for (int i=0; i<arr.count; i++) {
        NSString *name = arr[i];
        UIImage *image1 = [UIImage imageWithContentsOfFile:folderPath.append(name)];
        UIImage *image2 = [QFImageTool cutImage:image1 withSize:CGSizeMake(1242, 2208)];
        [self saveImage:image2 path:[QFFileHelper timePath].append(@"screenshots/").append(@(i+1))];
    }
    
}

+ (BOOL)saveImage:(UIImage *)image path:(NSString *)path {
    NSData *imageData = UIImagePNGRepresentation(image);
    return [imageData writeToFile:path atomically:YES];
}

@end


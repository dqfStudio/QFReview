//
//  Review.m
//  Review
//
//  Created by dqf on 2017/7/17.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "Review.h"
#import "RenameProject.h"
#import "RenameFileHeader.h"
#import "QFReleaseReview.h"
#import "GenerateIcons.h"
#import "GenerateLanchImage.h"
#import "GenerateScreenshot.h"

@implementation Review

//开始执行review
+ (void)exe {
    [RenameProject renameProject];
    
    [RenameFileHeader renameCreate];
    [RenameFileHeader renameCopyright];
    
    [QFReleaseReview review];
    
    [GenerateIcons generateIcon];
    [GenerateLanchImage generateLanchImage];
    [GenerateScreenshot generateScreenshot];
}

@end

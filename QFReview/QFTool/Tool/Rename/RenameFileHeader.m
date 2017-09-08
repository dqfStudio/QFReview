//
//  RenameFileHeader.m
//  ReleaseReview
//
//  Created by dqf on 2017/7/15.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "RenameFileHeader.h"
#import "NSStringUtil.h"
#import "QFFileHelper.h"
#import "IO.h"

@interface RenameFileHeader ()

@property (nonatomic, copy) NSString *copyrighStr;
@property (nonatomic, copy) NSString *createStr;

@end

@implementation RenameFileHeader

+ (RenameFileHeader *)share {
    static RenameFileHeader *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


+ (void)renameCopyright {
    [RenameFileHeader share].copyrighStr = [ConfigModel share].copyright.append(@"\n");
    [self reCopyright:[IO pathForResource:nil ofType:nil]];
}


+ (void)renameCreate {
    [RenameFileHeader share].createStr = [ConfigModel share].create.append(@"\n");
    [self reCreate:[IO pathForResource:nil ofType:nil]];
}

+ (void)reCopyright:(NSString *)path {

    BOOL isDir = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
    
    if (isDir) {
        [QFFileHelper folderPath1:path filterArr:@[@".h", @".m"] block:^(NSString *path) {
            [self replaceCopyright:path];
        }];
    }else {
        [self replaceCopyright:path];
    }
    
}

+ (void)reCreate:(NSString *)path {
    
    BOOL isDir = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
    
    if (isDir) {
        [QFFileHelper folderPath1:path filterArr:@[@".h", @".m"] block:^(NSString *path) {
            [self replaceCopyright:path];
        }];
    }else {
        [self replaceCopyright:path];
    }

}

+ (void)replaceCopyright:(NSString *)path {
    
    __block NSInteger count = 0;
    __block NSString *filterLineStr = nil;
    
    [QFFileHelper file:path block:^(NSString *lineStr) {
        count++;
        if (count> 25) {
            return;
        }
        if ([lineStr containsString:@"//  Copyright"]) {
            filterLineStr = [lineStr mutableCopy];
            return;
        }
    }];
    
    if (filterLineStr && [RenameFileHeader share].copyrighStr) {
        NSString *fileStr = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        fileStr = [fileStr stringByReplacingOccurrencesOfString:filterLineStr withString:[RenameFileHeader share].copyrighStr];
        [fileStr writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
}

+ (void)replaceCreate:(NSString *)path {
    
    __block NSInteger count = 0;
    __block NSString *filterLineStr = nil;
    
    [QFFileHelper file:path block:^(NSString *lineStr) {
        count++;
        if (count> 25) {
            return;
        }
        if ([lineStr containsString:@"//  Created by"]) {
            filterLineStr = [lineStr mutableCopy];
            return;
        }
    }];
    
    if (filterLineStr && [RenameFileHeader share].createStr) {
        NSString *fileStr = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        fileStr = [fileStr stringByReplacingOccurrencesOfString:filterLineStr withString:[RenameFileHeader share].createStr];
        [fileStr writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
}

@end

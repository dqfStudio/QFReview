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


+ (void)renameHeader {
    
    [RenameFileHeader share].copyrighStr = [ConfigModel share].copyright.append(@"\n");
    [RenameFileHeader share].copyrighStr = [ConfigModel share].create.append(@"\n");
    
    NSString *path = [IO pathForResource:nil ofType:nil];
    BOOL isDir = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
    
    if (isDir) {
        [QFFileHelper folderPath1:path filterArr:@[@".h", @".m"] block:^(NSString *path) {
            [self replaceCC:path];
        }];
    }else {
        [self replaceCC:path];
    }

}

+ (void)replaceCC:(NSString *)path {
    
    __block NSInteger count = 0;
    __block NSString *copyrightStr = nil;
    __block NSString *createdStr = nil;
    
    [QFFileHelper file:path block:^(NSString *lineStr) {
        count++;
        if (count> 25) {
            return;
        }
        if ([lineStr containsString:@"//  Copyright"]) {
            copyrightStr = [lineStr mutableCopy];
        }
        if ([lineStr containsString:@"//  Created by"]) {
            createdStr = [lineStr mutableCopy];
        }
    }];
    
    NSString *fileStr = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    if (copyrightStr && [RenameFileHeader share].copyrighStr) {
        fileStr = [fileStr stringByReplacingOccurrencesOfString:copyrightStr withString:[RenameFileHeader share].copyrighStr];
    }
    if (createdStr && [RenameFileHeader share].createStr) {
        fileStr = [fileStr stringByReplacingOccurrencesOfString:createdStr withString:[RenameFileHeader share].createStr];
    }
    
    [fileStr writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

@end

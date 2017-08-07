//
//  RenameProject.m
//  ReleaseReview
//
//  Created by dqf on 2017/7/15.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "RenameProject.h"
#import "IO.h"

@implementation RenameProject

+ (RenameProject *)share
{
    static RenameProject *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

//重命名工程
+ (void)renameProject {
    [self renamePath:[IO pathForResource:nil ofType:nil]];
}

+ (void)renamePath:(NSString *)path {
    
    BOOL isDir = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
    
    if (isDir) {
        NSArray *arr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
        
        for (int i=0; i<arr.count; i++) {
            NSString *tmpPath = arr[i];
            [self renamePath:[IO assembleOrg:[IO assembleOrg:path org2:@"/"] org2:tmpPath]];
        }
        
    }else {
        
        NSString *contentStr = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        
        if (contentStr) {
            contentStr = [contentStr stringByReplacingOccurrencesOfString:[ConfigModel share].projectOldName withString:[ConfigModel share].projectNewName];
            [contentStr writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
        }
        
        
        NSString *peStr = [[path lastPathComponent] pathExtension];
        if (([peStr isEqualToString:@"h"] || [peStr isEqualToString:@"m"])) {
            return;
        }
        
    }
    
    //替换原来的文件或文件夹
    [self replaceFile:path];
    
}

+ (void)replaceFile:(NSString *)path {
    
    NSString *tmpFileName = [[path lastPathComponent] stringByDeletingPathExtension];
    
    NSString *newFilePath = [IO assembleOrg:[path stringByDeletingLastPathComponent] org2:@"/"];
    newFilePath = [IO assembleOrg:newFilePath org2:[ConfigModel share].projectNewName];
    if ([path pathExtension] && ![[path pathExtension] isEqualToString:@""]) {
        newFilePath = [IO assembleOrg:newFilePath org2:@"."];
        newFilePath = [IO assembleOrg:newFilePath org2:[path pathExtension]];
    }
    
    if ([tmpFileName isEqualToString:[ConfigModel share].projectOldName]) {
        
        [[NSFileManager defaultManager] moveItemAtPath:path toPath:newFilePath error:NULL];
        
    }
    
}

@end

//
//  RenameFileHeader.m
//  ReleaseReview
//
//  Created by dqf on 2017/7/15.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "RenameFileHeader.h"
#import "IO.h"

@interface RenameFileHeader ()

@property (nonatomic, copy) NSString *copyrighStr;
@property (nonatomic, copy) NSString *createStr;

@end

@implementation RenameFileHeader

+ (RenameFileHeader *)share
{
    static RenameFileHeader *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


+ (void)renameCopyright {
    [RenameFileHeader share].copyrighStr = [IO assembleOrg:[ConfigModel share].copyright org2:@"\n"];
    [self reCopyright:[IO pathForResource:nil ofType:nil]];
}


+ (void)renameCreate {
    [RenameFileHeader share].createStr = [IO assembleOrg:[ConfigModel share].create org2:@"\n"];
    [self reCreate:[IO pathForResource:nil ofType:nil]];
}

+ (void)reCopyright:(NSString *)path {
    
    BOOL isDir = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
    
    if (isDir) {
        NSArray *arr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
        
        for (int i=0; i<arr.count; i++) {
            NSString *tmpPath = arr[i];
            [self reCopyright:[IO assembleOrg:[IO assembleOrg:path org2:@"/"] org2:tmpPath]];
        }
        
    }else {
        
        NSString *peStr = [[path lastPathComponent] pathExtension];
        if (([peStr isEqualToString:@"h"] || [peStr isEqualToString:@"m"])) {
            
            [self checkCopyright:path];
        }

    }
    
}

+ (void)reCreate:(NSString *)path {
    
    BOOL isDir = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
    
    if (isDir) {
        NSArray *arr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
        
        for (int i=0; i<arr.count; i++) {
            NSString *tmpPath = arr[i];
            [self reCreate:[IO assembleOrg:[IO assembleOrg:path org2:@"/"] org2:tmpPath]];
        }
        
    }else {
        
        NSString *peStr = [[path lastPathComponent] pathExtension];
        if (([peStr isEqualToString:@"h"] || [peStr isEqualToString:@"m"])) {
            
            [self checkCreate:path];
        }
        
    }

}

+ (int)checkCopyright:(NSString *)path
{
    const char *filePath = [path UTF8String];
    //printf("＝＝＝＝%s", filepath);
    FILE *fp1;//定义文件流指针，用于打开读取的文件
    char textStr[10241];//定义一个字符串数组，用于存储读取的字符
    fp1 = fopen(filePath,"r");//只读方式打开文件a.txt
    NSString *lineStr = nil;
    int count = 0;
    while(fgets(textStr,10240,fp1)!=NULL)//逐行读取fp1所指向文件中的内容到text中
    {
        count++;
        if (count> 25) {
            break;
        }
        //获取一行代码
        NSString *codeStr = [NSString stringWithCString:textStr encoding:NSUTF8StringEncoding];
        if ([codeStr containsString:@"//  Copyright"]) {
            
            lineStr = codeStr;
            break;
        }
        
    }
    fclose(fp1);//关闭文件a.txt，有打开就要有关闭
    
    if (lineStr && [RenameFileHeader share].copyrighStr) {
        NSString *fileStr = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];

        fileStr = [fileStr stringByReplacingOccurrencesOfString:lineStr withString:[RenameFileHeader share].copyrighStr];
        [fileStr writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    
    return 0;
}

+ (int)checkCreate:(NSString *)path
{
    const char *filePath = [path UTF8String];
    //printf("＝＝＝＝%s", filepath);
    FILE *fp1;//定义文件流指针，用于打开读取的文件
    char textStr[10241];//定义一个字符串数组，用于存储读取的字符
    fp1 = fopen(filePath,"r");//只读方式打开文件a.txt
    NSString *lineStr = nil;
    int count = 0;
    while(fgets(textStr,10240,fp1)!=NULL)//逐行读取fp1所指向文件中的内容到text中
    {
        count++;
        if (count> 25) {
            break;
        }
        //获取一行代码
        NSString *codeStr = [NSString stringWithCString:textStr encoding:NSUTF8StringEncoding];
        if ([codeStr containsString:@"//  Created by"]) {
            
            lineStr = codeStr;
            break;
        }
        
    }
    fclose(fp1);//关闭文件a.txt，有打开就要有关闭
    
    if (lineStr && [RenameFileHeader share].copyrighStr) {
        NSString *fileStr = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        
        fileStr = [fileStr stringByReplacingOccurrencesOfString:lineStr withString:[RenameFileHeader share].createStr];
        [fileStr writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    
    return 0;
}

@end

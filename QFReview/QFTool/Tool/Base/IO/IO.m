//
//  IO.m
//  Test
//
//  Created by dqf on 2017/7/7.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "IO.h"

#define KMinValue     0
#define KMaxValue     100

@implementation IO

+ (IO *)share {
    static IO *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (NSString *)homePath {
    return [ConfigModel share].homePath;
}

//空格
+ (NSString *)space:(NSInteger)count {
    NSMutableString *mutableStr = [[NSMutableString alloc] initWithString:@""];
    if (count >=KMinValue && count <=KMaxValue) {
        NSString *str = @" ";
        for (int i=0; i<count; i++) {
            [mutableStr appendString:str];
        }
    }
    return mutableStr;
}

//tab
+ (NSString *)tab:(NSInteger)count {
    NSMutableString *mutableStr = [[NSMutableString alloc] initWithString:@""];
    if (count >=KMinValue && count <=KMaxValue) {
        NSString *str = @"\t";
        for (int i=0; i<count; i++) {
            [mutableStr appendString:str];
        }
    }
    return mutableStr;
}

//换行
+ (NSString *)wrap:(NSInteger)count {
    NSMutableString *mutableStr = [[NSMutableString alloc] initWithString:@""];
    if (count >=KMinValue && count <=KMaxValue) {
        NSString *str = @"\n";
        for (int i=0; i<count; i++) {
            [mutableStr appendString:str];
        }
    }
    return mutableStr;
}

//组装
+ (NSString *)assembleOrg:(NSString *)org1 org2:(NSString *)org2 {
    NSMutableString *mutableStr = [[NSMutableString alloc] initWithString:@""];
    if (org1 && org2) {
        [mutableStr appendString:org1];
        [mutableStr appendString:org2];
    }else if (org1) {
        [mutableStr appendString:org1];
    }else if (org2) {
        [mutableStr appendString:org2];
    }
    return mutableStr;
}

+ (NSString *)replace:(NSString *)source org1:(NSString *)org1 org2:(NSString *)org2 {
    NSMutableString *mutableStr = [[NSMutableString alloc] initWithString:@""];
    if (source && org1 && org2) {
        [mutableStr appendString:[source stringByReplacingOccurrencesOfString:org1 withString:org2]];
    }
    return mutableStr;
}

+ (NSString *)pathForResource:(NSString *)name ofType:(NSString *)ext {
    if (!name || [name isEqualToString:@""]) {
        return [NSString stringWithFormat:@"%@",[ConfigModel share].homePath];
    }else if (!ext || [ext isEqualToString:@""]) {
        return [NSString stringWithFormat:@"%@%@",[ConfigModel share].homePath,name];
    }
    return [NSString stringWithFormat:@"%@%@.%@",[ConfigModel share].homePath,name,ext];
}

@end

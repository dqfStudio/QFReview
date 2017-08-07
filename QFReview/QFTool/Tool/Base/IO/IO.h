//
//  IO.h
//  Test
//
//  Created by dqf on 2017/7/7.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLDictionary.h"
#import "ConfigModel.h"

@interface IO : NSObject

+ (NSString *)homePath;
//空格
+ (NSString *)space:(NSInteger)count;
//tab
+ (NSString *)tab:(NSInteger)count;
//换行
+ (NSString *)wrap:(NSInteger)count;
//组装
+ (NSString *)assembleOrg:(NSString *)org1 org2:(NSString *)org2;

+ (NSString *)replace:(NSString *)source org1:(NSString *)org1 org2:(NSString *)org2;

+ (NSString *)pathForResource:(NSString *)name ofType:(NSString *)ext;

@end

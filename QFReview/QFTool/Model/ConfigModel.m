//
//  ConfigModel.m
//  Review
//
//  Created by dqf on 2017/7/17.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "ConfigModel.h"

@implementation ConfigModel

+ (ConfigModel *)share
{
    static ConfigModel *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.homePath = nil;
        
        self.projectOldName = nil;
        self.projectNewName = nil;
        
        self.create = nil;
        self.copyright = nil;
        
        self.iconPath = nil;
        self.launchImagePath = nil;
        self.screenshotPath = nil;
    }
    return self;
}

@end

//
//  QFReleaseReview.m
//  ReleaseReview
//
//  Created by dqf on 2017/7/15.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import "QFReleaseReview.h"
#import "IO.h"

@interface QFReleaseReview ()

@property (nonatomic, copy) NSString *infoStr;

@end

@implementation QFReleaseReview

- (NSString *)infoStr {
    if (!_infoStr) {
        _infoStr = [[NSString alloc] init];
    }
    return _infoStr;
}

+ (QFReleaseReview *)share
{
    static QFReleaseReview *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


//输出相关信息
+ (void)review {
    
    //检查应用名称
    [self reViewAppName];
    
    //检查应用版本信息
    [self reViewAppVersion];
    
    //检查应用build信息
    [self reViewAppBuild];
    
    //检查应用buildId信息
    [self reViewAppBuildId];
    
    //检查服务器的地址
    [self reViewServiceAddress];
    
    //检查分享的地址
    [self reViewShareAddress];
    
    //检查是release还是debug状态
    [self reViewReleaseStatus];
    
    //打印相关信息
    NSLog(@"%@",[QFReleaseReview share].infoStr);
    
}

//检查应用名称
+ (void)reViewAppName {
    
    // app名称
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Name = [infoDict objectForKey:@"CFBundleDisplayName"];
    
    [QFReleaseReview share].infoStr = [IO assembleOrg:[QFReleaseReview share].infoStr org2:[IO wrap:2]];
    [QFReleaseReview share].infoStr = [IO assembleOrg:[QFReleaseReview share].infoStr org2:@"appName: "];
    [QFReleaseReview share].infoStr = [IO assembleOrg:[QFReleaseReview share].infoStr org2:app_Name];
    [QFReleaseReview share].infoStr = [IO assembleOrg:[QFReleaseReview share].infoStr org2:[IO wrap:2]];
    
}

//检查应用版本信息
+ (void)reViewAppVersion {
    
    // app版本
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDict objectForKey:@"CFBundleShortVersionString"];
    
    [QFReleaseReview share].infoStr = [IO assembleOrg:[QFReleaseReview share].infoStr org2:@"appVersion: "];
    [QFReleaseReview share].infoStr = [IO assembleOrg:[QFReleaseReview share].infoStr org2:app_Version];
    [QFReleaseReview share].infoStr = [IO assembleOrg:[QFReleaseReview share].infoStr org2:[IO wrap:2]];
    
}

//检查应用build信息
+ (void)reViewAppBuild {
    
    // app build版本
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *app_build = [infoDict objectForKey:@"CFBundleVersion"];
    
    [QFReleaseReview share].infoStr = [IO assembleOrg:[QFReleaseReview share].infoStr org2:@"appBuild: "];
    [QFReleaseReview share].infoStr = [IO assembleOrg:[QFReleaseReview share].infoStr org2:app_build];
    [QFReleaseReview share].infoStr = [IO assembleOrg:[QFReleaseReview share].infoStr org2:[IO wrap:2]];
    
}

//检查应用buildId信息
+ (void)reViewAppBuildId {
    
    // app build版本
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *app_buildId = [infoDict objectForKey:@"CFBundleIdentifier"];
    
    [QFReleaseReview share].infoStr = [IO assembleOrg:[QFReleaseReview share].infoStr org2:@"appBuildId: "];
    [QFReleaseReview share].infoStr = [IO assembleOrg:[QFReleaseReview share].infoStr org2:app_buildId];
    [QFReleaseReview share].infoStr = [IO assembleOrg:[QFReleaseReview share].infoStr org2:[IO wrap:2]];
    
}

//检查服务器的地址
+ (void)reViewServiceAddress {
//    [[NSBundle mainBundle] infoDictionary];
}

//检查分享的地址
+ (void)reViewShareAddress {
    
}

//检查是release还是debug状态
+ (void)reViewReleaseStatus {
    
}

@end

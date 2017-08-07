//
//  ConfigModel.h
//  Review
//
//  Created by dqf on 2017/7/17.
//  Copyright © 2017年 dqfStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConfigModel : NSObject

//工程根目录
@property (nonatomic, copy) NSString *homePath;

//修改工程名称时的新旧名称
@property (nonatomic, copy) NSString *projectOldName;
@property (nonatomic, copy) NSString *projectNewName;

//修改文件header中的copyright和create注释
@property (nonatomic, copy) NSString *copyright;
@property (nonatomic, copy) NSString *create;

//生成icon、launchImage和screenshot
@property (nonatomic, copy) NSString *iconPath;
@property (nonatomic, copy) NSString *launchImagePath;
@property (nonatomic, copy) NSString *screenshotPath;

+ (ConfigModel *)share;

@end

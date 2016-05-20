//
//  NSObject+AFNetworking.h
//  ProjectTeamBeauti
//
//  Created by Tarena on 16/2/3.
//  Copyright © 2016年 shijunchuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface NSObject (AFNetworking)
+(id)GET:(NSString *)path parameters:(id)parameters progress:(void(^)(NSProgress *))downloadProgress copletionHandle:(void(^)(id responseObj,NSError *error))completionHandle;
+(id)POST:(NSString *)path parameters:(id)parameters progress:(void(^)(NSProgress *))downloadProgress copletionHandle:(void(^)(id responseObj,NSError *error))completionHandle;

@end

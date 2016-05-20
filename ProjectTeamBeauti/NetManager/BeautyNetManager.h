//
//  BeautyNetManager.h
//  ProjectTeamBeauti
//
//  Created by Tarena on 16/2/3.
//  Copyright © 2016年 shijunchuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+AFNetworking.h"
#import "Beauty.h"
@interface BeautyNetManager : NSObject
+(id)getDataWithPage:(NSString *)page completionHandle:(void(^)(id model,NSError *error))completionHandle;
@end

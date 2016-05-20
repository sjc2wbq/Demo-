//
//  NSObject+MJExtension.h
//  ProjectTeamBeauti
//
//  Created by Tarena on 16/2/3.
//  Copyright © 2016年 shijunchuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
@interface NSObject (MJExtension)
+(id)parse:(id)responseObj;
+(NSDictionary *)replacedKeyFromPropertyName;
+(NSDictionary *)objectClassInArray;
@end

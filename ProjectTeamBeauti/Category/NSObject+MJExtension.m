//
//  NSObject+MJExtension.m
//  ProjectTeamBeauti
//
//  Created by Tarena on 16/2/3.
//  Copyright © 2016年 shijunchuan. All rights reserved.
//

#import "NSObject+MJExtension.h"

@implementation NSObject (MJExtension)
+(id)parse:(id)responseObj{
    if ([responseObj isKindOfClass:[NSArray class]]) {
        return [self mj_keyValuesArrayWithObjectArray:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        return [self mj_objectWithKeyValues:responseObj];
    }
    return responseObj;
}
+(NSDictionary *)mj_objectClassInArray{
   return  [self objectClassInArray];
}
+(NSDictionary *)objectClassInArray{
    return nil;
}
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return [self replacedKeyFromPropertyName];
}
+(NSDictionary *)replacedKeyFromPropertyName{
    return nil;
}

@end

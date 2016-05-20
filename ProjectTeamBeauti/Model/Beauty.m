//
//  Beauty.m
//  ProjectTeamBeauti
//
//  Created by Tarena on 16/2/3.
//  Copyright © 2016年 shijunchuan. All rights reserved.
//

#import "Beauty.h"

@implementation Beauty


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [BeautyData class]};
}
@end
@implementation BeautyData
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"Description":@"description"};
}
@end



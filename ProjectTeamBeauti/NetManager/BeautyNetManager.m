//
//  BeautyNetManager.m
//  ProjectTeamBeauti
//
//  Created by Tarena on 16/2/3.
//  Copyright © 2016年 shijunchuan. All rights reserved.
//

#import "BeautyNetManager.h"
#import "PathsDefineContainer.h"
@implementation BeautyNetManager
+(id)getDataWithPage:(NSString *)page completionHandle:(void (^)(id, NSError *))completionHandle{

  
    NSMutableDictionary *muldic = [NSMutableDictionary new];
    [muldic setObject:@"l" forKey:@"action"];
    [muldic setObject:@"beautifulWoman" forKey:@"albumsTag"];
    [muldic setObject:page forKey:@"p"];
    [muldic setObject:@"77" forKey:@"v"];
    [muldic setObject:@"iOS8.2" forKey:@"OSType"];
    [muldic setObject:@"2.1.7" forKey:@"versionName"];

    return [self GET:@"http://box.dwstatic.com/apiAlbum.php" parameters:muldic progress:nil copletionHandle:^(id responseObj, NSError *error) {
        NSLog(@"");

        if (error) {
            NSLog(@"%@",error);
        }
        completionHandle([Beauty parse:responseObj],error);
    }];
}
@end

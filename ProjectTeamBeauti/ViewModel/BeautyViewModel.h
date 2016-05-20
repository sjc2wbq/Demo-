//
//  BeautyViewModel.h
//  ProjectTeamBeauti
//
//  Created by Tarena on 16/2/3.
//  Copyright © 2016年 shijunchuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BeautyNetManager.h"
#import "Beauty.h"
@interface BeautyViewModel : NSObject
@property(nonatomic) NSMutableArray *mulArr;
@property(nonatomic) NSInteger rowCount;
@property(nonatomic) NSMutableArray *heightScaleArr;
-(NSURL *)imgUrl:(NSInteger)row;
-(NSString *)title:(NSInteger)row;
-(void)getDataCompletionHandle:(void(^)(id model,NSError *error))completionHandle;
-(void)getMoreCompletionHandle:(void(^)(id model,NSError *error))completionHandle;
-(void)refreshCompletionHandle:(void(^)(id model,NSError *error))completionHandle;





@end

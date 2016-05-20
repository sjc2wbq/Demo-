//
//  BeautyViewModel.m
//  ProjectTeamBeauti
//
//  Created by Tarena on 16/2/3.
//  Copyright © 2016年 shijunchuan. All rights reserved.
//

#import "BeautyViewModel.h"
static NSInteger pageCout =1;
@implementation BeautyViewModel
-(NSInteger)rowCount{
    return self.mulArr.count;
}
-(NSURL *)imgUrl:(NSInteger)row{
    return [NSURL URLWithString:[self getDataFormRow:row].coverUrl];
}

-(NSString *)title:(NSInteger)row{
    return [self getDataFormRow:row].title;
}



-(BeautyData *)getDataFormRow:(NSInteger)row{
    if (row<self.mulArr.count) {
        return self.mulArr[row];
    }
    return nil;
}
- (NSMutableArray *)mulArr {
    if(_mulArr == nil) {
        _mulArr = [[NSMutableArray alloc] init];
    }
    return _mulArr;
}


-(void)getDataCompletionHandle:(void (^)(id, NSError *))completionHandle{
    [BeautyNetManager getDataWithPage:[NSString stringWithFormat:@"%ld",pageCout] completionHandle:^(Beauty *model, NSError *error) {
        if (!error) {
            if (pageCout == 1) {
                [self.mulArr removeAllObjects];
                [self.heightScaleArr removeAllObjects];
            }
            NSInteger temp = self.mulArr.count;
            [self.mulArr addObjectsFromArray:model.data];
            for (NSInteger i=temp; i<[self rowCount]; i++) {
                CGFloat width = [self getDataFormRow:i].coverWidth.floatValue;
                CGFloat height = [self getDataFormRow:i].coverHeight.floatValue;
                CGFloat scale = height/width;
                [self.heightScaleArr addObject:@(scale)];
            }

            pageCout++;
        }
        completionHandle(nil,error);
    }];

   }
-(void)getMoreCompletionHandle:(void (^)(id, NSError *))completionHandle{
    [self getDataCompletionHandle:completionHandle];
}
-(void)refreshCompletionHandle:(void (^)(id, NSError *))completionHandle{
    pageCout = 1;
    [self getDataCompletionHandle:completionHandle];

}


- (NSMutableArray *)heightScaleArr {
    if(_heightScaleArr == nil) {
        _heightScaleArr = [[NSMutableArray alloc] init];
    }
    return _heightScaleArr;
}
@end

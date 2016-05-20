//
//  WaterFallCollectionViewCell.m
//  waterFall
//
//  Created by Tarena on 16/1/29.
//  Copyright © 2016年 shijunchuan. All rights reserved.
//

#import "WaterFallCollectionViewCell.h"
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
@implementation WaterFallCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        UIView *view = [UIView new];
//        view.backgroundColor = [UIColor grayColor];
//        [self.contentView addSubview:view];
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(0);
//        }];
        [self titleLabel];
        [self bgView];
        [self imageView];
     
//        [_imageView.layer setCornerRadius:7];
//        [_imageView.layer setMasksToBounds:YES];
//        [_titleLabel.layer setCornerRadius:7];
//        [_titleLabel.layer setMasksToBounds:YES];
        [self.contentView.layer setMasksToBounds:YES];
        [self.contentView.layer setCornerRadius:7];
        self.contentView.backgroundColor = [UIColor whiteColor];
//        [self.gifImage.layer setCornerRadius:9];
//        [self.gifImage.layer setMasksToBounds:YES];
        //self.backgroundColor = [UIColor orangeColor];
    }
    return self;
}
- (UIView *)bgView {
    if(_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
        [self.contentView addSubview:_bgView];
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(2);
            make.left.right.equalTo(0);
            make.bottom.equalTo(self.titleLabel.mas_top);
        }];
    }
    return _bgView;
}
- (UIImageView *)imageView {
    if(_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.bottom.equalTo(self.bgView.mas_top);
        }];
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if(_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_titleLabel];
    
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(-10);
            make.left.equalTo(10);
//            make.top.equalTo(-7);
            make.height.equalTo(20);
            //make.height.equalTo(35);
        }];
    }
    return _titleLabel;
}

@end

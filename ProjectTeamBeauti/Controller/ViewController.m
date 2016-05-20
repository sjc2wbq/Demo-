//
//  ViewController.m
//  ProjectTeamBeauti
//
//  Created by Tarena on 16/2/3.
//  Copyright © 2016年 shijunchuan. All rights reserved.
//

#import "ViewController.h"
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#import "WaterFallCollectionViewCell.h"
#import "BeautyViewModel.h"
#import "UIKit+AFNetworking.h"
#import "MJRefresh.h"
#import "RFQuiltLayout.h"
#define kwidth ([UIScreen mainScreen].bounds.size.width -10)/2
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,RFQuiltLayoutDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic) UICollectionView *collectionView;
@property(nonatomic) UICollectionViewFlowLayout *flowout;
@property(nonatomic) UICollectionViewLayout *myLayout;
@property(nonatomic) BeautyViewModel *beautyList;
@property(nonatomic) UIEdgeInsets uiEdgeInsets;
@end

@implementation ViewController
#pragma mark - UIcollectionView Delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.beautyList.rowCount;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WaterFallCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.titleLabel.text = [self.beautyList title:indexPath.row];
    [cell.imageView setImageWithURL:[self.beautyList imgUrl:indexPath.row]placeholderImage:[UIImage imageNamed:@"bgm"]];
    return cell;
}

#pragma mark - 生命周期 LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self collectionView];
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.beautyList refreshCompletionHandle:^(id model, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                [self.collectionView reloadData];
            }
            
        }];
        [self.collectionView.mj_header endRefreshing];
        
    }];
    [self.collectionView.mj_header beginRefreshing];
    
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.beautyList getMoreCompletionHandle:^(id model, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                [self.collectionView reloadData];
            }
        }];
        [self.collectionView.mj_footer endRefreshing];
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    self.beautyList = nil;
    // Dispose of any resources that can be recreated.
}
#pragma mark - 懒加载 Lazyload
//- (UICollectionViewFlowLayout *)flowout {
//    if(_flowout == nil) {
//        
//        _flowout = [[UICollectionViewFlowLayout alloc] init];
//        _flowout.minimumLineSpacing =5;
//        _flowout.minimumInteritemSpacing =5;
//        _flowout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
//        CGFloat width = ([UIScreen mainScreen].bounds.size.width -10*2-5*2)/2;
//        CGFloat heght=width/194*347;
////        _flowout.itemSize = CGSizeMake(width, heght);
//    }
//    return _flowout;
//}

- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        
        RFQuiltLayout *layout = [[RFQuiltLayout alloc]init];
        layout.direction = UICollectionViewScrollDirectionVertical;
        layout.delegate = self;
        layout.blockPixels = CGSizeMake(kwidth,1);
        //NSLog(@"%f",kwidth);
        self.uiEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
        
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        [_collectionView registerClass:[WaterFallCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(0);
            make.bottom.equalTo(-20);
        }];
    }
    return _collectionView;
}

- (BeautyViewModel *)beautyList {
    if(_beautyList == nil) {
        _beautyList = [[BeautyViewModel alloc] init];
    }
    return _beautyList;
}

#pragma mark - RFQuiltlayout Delegate
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout blockSizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *scale = self.beautyList.heightScaleArr[indexPath.row];
    
    return CGSizeMake(1,kwidth*scale.floatValue+22);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetsForItemAtIndexPath:(NSIndexPath *)indexPath{
    return self.uiEdgeInsets;
}

@end

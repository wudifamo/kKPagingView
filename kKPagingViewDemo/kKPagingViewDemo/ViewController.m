//
//  ViewController.m
//  kKPagingViewDemo
//
//  Created by kangzq on 15/9/28.
//  Copyright © 2015年 com.kKPaging. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    kKPagingView *kkView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //初始化nib
    kkView=[[kKPagingView alloc]initCustomView];
    //设置代理delegate
    kkView.kksvdelegate=self;
    //加入view
    [self.pagingView addSubview:kkView];
    //根据实际情况初始化图片列表
    UIImage *i1=[UIImage imageNamed:@"image1.jpg"];
    UIImage *i2=[UIImage imageNamed:@"image2.jpg"];
    UIImage *i3=[UIImage imageNamed:@"image3.jpg"];
    NSArray *images=[NSArray arrayWithObjects:i1,i2,i3, nil];
    //加入图片
    [kkView setupImage:images];
}
//点击事件
-(void)clickedksvPage:(int)ipage
{
    NSLog(@"clicked page : %d",ipage);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

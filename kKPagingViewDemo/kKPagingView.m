//
//  MyPagingView.m
//  ScrollTest
//
//  Created by kangzq on 15/9/17.
//  Copyright (c) 2015年 com.blueSea. All rights reserved.
//

#import "kKPagingView.h"

@implementation kKPagingView
{
    int timeCount;
    NSTimer *myTimer;
    int max;
}


/**  *  初始化代码:  *  *  @return [nibView objectAtIndex:0]  */
- (kKPagingView *)initCustomView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"kKPagingView" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}

-(void)setupImage :(NSArray *)images
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    kKPagingView *kk=self;
    NSArray* hConstraintArray1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[kk]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(kk)];
    [NSLayoutConstraint activateConstraints:hConstraintArray1];
    NSArray* vConstraintArray = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[kk]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(kk)];
    [NSLayoutConstraint activateConstraints:vConstraintArray];
    max=(int)images.count;
    UIView *logoImageView=self.myHV;
    NSMutableDictionary *titleimgDic=[[NSMutableDictionary alloc]init];
    NSMutableDictionary *imgDic=[[NSMutableDictionary alloc]init];
    [imgDic setValue:logoImageView forKey:@"logoImageView"];
    [titleimgDic setValue:logoImageView forKey:@"logoImageView"];
    NSString *hc=@"";
    NSString *titlehc=@"";
    UITapGestureRecognizer *amTGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bgwz:)];
    //若不需要点击事件可屏蔽下面这行
    [self.scv addGestureRecognizer:amTGR];
    for(int i=0;i<images.count;i++)
    {
        UILabel *mtitleLabel=[[UILabel alloc]init];
        mtitleLabel.backgroundColor=[UIColor blackColor];
        mtitleLabel.alpha=0.6f;
        mtitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        //title，可根据实际情况定制
        mtitleLabel.text=[@"image" stringByAppendingString:[NSString stringWithFormat:@"%d",i+1]];
        mtitleLabel.font=[UIFont systemFontOfSize:14.0];
        mtitleLabel.textColor=[UIColor whiteColor];
        mtitleLabel.textAlignment=NSTextAlignmentCenter;
        UIImage* img = [images objectAtIndex:i];
        //若列表为路径uri则用此方法加载图片
        //UIImage* img = [UIImage imageWithContentsOfFile:uri];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.scv addSubview:imageView];
        [self.scv addSubview:mtitleLabel];
        NSArray* titlevConstraintArray = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[mtitleLabel(==30)]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(mtitleLabel)];
        [NSLayoutConstraint activateConstraints:titlevConstraintArray];
        NSArray* vConstraintArray = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(imageView)];
        [NSLayoutConstraint activateConstraints:vConstraintArray];
        NSLayoutConstraint* heightConstraint = [NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:imageView.superview attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f];
        heightConstraint.active = YES;
        
        NSString *titlek=[@"title" stringByAppendingString:[NSString stringWithFormat:@"%d",i]];
        [titleimgDic setObject:mtitleLabel forKey:titlek];
        titlehc=[[[titlehc stringByAppendingString:@"["] stringByAppendingString:titlek] stringByAppendingString:@"(==logoImageView)]"];
        
        NSString *k=[@"iv" stringByAppendingString:[NSString stringWithFormat:@"%d",i]];
        [imgDic setObject:imageView forKey:k];
        hc=[[[hc stringByAppendingString:@"["] stringByAppendingString:k] stringByAppendingString:@"(==logoImageView)]"];
    }
    NSString *titlefc=[[@"H:|" stringByAppendingString:titlehc] stringByAppendingString:@"|"];
    NSString *fc=[[@"H:|" stringByAppendingString:hc] stringByAppendingString:@"|"];
    if(images.count>0){
        NSArray* hConstraintArray1 = [NSLayoutConstraint constraintsWithVisualFormat:fc options:0 metrics:nil views:imgDic];
        [NSLayoutConstraint activateConstraints:hConstraintArray1];
        NSArray* titlehConstraintArray1 = [NSLayoutConstraint constraintsWithVisualFormat:titlefc options:0 metrics:nil views:titleimgDic];
        [NSLayoutConstraint activateConstraints:titlehConstraintArray1];
    }
    timeCount = 0;
    [myTimer invalidate];
    myTimer =   [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];
    
    
}

//定时滚动
-(void)scrollTimer{
    timeCount=[self currentPage];
    timeCount ++;
    if (timeCount == max) {
        timeCount = 0;
    }
    [self.scv scrollRectToVisible:CGRectMake(timeCount * self.frame.size.width, 0,self.scv.frame.size.width, self.frame.size.height) animated:YES];
}
//点击事件
-(void) bgwz:(UITapGestureRecognizer *)recognizer{
    [self.kksvdelegate clickedksvPage:[self currentPage]];
}
//根据offset计算当前page
- (int)currentPage
{
    return self.scv.contentOffset.x / self.frame.size.width;
}

@end

//
//  MyPagingView.h
//  ScrollTest
//
//  Created by kangzq on 15/9/17.
//  Copyright (c) 2015年 com.blueSea. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KKScrollViewDelegate <NSObject>;
//@optional 表明，这个方法是不要求一定实现，是可选的。
@optional
-(void)clickedksvPage :(int)ipage;
@end

@interface kKPagingView : UIView<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *myHV;
@property (weak, nonatomic) IBOutlet UIScrollView *scv;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (assign,nonatomic) id<KKScrollViewDelegate> kksvdelegate;
-(void)setupImage :(NSArray *)images;
- (kKPagingView *)initCustomView;

@end

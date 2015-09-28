//
//  ViewController.h
//  kKPagingViewDemo
//
//  Created by kangzq on 15/9/28.
//  Copyright © 2015年 com.kKPaging. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "kKPagingView.h"

@interface ViewController : UIViewController<KKScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *pagingView;


@end


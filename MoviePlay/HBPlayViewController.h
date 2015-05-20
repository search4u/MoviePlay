//
//  HBPlayViewController.h
//  MoviePlay
//
//  Created by bottle on 15/5/18.
//  Copyright (c) 2015年 bottle. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HBPlayViewControllerDelegate <NSObject>

@optional
- (void)playViewDidFinish;

@end

@interface HBPlayViewController : UIViewController

@property (nonatomic,weak) id<HBPlayViewControllerDelegate> delegate;
@property (nonatomic,strong) NSURL *movieUrl;

@end

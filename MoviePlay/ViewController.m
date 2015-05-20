//
//  ViewController.m
//  MoviePlay
//
//  Created by bottle on 15/5/18.
//  Copyright (c) 2015年 bottle. All rights reserved.
//

#import "ViewController.h"
#import "HBPlayViewController.h"

@interface ViewController () <HBPlayViewControllerDelegate>
@property (nonatomic,strong) HBPlayViewController *moviePlayContoller;
- (IBAction)play;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)play {
    self.moviePlayContoller.delegate = self;
    self.moviePlayContoller.movieUrl = [[NSBundle mainBundle] URLForResource:@"promo_full.mp4" withExtension:nil];
    [self presentViewController:self.moviePlayContoller animated:YES completion:nil];
}

- (HBPlayViewController *)moviePlayContoller {
    if (!_moviePlayContoller) {
        _moviePlayContoller = [[HBPlayViewController alloc] init];
    }
    return _moviePlayContoller;
}

- (void)playViewDidFinish {
    [self dismissViewControllerAnimated:self.moviePlayContoller completion:nil];
}

@end

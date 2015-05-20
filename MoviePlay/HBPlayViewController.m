//
//  HBPlayViewController.m
//  MoviePlay
//
//  Created by bottle on 15/5/18.
//  Copyright (c) 2015年 bottle. All rights reserved.
//

#import "HBPlayViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface HBPlayViewController ()

@property (nonatomic,strong)  MPMoviePlayerController *movePlayer;

@end

@implementation HBPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.movePlayer play];
    [self addNotification];
}

- (MPMoviePlayerController *)movePlayer {
    if (!_movePlayer) {
        _movePlayer = [[MPMoviePlayerController alloc] initWithContentURL:self.movieUrl];
        _movePlayer.view.frame = self.view.bounds;
        [self.view addSubview:_movePlayer.view];
    }
    return _movePlayer;
}

- (void)addNotification {
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(finished) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    [nc addObserver:self selector:@selector(finished) name:MPMoviePlayerDidExitFullscreenNotification object:nil];
    [nc addObserver:self selector:@selector(captureImagesFinished:) name:MPMoviePlayerThumbnailImageRequestDidFinishNotification object:nil];
    [self.movePlayer requestThumbnailImagesAtTimes:@[@(1.8),@(6.3)] timeOption:MPMovieTimeOptionNearestKeyFrame];
}

- (void)finished {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    if ([self.delegate respondsToSelector:@selector(playViewDidFinish)]) {
        [self.delegate playViewDidFinish];
    }
}

- (void)captureImagesFinished {
    NSLog(@"captureImagesFinished");
}
@end

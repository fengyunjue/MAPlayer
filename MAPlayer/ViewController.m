//
//  ViewController.m
//  MAPlayer
//
//  Created by admin on 15/6/19.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "ViewController.h"
#import "MAPlayer.h"


@interface ViewController ()<MAPlayerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLabel;

@property (nonatomic, strong) MAPlayer *music;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"http://sc1.111ttt.com/2015/1/06/19/99191406038.mp3";
    
    self.music = [MAPlayer sharedMAPlayer];
    self.music.delegate = self;
    [self.music loadMusicWithMusicURL:str];
    [self.music setTitle:str artist:@"我们的爱" albumTitle:@"花儿乐队"];
    
}

- (IBAction)play:(id)sender {
    [self.music play];
}
- (IBAction)pause:(id)sender {
    [self.music pause];
}

#pragma mark MAPlayerDelegate
- (void)playerWithCurrentTimeRefreshWithMAPlayer:(MAPlayer *)player currentTimeStr:(NSString *)currentTimeStr
{
    self.currentTimeLabel.text = currentTimeStr;
}

- (void)playerWithPlayEndWithMAPlayer:(MAPlayer *)player
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Player did reach end."
                                                   message:nil
                                                  delegate:self
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil, nil];
    [alert show];
}
- (void)playerStatusReadyToPlayWithMAPlayer:(MAPlayer *)player totalTime:(NSString *)totalTime
{
    self.totalTimeLabel.text = totalTime;
}

- (void)playerStatusFailedWithMAPlayer:(MAPlayer *)player
{
    [[[UIAlertView alloc]initWithTitle:@"提示" message:@"加载音乐失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil]show];
}

- (void)dealloc
{
    [self.music pause];
    NSLog(@"%s",__func__);
}

@end

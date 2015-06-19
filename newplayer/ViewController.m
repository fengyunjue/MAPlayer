//
//  ViewController.m
//  newplayer
//
//  Created by admin on 15/6/18.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "ViewController.h"
#import "MAMusic.h"


@interface ViewController ()<MAMusicDelegate>

@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLabel;

@property (nonatomic, strong) MAMusic *music;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"http://tingge.5nd.com/20060919/2015/2015-6-17/67508/1.Mp3";
    
    self.music = [MAMusic sharedMAMusic];
    self.music.delegate = self;
    [self.music loadMusicWithMusicURL:str];
    [self.music setTitle:str artist:@"你是我心里的宝" albumTitle:@"乐凡"];

}

- (IBAction)play:(id)sender {
    [self.music play];
}
- (IBAction)pause:(id)sender {
    [self.music pause];
}

#pragma mark MAMusicDelegate
- (void)musicWithCurrentTimeRefreshWithCurrentTimeStr:(NSString *)currentTimeStr
{
    self.currentTimeLabel.text = currentTimeStr;
}

- (void)musicWithPlayEnd
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Player did reach end."
                                                   message:nil
                                                  delegate:self
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil, nil];
    [alert show];
}
- (void)musicStatusReadyToPlayWithMAMusic:(MAMusic *)music totalTime:(NSString *)totalTime
{
    self.totalTimeLabel.text = totalTime;
}

- (void)musicStatusFailedWithMAMusic:(MAMusic *)music
{
    [[[UIAlertView alloc]initWithTitle:@"提示" message:@"加载音乐失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil]show];
}

- (void)dealloc
{
    [self.music pause];
    NSLog(@"%s",__func__);
}

@end

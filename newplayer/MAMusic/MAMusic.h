//
//  MAMusic.h
//  kf5
//
//  Created by admin on 15/6/17.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@class MAMusic;
@protocol MAMusicDelegate <NSObject>

@optional

// 刷新播放时间
- (void)musicWithCurrentTimeRefreshWithCurrentTimeStr:(NSString *)currentTimeStr;

// 播放结束
- (void)musicWithPlayEnd;

// music加载成功,获取到总时间
- (void)musicStatusReadyToPlayWithMAMusic:(MAMusic *)music totalTime:(NSString *)totalTime;

// music加载失败
- (void)musicStatusFailedWithMAMusic:(MAMusic *)music;

@end

@interface MAMusic : NSObject

@property (nonatomic, copy) NSString *musicURLStr;

@property (nonatomic, weak) id<MAMusicDelegate> delegate;

@property (nonatomic ,strong) AVPlayer *player;
@property (nonatomic ,strong) AVPlayerItem *playerItem;

@property (nonatomic, copy) NSString *totalTime;

@property (nonatomic, assign) BOOL isPlaying;// 点击了播放按钮，就算是正在播放

+ (instancetype)sharedMAMusic;

- (void)loadMusicWithMusicURL:(NSString *)musicUrlStr;

- (void)play;

- (void)pause;
// 
- (void)setTitle:(NSString *)title artist:(NSString *)artist albumTitle:(NSString *)albumTitle;

@end

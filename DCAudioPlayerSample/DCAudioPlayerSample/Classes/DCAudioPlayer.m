//
//  DCAudioPlayer.m
//  DCAudioPlayerSample
//
//  Created by 廣川政樹 on 2013/07/31.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "DCAudioPlayer.h"

@implementation DCAudioPlayer

//初期化
- (id)initWithAudio:(NSString *)fileName ext:(NSString *)ext
{
    if (self = [super init]) {
        //オーディオプレイヤー初期化
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *filePath = [mainBundle pathForResource:fileName
                                                  ofType:ext];
        NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
        NSError *error = nil;
        AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl error:&error];
        
        //エラーであれば処理しない
        if (!error) {
            //オーディオプレイヤー保持
            _audioPlayer = audioPlayer;
            
            //バッファを保持
            [_audioPlayer prepareToPlay];
        }
    }
    return self;
}

//再生
- (void)play
{
    if (_audioPlayer) {
        if (!_audioPlayer.isPlaying) {
            [_audioPlayer prepareToPlay];
            [_audioPlayer play];
        }
    }
}

//一時停止
- (void)pause
{
    if (_audioPlayer) {
        if (_audioPlayer.isPlaying) {
            [_audioPlayer pause];
        }
    }
}

//停止
- (void)stop
{
    if (_audioPlayer) {
        if (_audioPlayer.isPlaying) {
            [_audioPlayer stop];
            [_audioPlayer prepareToPlay];
        }
    }
}

//ボリュームコントロールスライダー
- (UISlider *)volumeControlSlider:(id)delegate point:(CGPoint)point defaultValue:(float)defaultValue selector:(SEL)selector
{
    UISlider *audioVolumeSlider = [[UISlider alloc] initWithFrame:CGRectMake(point.x,
                                                                             point.y,
                                                                             AUDIO_VOLUME_SLIDER_WIDTH,
                                                                             AUDIO_VOLUME_SLIDER_HEIGHT)];
    audioVolumeSlider.minimumValue = 0.0f;
    audioVolumeSlider.maximumValue = 1.0f;
    if (defaultValue > AUDIO_MAX_VOLUME) defaultValue = AUDIO_MAX_VOLUME;
    if (defaultValue < AUDIO_MIN_VOLUME) defaultValue = AUDIO_MIN_VOLUME;
    audioVolumeSlider.value = defaultValue;
    [audioVolumeSlider addTarget:delegate
                          action:selector
                forControlEvents:UIControlEventValueChanged];
    return audioVolumeSlider;
}

//ボリューム指定
- (void)setVolume:(float)volume
{
    if (_audioPlayer) {
        _audioPlayer.volume = volume;
    }
}

//現在の再生フレーム指定
- (void)setCurrentTime:(NSTimeInterval)currentTime
{
    if (_audioPlayer) {
        _audioPlayer.currentTime = currentTime;
    }
}

//ループ回数指定
- (void)setNumberOfLoops:(NSInteger)numberOfLoops
{
    if (_audioPlayer) {
        _audioPlayer.numberOfLoops = numberOfLoops;
    }
}

//再生状況の取得
- (BOOL)isPlaying
{
    return _audioPlayer.playing;
}

@end

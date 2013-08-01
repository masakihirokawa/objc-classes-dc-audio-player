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
        [_audioPlayer prepareToPlay];
        [_audioPlayer play];
    }
}

//一時停止
- (void)pause
{
    if (_audioPlayer) {
        [_audioPlayer pause];
    }
}

//停止
- (void)stop
{
    if (_audioPlayer) {
        [_audioPlayer stop];
        [_audioPlayer prepareToPlay];
    }
}

//ボリュームコントロールスライダー
- (UISlider *)volumeControlSlider:(id)delegate point:(CGPoint)point defaultValue:(float)defaultValue selector:(id)selector
{
    UISlider *audioVolumeSlider = [[UISlider alloc] initWithFrame:CGRectMake(point.x, point.y, SLIDER_WIDTH, SLIDER_HEIGHT)];
    audioVolumeSlider.minimumValue = 0.0f;
    audioVolumeSlider.maximumValue = 1.0f;
    if (defaultValue > 1.0f) {
        defaultValue = 1.0f;
    }
    if (defaultValue < 0.0f) {
        defaultValue = 0.0f;
    }
    audioVolumeSlider.value = defaultValue;
    [audioVolumeSlider addTarget:delegate
                          action:@selector(sliderValueChanged:)
                forControlEvents:UIControlEventValueChanged];
    return audioVolumeSlider;
}

//スライダー変更時のイベント
- (void)sliderValueChanged:(UISlider *)slider
{
    if (_audioPlayer) {
        //[self setVolume:slider.value];
    }
}

//ボリューム指定
- (void)setVolume:(float)volume
{
    volume = volume;
}

//ボリューム取得
- (float)getVolume
{
    return self.volume;
}

//現在の再生フレーム指定
- (void)setCurrentTime:(NSTimeInterval)currentTime
{
    currentTime = currentTime;
}

//現在の再生フレーム取得
- (NSTimeInterval)getCurrentTime
{
    return self.currentTime;
}

@end

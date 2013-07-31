//
//  DCAudioPlayer.m
//  DCAudioPlayerSample
//
//  Created by 廣川政樹 on 2013/07/31.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "DCAudioPlayer.h"

@implementation DCAudioPlayer

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

- (void)play
{
    [_audioPlayer prepareToPlay];
    [_audioPlayer play];
}

- (void)pause
{
    [_audioPlayer pause];
}

- (void)stop
{
    [_audioPlayer stop];
    [_audioPlayer prepareToPlay];
}

- (UISlider *)volumeControlSlider:(id)delegate rect:(CGRect)rect defaultValue:(float)defaultValue
{
    UISlider *audioVolumeSlider = [[UISlider alloc] initWithFrame:rect];
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

- (void)sliderValueChanged:(UISlider *)slider
{
    if (_audioPlayer) {
        _audioPlayer.volume = slider.value;
    }
}

- (void)setVolume:(float)volume
{
    self.volume = volume;
}

- (float)getVolume
{
    return self.volume;
}

- (void)setCurrentTime:(NSTimeInterval)currentTime
{
    currentTime = currentTime;
}

- (NSTimeInterval)getCurrentTime
{
    return self.currentTime;
}

@end

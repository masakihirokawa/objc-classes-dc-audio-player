//
//  DCAudioPlayer.m
//  DCAudioPlayerSample
//
<<<<<<< HEAD
//  Created by 廣川政樹 on 2013/07/31.
=======
//  Created by Dolice on 2013/07/15.
>>>>>>> 62c2efb3ee6e297a3f4256d698163b9471a5841a
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "DCAudioPlayer.h"

@implementation DCAudioPlayer

<<<<<<< HEAD
- (id)initWithAudio:(NSString *)fileName ext:(NSString *)ext
=======
- (id)initWithAudioResource:fileName fileExt:(NSString *)fileExt numberOfLoops:(NSInteger)numberOfLoops
>>>>>>> 62c2efb3ee6e297a3f4256d698163b9471a5841a
{
    if (self = [super init]) {
        //オーディオプレイヤー初期化
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *filePath = [mainBundle pathForResource:fileName
<<<<<<< HEAD
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
=======
                                                  ofType:fileExt];
        NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
        NSError *error = nil;
        AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl
                                                                            error:&error];
        
        if (!error) {
            //バッファを保持
            [audioPlayer prepareToPlay];
            
            //オーディオプレイヤー保持
            _audioPlayer = audioPlayer;
            
            //ループ回数の指定
            _audioPlayer.numberOfLoops = numberOfLoops;
>>>>>>> 62c2efb3ee6e297a3f4256d698163b9471a5841a
        }
    }
    return self;
}

- (void)play
{
<<<<<<< HEAD
    [_audioPlayer prepareToPlay];
=======
>>>>>>> 62c2efb3ee6e297a3f4256d698163b9471a5841a
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

<<<<<<< HEAD
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

- (void)setVolume:(CGFloat)volume
{
    volume = volume;
}

- (void)setCurrentTime:(NSTimeInterval)currentTime
{
    currentTime = currentTime;
=======
- (void)setVolume:(float)volume
{
    self.volume = volume;
}

- (float)getVolume
{
    return self.volume;
>>>>>>> 62c2efb3ee6e297a3f4256d698163b9471a5841a
}

@end

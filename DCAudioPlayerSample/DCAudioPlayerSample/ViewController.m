//
//  ViewController.m
//  DCAudioPlayerSample
//
//  Created by 廣川政樹 on 2013/07/03.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property AVAudioPlayer *audioPlayer;
@property UISlider      *audioVolumeSlider;

@end

@implementation ViewController

typedef enum audioPlayButtonEvent : NSInteger {
    AUDIO_PLAY = 1,
    AUDIO_STOP = 2
} audioPlayButtonEvent;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //オーディオプレイヤー初期化
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *filePath = [mainBundle pathForResource:AUDIO_RESOURCE_FILE_NAME
                                              ofType:AUDIO_RESOURCE_FILE_EXT];
    NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
    NSError *error = nil;
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl
                                                                        error:&error];
    
    //エラーであれば処理しない
    if (error) {
        return;
    }
    
    //バッファを保持
    [audioPlayer prepareToPlay];
    
    //ボタンとスライダーをセット
    [self setButtonsAndSlider];
    
    //オーディオプレイヤー保持
    _audioPlayer = audioPlayer;
}

//再生/停止ボタンイベント
- (void)buttonTapped:(UIButton *)button
{
    if (button.tag == AUDIO_PLAY) {
        float volume = _audioVolumeSlider.value;
        _audioPlayer.volume = volume;
        _audioPlayer.currentTime = 0;
        [_audioPlayer play];
    } else if (button.tag == AUDIO_STOP) {
        [_audioPlayer pause];
    }
}

//オーディオボリューム変更
- (void)sliderValueChanged:(UISlider *)slider
{
    if (_audioPlayer) {
        _audioPlayer.volume = slider.value;
    }
}

//ボタンとスライダーの表示
- (void)setButtonsAndSlider
{
    //再生ボタン
    UIButton *buttonPlay = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonPlay.frame = CGRectMake(50, 50, 100, 50);
    buttonPlay.tag = AUDIO_PLAY;
    [buttonPlay setTitle:@"Play" forState:UIControlStateNormal];
    [buttonPlay addTarget:self
                   action:@selector(buttonTapped:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonPlay];
    
    //停止ボタン
    UIButton *buttonStop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonStop.frame = CGRectMake(170, 50, 100, 50);
    buttonStop.tag = AUDIO_STOP;
    [buttonStop setTitle:@"Stop" forState:UIControlStateNormal];
    [buttonStop addTarget:self
                   action:@selector(buttonTapped:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonStop];
    
    //ボリュームスライダー
    UISlider *audioVolumeSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 150, 220, 0)];
    audioVolumeSlider.minimumValue = 0.0f;
    audioVolumeSlider.maximumValue = 1.0f;
    audioVolumeSlider.value = 0.5f;
    _audioVolumeSlider = audioVolumeSlider;
    [_audioVolumeSlider addTarget:self
                           action:@selector(sliderValueChanged:)
                 forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_audioVolumeSlider];
}

@end

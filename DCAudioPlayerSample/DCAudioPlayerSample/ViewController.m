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
    
<<<<<<< HEAD
    //初期化
    _audioPlayer = [[DCAudioPlayer alloc] initWithAudio:AUDIO_RESOURCE_FILE_NAME
                                                    ext:AUDIO_RESOURCE_FILE_EXT];
    
    //再生/停止ボタンとボリュームスライダー表示
    [self setButtonsAndSlider];
}


//再生/停止ボタンイベント
- (void)buttonWasTapped:(UIButton *)button
{
    if (button.tag == 1) {
        //再生
        [_audioPlayer setVolume:_audioVolumeSlider.value];
        [_audioPlayer setCurrentTime:0];
        [_audioPlayer play];
    } else {
        //一時停止
=======
    //クラス初期化
    _audioPlayer = [[DCAudioPlayer alloc] initWithAudioResource:AUDIO_RESOURCE_FILE_NAME
                                                        fileExt:AUDIO_RESOURCE_FILE_EXT
                                                  numberOfLoops:0];
    
    //ボタンとスライダーをセット
    [self setButtonsAndSlider];
}

//再生/停止ボタンイベント
- (void)buttonTapped:(UIButton *)button
{
    if (button.tag == AUDIO_PLAY) {
        //[_audioPlayer setVolume:_audioVolumeSlider.value];
        _audioPlayer.volume = _audioVolumeSlider.value;
        //_audioPlayer.currentTime = 0;
        [_audioPlayer play];
    } else if (button.tag == AUDIO_STOP) {
>>>>>>> 62c2efb3ee6e297a3f4256d698163b9471a5841a
        [_audioPlayer pause];
    }
}

<<<<<<< HEAD
/*
=======
>>>>>>> 62c2efb3ee6e297a3f4256d698163b9471a5841a
//オーディオボリューム変更
- (void)sliderValueChanged:(UISlider *)slider
{
    if (_audioPlayer) {
        _audioPlayer.volume = slider.value;
    }
}
*/

<<<<<<< HEAD
//再生/停止ボタンとボリュームスライダーの表示
=======
//ボタンとスライダーの表示
>>>>>>> 62c2efb3ee6e297a3f4256d698163b9471a5841a
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
<<<<<<< HEAD
    _audioVolumeSlider = [_audioPlayer volumeControlSlider:self rect:CGRectMake(50, 150, 220, 0) defaultValue:0.5f];
    /*
=======
>>>>>>> 62c2efb3ee6e297a3f4256d698163b9471a5841a
    UISlider *audioVolumeSlider = [[UISlider alloc] initWithFrame:CGRectMake(50, 150, 220, 0)];
    audioVolumeSlider.minimumValue = 0.0f;
    audioVolumeSlider.maximumValue = 1.0f;
    audioVolumeSlider.value = 0.5f;
    _audioVolumeSlider = audioVolumeSlider;
    [_audioVolumeSlider addTarget:self
                           action:@selector(sliderValueChanged:)
                 forControlEvents:UIControlEventValueChanged];
<<<<<<< HEAD
     */
=======
>>>>>>> 62c2efb3ee6e297a3f4256d698163b9471a5841a
    [self.view addSubview:_audioVolumeSlider];
}

@end

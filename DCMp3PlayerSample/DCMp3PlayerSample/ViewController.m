//
//  ViewController.m
//  DCMp3PlayerSample
//
//  Created by 廣川政樹 on 2013/07/03.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

AVAudioPlayer *audioPlayer_;
UISlider *slider_;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *filePath = [mainBundle pathForResource:@"sample" ofType:@"mp3"];
    NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
    NSError *error = nil;
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl error:&error];
    if(!error){
        [audioPlayer prepareToPlay];
        [self setButtonAndSlider];
        audioPlayer_ = audioPlayer;
    } else {
        NSLog(@"AVAudioPlayer Error");
    }
}



- (void)buttonWasTapped:(UIButton *)button
{
    if (button.tag == 1) {
        float volume = slider_.value;
        audioPlayer_.volume = volume;
        audioPlayer_.currentTime = 0;
        [audioPlayer_ play];
        NSLog(@"volume: %f", volume);
    } else {
        [audioPlayer_ pause];
    }
}

- (void)sliderValueWasChanged:(UISlider *)slider
{
    if (audioPlayer_) {
        audioPlayer_.volume = slider.value;
    }
}

- (void)setButtonAndSlider
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(50, 50, 100, 50);
    button.tag = 1;
    [button setTitle:@"Start" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonWasTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(170, 50, 100, 50);
    button2.tag = 2;
    [button2 setTitle:@"Stop" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonWasTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 150, 220, 0)];
    slider.minimumValue = 0.0f;
    slider.maximumValue = 1.0f;
    slider.value = 0.5f;
    slider_ = slider;
    [slider addTarget:self action:@selector(sliderValueWasChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}

@end

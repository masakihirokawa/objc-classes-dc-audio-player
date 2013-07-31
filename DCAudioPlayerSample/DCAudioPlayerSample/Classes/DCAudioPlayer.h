//
//  DCAudioPlayer.h
//  DCAudioPlayerSample
//
//  Created by 廣川政樹 on 2013/07/31.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

@interface DCAudioPlayer : AVAudioPlayer

@property AVAudioPlayer  *audioPlayer;
@property CGFloat        volume;
@property NSTimeInterval currentTime;

- (id)initWithAudio:(NSString *)fileName ext:(NSString *)ext;
- (void)play;
- (void)pause;
- (void)stop;
- (void)setVolume:(CGFloat)volume;
- (void)setCurrentTime:(NSTimeInterval)currentTime;
- (UISlider *)volumeControlSlider:(id)delegate rect:(CGRect)rect defaultValue:(float)defaultValue;

@end

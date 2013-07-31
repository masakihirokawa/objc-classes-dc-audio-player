//
//  DCAudioPlayer.h
//  DCAudioPlayerSample
//
//  Created by 廣川政樹 on 2013/07/31.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

@interface DCAudioPlayer : AVAudioPlayer

@property AVAudioPlayer                       *audioPlayer;
@property NSTimeInterval                      currentTime;
@property (readonly) NSData                   *data;
@property (assign) id <AVAudioPlayerDelegate> delegate;
@property NSTimeInterval                      duration;
@property (getter=isMeteringEnabled) BOOL     meteringEnabled;
@property (readonly) NSUInteger               numberOfChannels;
@property NSInteger                           numberOfLoops;
@property (readonly, getter=isPlaying) BOOL   playing;
@property (readonly) NSURL                    *url;
@property float                               volume;

- (id)initWithAudio:(NSString *)fileName ext:(NSString *)ext;
- (void)play;
- (void)pause;
- (void)stop;
- (void)setVolume:(CGFloat)volume;
- (void)setCurrentTime:(NSTimeInterval)currentTime;
- (UISlider *)volumeControlSlider:(id)delegate rect:(CGRect)rect defaultValue:(float)defaultValue;

@end

//
//  DCAudioPlayer.h
//  DCAudioPlayerSample
//
//  Created by Dolice on 2013/07/15.
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

- (id)initWithAudioResource:fileName fileExt:(NSString *)fileExt numberOfLoops:(NSInteger)numberOfLoops;
- (void)play;
- (void)pause;
- (void)stop;
- (void)setVolume:(float)volume;

@end

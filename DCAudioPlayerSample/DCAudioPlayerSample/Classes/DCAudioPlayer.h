//
//  DCAudioPlayer.h
//  DCAudioPlayerSample
//
<<<<<<< HEAD
//  Created by 廣川政樹 on 2013/07/31.
=======
//  Created by Dolice on 2013/07/15.
>>>>>>> 62c2efb3ee6e297a3f4256d698163b9471a5841a
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

@interface DCAudioPlayer : AVAudioPlayer

<<<<<<< HEAD
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
=======
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
>>>>>>> 62c2efb3ee6e297a3f4256d698163b9471a5841a

@end

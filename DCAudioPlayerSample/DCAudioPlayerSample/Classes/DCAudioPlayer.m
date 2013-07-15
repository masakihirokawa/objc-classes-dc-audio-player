//
//  DCAudioPlayer.m
//  DCAudioPlayerSample
//
//  Created by Dolice on 2013/07/15.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "DCAudioPlayer.h"

@implementation DCAudioPlayer

- (id)initWithAudioResource:fileName fileExt:(NSString *)fileExt numberOfLoops:(NSInteger)numberOfLoops
{
    if (self = [super init]) {
        //オーディオプレイヤー初期化
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *filePath = [mainBundle pathForResource:fileName
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
        }
    }
    return self;
}

- (void)play
{
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

- (void)setVolume:(float)volume
{
    self.volume = volume;
}

- (float)getVolume
{
    return self.volume;
}

@end

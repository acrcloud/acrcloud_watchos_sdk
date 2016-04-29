//
//  ACRCloud_IOS_SDK.h
//  ACRCloud_IOS_SDK
//
//  Created by olym on 15/3/24.
//  Copyright (c) 2015年 ACRCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ACRCloudConfig.h"

@interface ACRCloudRecognition : NSObject

-(id)initWithConfig:(ACRCloudConfig*)config;

-(NSString*)recognize:(char*)buffer len:(int)len;

+(NSData*)get_fingerprint:(char*)pcm len:(int)len;

+(NSData*) get_fingerprint:(char*)pcm
                     len:(unsigned)len
                sampleRate:(unsigned)sampleRate
                  nChannel:(short)nChannel;

+(NSData*) resample:(char*)pcm
                len:(unsigned)len
         sampleRate:(unsigned)sampleRate
           nChannel:(short)nChannel;

@end

//
//  InterfaceController.m
//  ACRCloudWatchOSDemo WatchKit Extension
//
//  Created by olym.yin on 4/28/16.
//  Copyright © 2016 ACRCloud. All rights reserved.
//

#import "InterfaceController.h"
#import "ACRCloudRecognition.h"
#import "ACRCloudConfig.h"


@interface InterfaceController()

@end


@implementation InterfaceController
{
    ACRCloudRecognition         *_client;
    ACRCloudConfig          *_config;

}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Do any additional setup after loading the view, typically from a nib.
    
    _config = [[ACRCloudConfig alloc] init];
    
    _config.accessKey = @"<your project access key>";
    _config.accessSecret = @"<your project access secret>";
    _config.host = @"<your project host>";
    //if you want to identify your offline db, set the recMode to "rec_mode_local"
    _config.recMode = rec_mode_remote;
    _config.audioType = @"recording";
    _config.requestTimeout = 10;
 
    _client = [[ACRCloudRecognition alloc] initWithConfig:_config];
    
    FILE *fp = fopen("/Users/olym.yin/Downloads/sample.wav", "r");
    char buffer[120000] = {0};
    fread(buffer, 1, 120000, fp);
    NSString* r = [_client recognize:buffer len:120000];
    NSLog(r);
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end




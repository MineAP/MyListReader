//
//  NicoLoginDelegate.h
//  MyListReader
//
//  Created by 白峰 圭祐 on 12/02/12.
//  Copyright (c) 2012年 MineAP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyList.h"
#import "MyListLoader.h"
#import "AppController.h"
#import "VideoInfo.h"
#import "NicoLogin.h"

@interface NicoLoginDelegate : NSObject
{
    AppController* myAppController;
    NSString* mail;
    NSString* pass;
}
- (id)init:(AppController*)appController address:(NSString*)mailAddr pass:(NSString*)password;
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
@end

//
//  NicoLogin.m
//  MyListReader
//
//  Created by 白峰 圭祐 on 12/02/12.
//  Copyright (c) 2012年 MineAP. All rights reserved.
//

#import "NicoLogin.h"

@implementation NicoLogin

-(id)init:(AppController *)appController
{
    [super init];
    
    myAppController = appController;
    
    return self;
}

-(void)login:(NSString *)userName :(NSString *)password
{
    
    NSURLConnection* connection;
    NSURL* url = [[NSURL alloc] initWithString:@"https://secure.nicovideo.jp/secure/login"];
    
    NSMutableURLRequest* req = [[NSMutableURLRequest alloc] initWithURL:url];
    
    NSString* data = [[NSString alloc] initWithFormat:@"site=niconico&mail=%@&password=%@", userName, password];
    
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody:[data dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NicoLoginDelegate* del = [[NicoLoginDelegate alloc] init:myAppController address:userName pass:password];
    
    connection = [[NSURLConnection alloc] initWithRequest:req delegate:del];
    
    if (connection)
    {
        NSLog(@"login...");
    }
    else
    {
        NSLog(@"connection is nil");
    }
    
}

-(void)checkAndLogin:(NSString *)userName :(NSString *)password
{
    
    NSURLConnection* connection;
    NSURL* url = [[NSURL alloc] initWithString:@"http://www.nicovideo.jp/"];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:url];
    
    NicoLoginDelegate* del = [[NicoLoginDelegate alloc] init:myAppController address:userName pass:password];
    
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:del];
    
    
    if (connection) {
        NSLog(@"checking...");
    } else {
        NSLog(@"connection is nil");
        return;
    }
    
}



@end

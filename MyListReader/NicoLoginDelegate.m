//
//  NicoLoginDelegate.m
//  MyListReader
//
//  Created by 白峰 圭祐 on 12/02/12.
//  Copyright (c) 2012年 MineAP. All rights reserved.
//

#import "NicoLoginDelegate.h"


@implementation NicoLoginDelegate

// コンストラクタ
-(id)init:(AppController *)appController address:(NSString*)mailAddr pass:(NSString*)password
{
    [super init];
    
    myAppController = appController;
    
    mail = mailAddr;
    pass = password;
    
    return self;
}

// データを受け取ったときに呼ばれる
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // 何もしない
}

// レスポンスを受け取ったときに呼ばれる
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"didReceiveResponse");
    
    NSDictionary* headers = [(NSHTTPURLResponse*) response allHeaderFields];
    
    NSString* flag = [headers objectForKey:@"x-niconico-authflag"];
    
    NSLog(@"x-niconico-authflag:%@", flag);
    
    if ([flag isEqual:@"1"] || [flag isEqual:@"3"])
    {
        //http://www.nicovideo.jp/mylist/434361?rss=2.0
        
        // 1は通常会員、3はプレミアム会員
        
        NSString* url = [myAppController myListUrl];
        if (url)
        {
            MyListLoader* loader = [[MyListLoader alloc] init];
            MyList* myList = [loader loadMyListAndGetVideoInfos:url];
            
            myAppController.myList = myList;
            
            [myAppController reloadRssItemView];
            
        }
    }
    else
    {
        
        // ログインします
        
        NicoLogin* login = [[NicoLogin alloc] init:myAppController];
        [login login:mail :pass];
        
    }
    
    
}

// データの受信が完了したときに呼ばれる
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{    
    // 何もしない
}


@end

//
//  AppController.m
//  MyListReader
//
//  Created by 白峰 圭祐 on 12/01/29.
//  Copyright (c) 2012年 MineAP. All rights reserved.
//

#import "AppController.h"
#import "MyListLoader.h"
#import "VideoInfo.h"
#import "NicoLogin.h"

@implementation AppController

@synthesize myList;

-(NSString*)myListUrl
{
    return urlInputField.stringValue;
}

-(void)reloadRssItemView
{
    [rssItemView reloadData];
}

-(IBAction)loadMyList:(id)sender
{
    
    MyListLoader* loader = [[MyListLoader alloc] init];
    
    
    NSString* url = urlInputField.stringValue;
    if ([url length] < 1)
    {
        return;
    }
    
    NSRange range = [url rangeOfString:@"http"];
    if (range.length > 0)
    {
        // http指定
        
        [[[NicoLogin alloc] init:self] checkAndLogin:mailInputField.stringValue :passInputField.stringValue];
        
    }
    else
    {
        myList = [loader loadMyListAndGetVideoInfos:url];
        [self reloadRssItemView];
    }
    
}

-(int)numberOfRowsInTableView:(NSTableView*) tableView
{
    if (!myList)
    {
        return 0;
    }
    
    NSInteger count = [myList.videoInfos count];
    
    return (int)count;
    
}

-(id)tableView:(NSTableView*)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    if (!myList)
    {
        return nil;
    }
    
    id identifier;
    identifier = [tableColumn identifier];
    
    VideoInfo* info = [myList.videoInfos objectAtIndex:row];
    
    if ( [identifier isEqual:@"title"] )
    {
        return info.title;
    }
    
    if ( [identifier isEqual:@"image"] )
    {
        NSString* videoId = [info.watchUrl substringFromIndex: 32];
        NSString* urlStr = @"http://tn-skr4.smilevideo.jp/smile?i=";
        urlStr = [urlStr stringByAppendingString:videoId];
        
        return [[NSImage alloc] initWithContentsOfURL:[NSURL URLWithString:urlStr]];
    }
    
    if ( [identifier isEqual:@"thumbInfo"] )
    {
        return info.watchUrl;
    }
    
    return nil;
    
}

@end

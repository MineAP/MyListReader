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

@implementation AppController

-(IBAction)loadMyList:(id)sender
{
    
    MyListLoader* loader = [[MyListLoader alloc] init];
    
    myList = [loader loadMyListAndGetVideoInfos:urlInputField.stringValue];
    
    [rssItemView reloadData];
    
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

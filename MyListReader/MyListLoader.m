//
//  MyListLoader.m
//  MyListReader
//
//  Created by 白峰 圭祐 on 12/01/29.
//  Copyright (c) 2012年 MineAP. All rights reserved.
//

#import "MyListLoader.h"
#import "XMLUtil.h"
#import "MyList.h"
#import "VideoInfo.h"

@implementation MyListLoader

// 指定されたパスのマイリストを読み込み、動画情報の一覧を返します。
-(MyList*)loadMyListAndGetVideoInfos:(NSString*)myListPath
{
    
    NSXMLDocument* document = [XMLUtil loadXML:myListPath];
    
    if (!document)
    {
        return nil;
    }
    
    MyList* myList = [[MyList alloc] init];
    
    myList.title = [XMLUtil nodeForXPath:document :@"/rss/channel/title"];
    myList.link = [XMLUtil nodeForXPath:document :@"/rss/channel/link"];
    
    NSArray* titles = [document nodesForXPath:@"/rss/channel/item/title" error:NULL];
    NSArray* links = [document nodesForXPath:@"/rss/channel/item/link" error:NULL];
    
    NSMutableArray* mutableArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[titles count]; i++) {
        VideoInfo* info = [[VideoInfo alloc] init];
        
        info.title = [[titles objectAtIndex:i] stringValue];
        info.watchUrl = [[links objectAtIndex:i] stringValue];
        
        [mutableArray addObject:info];
    }
    
    myList.videoInfos = mutableArray;
    
    return myList;
    
}

@end

//
//  ThumbInfoLoader.m
//  MyListReader
//
//  Created by 白峰 圭祐 on 12/01/29.
//  Copyright (c) 2012年 MineAP. All rights reserved.
//

#import "ThumbInfoLoader.h"
#import "XMLUtil.h"

@implementation ThumbInfoLoader

// ニコニコ動画のサムネイル情報XMLを読み込んで、解析結果を返します
-(VideoInfo *)loadThumbInfo:(NSString *)path
{
    
    NSXMLDocument* document = [XMLUtil loadXML:path];
    
    if (!document)
    {
        return nil;
    }
    
    
    VideoInfo* info = [[VideoInfo alloc] init];
    
    info.videoId = [XMLUtil nodeForXPath:document :@"/nicovideo_thumb_response/thumb/video_id"];
    info.title = [XMLUtil nodeForXPath:document :@"/nicovideo_thumb_response/thumb/title"];
    info.description = [XMLUtil nodeForXPath:document :@"/nicovideo_thumb_response/thumb/description"];
    info.thumbnailUrl = [XMLUtil nodeForXPath:document :@"/nicovideo_thumb_response/thumb/thumbnail_url"];
    NSString* firstRetrieve = [XMLUtil nodeForXPath:document :@"/nicovideo_thumb_response/thumb/first_retrieve"];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssz"];
    
    info.firstRetrieve = [dateFormatter dateFromString:firstRetrieve];
    
    info.length = [XMLUtil nodeForXPath:document :@"/nicovideo_thumb_response/thumb/length"];
    info.movieType = [XMLUtil nodeForXPath:document :@"/nicovideo_thumb_response/thumb/movie_type"];
    info.sizeHigh = [[XMLUtil nodeForXPath:document :@"/nicovideo_thumb_response/thumb/size_high"] integerValue];
    info.sizeLow = [[XMLUtil nodeForXPath:document :@"/nicovideo_thumb_response/thumb/size_low"] integerValue];
    info.viewCounter = [[XMLUtil nodeForXPath:document :@"/nicovideo_thumb_response/thumb/view_counter"] integerValue];
    info.commentNum = [[XMLUtil nodeForXPath:document :@"/nicovideo_thumb_response/thumb/comment_num"] integerValue];
    info.mylistCounter = [[XMLUtil nodeForXPath:document :@"/nicovideo_thumb_response/thumb/mylist_counter"] integerValue];
    info.lastResBody = [XMLUtil nodeForXPath:document :@"/nicovideo_thumb_response/thumb/last_res_body"];
    info.watchUrl = [XMLUtil nodeForXPath:document :@"/nicovideo_thumb_response/thumb/watch_url"];
    info.thumbType = [XMLUtil nodeForXPath:document :@"/nicovideo_thumb_response/thumb/thumb_type"];
    info.embeddable = [[XMLUtil nodeForXPath:document :@"/nicovideo_thumb_response/thumb/embeddable"] integerValue];
//    [XMLUtil nodeForXPath:document :@"/nicovideo_thumb_response/thumb/no_live_play"];
    info.userId = [XMLUtil nodeForXPath:document :@"/nicovideo_thumb_response/thumb/user_id"];
    
    NSArray* tags = [document nodesForXPath:@"/nicovideo_thumb_response/thumb/tags" error:NULL];
    NSArray* tagStrs = [[NSArray alloc] init];
    
    for (NSXMLNode* node in tags) {
        [tagStrs setValue:[node stringValue]];
    }
    
    info.tags = tagStrs;
    
    return info;
}

@end

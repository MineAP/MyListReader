//
//  VideoInfo.h
//  MyListReader
//
//  Created by 白峰 圭祐 on 12/01/29.
//  Copyright (c) 2012年 MineAP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoInfo : NSObject
{
    NSString* videoId;
    NSString* title;
    NSString* description;
    NSString* thumbnailUrl;
    NSDate* firstRetrieve;
    NSString* length;
    NSString* movieType;
    NSInteger sizeHigh;
    NSInteger sizeLow;
    NSInteger viewCounter;
    NSInteger commentNum;
    NSInteger mylistCounter;
    NSString* lastResBody;
    NSString* watchUrl;
    NSString* thumbType;
    NSInteger embeddable;
    NSArray* tags;
    NSString* userId;
}
@property (retain) NSString* videoId;
@property (retain) NSString* title;
@property (retain) NSString* description;
@property (retain) NSString* thumbnailUrl;
@property (retain) NSDate* firstRetrieve;
@property (retain) NSString* length;
@property (retain) NSString* movieType;
@property NSInteger sizeHigh;
@property NSInteger sizeLow;
@property NSInteger viewCounter;
@property NSInteger commentNum;
@property NSInteger mylistCounter;
@property (retain) NSString* lastResBody;
@property (retain) NSString* watchUrl;
@property (retain) NSString* thumbType;
@property NSInteger embeddable;
@property (retain) NSArray* tags;
@property (retain) NSString* userId;

@end

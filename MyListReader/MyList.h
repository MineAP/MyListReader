//
//  MyList.h
//  MyListReader
//
//  Created by 白峰 圭祐 on 12/01/29.
//  Copyright (c) 2012年 MineAP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyList : NSObject
{
    //
    NSString* title;
    
    //
    NSString* link;
    
    // 
    NSArray* videoInfos;
}

@property (retain) NSString* title;
@property (retain) NSString* link;
@property (retain) NSArray* videoInfos;

@end

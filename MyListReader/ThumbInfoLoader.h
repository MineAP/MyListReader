//
//  ThumbInfoLoader.h
//  MyListReader
//
//  Created by 白峰 圭祐 on 12/01/29.
//  Copyright (c) 2012年 MineAP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VideoInfo.h"

@interface ThumbInfoLoader : NSObject
{
    
}
-(VideoInfo*)loadThumbInfo:(NSString*)path;
@end

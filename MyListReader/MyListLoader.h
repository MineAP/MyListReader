//
//  MyListLoader.h
//  MyListReader
//
//  Created by 白峰 圭祐 on 12/01/29.
//  Copyright (c) 2012年 MineAP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyList.h"

@interface MyListLoader : NSObject
{
    
}
-(MyList*)loadMyListAndGetVideoInfos:(NSString*)myListPath;
@end

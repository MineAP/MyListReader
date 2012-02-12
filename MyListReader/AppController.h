//
//  AppController.h
//  MyListReader
//
//  Created by 白峰 圭祐 on 12/01/29.
//  Copyright (c) 2012年 MineAP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyList.h"

@interface AppController : NSObject
{
    MyList* myList;
    
    IBOutlet NSTextField* urlInputField;
    IBOutlet NSTableView* rssItemView;
    
    
    IBOutlet NSTextField* mailInputField;
    IBOutlet NSTextField* passInputField;
    
}

- (IBAction)loadMyList:(id)sender;
- (NSString*)myListUrl;
- (void)reloadRssItemView;
@property (retain) MyList* myList;
@end

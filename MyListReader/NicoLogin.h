//
//  NicoLogin.h
//  MyListReader
//
//  Created by 白峰 圭祐 on 12/02/12.
//  Copyright (c) 2012年 MineAP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NicoLoginDelegate.h"
#import "AppController.h"

@interface NicoLogin : NSObject
{
    AppController* myAppController;
}
-(id)init:(AppController*)appController;

-(void)checkAndLogin:(NSString*)userName:(NSString*)password;
-(void)login:(NSString*)userName:(NSString*)password;
@end

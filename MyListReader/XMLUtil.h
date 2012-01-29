//
//  XMLUtil.h
//  MyListReader
//
//  Created by 白峰 圭祐 on 12/01/29.
//  Copyright (c) 2012年 MineAP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLUtil : NSObject
+(NSXMLDocument*)loadXML:(NSString*)path;
+(NSString*)nodeForXPath:(NSXMLNode*)node:(NSString*)xpath;
@end

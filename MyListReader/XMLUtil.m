//
//  XMLUtil.m
//  MyListReader
//
//  Created by 白峰 圭祐 on 12/01/29.
//  Copyright (c) 2012年 MineAP. All rights reserved.
//

#import "XMLUtil.h"

@implementation XMLUtil

+(NSXMLDocument*)loadXML:(NSString *)path
{
    NSRange range = [path rangeOfString:@"http"];
    
    NSXMLDocument* document;
    
    if (range.length == 0)
    {
        // httpではない
        NSString* xmlStr = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
        
        document = [[NSXMLDocument alloc] initWithXMLString:xmlStr options:0 error:NULL];
        
    }
    else
    {
        // http上
        path = [path stringByAppendingString:@"?rss=2.0"];
        
        NSURL* url = [NSURL URLWithString:path];
        
        document = [[NSXMLDocument alloc] initWithContentsOfURL:url options:0 error:NULL];
        
    }
    
    if (!document)
    {
        return nil;
    }
    
    return document;
}

+(NSString*)nodeForXPath:(NSXMLNode*)node:(NSString*)xpath
{
    
    NSArray* array = [node nodesForXPath:xpath error:NULL];
    
    if ([array count] != 1)
    {
        return nil;
    }
    
    NSXMLNode* newNode = [array objectAtIndex:0];
    
    return newNode.stringValue;
    
}
@end

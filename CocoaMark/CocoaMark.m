//
//  CocoaMark.m
//  CocoaMark
//
//  Created by Clemens Gruber on 14.03.15.
//  Copyright (c) 2015 Gruber Software. All rights reserved.
//

#import "CocoaMark.h"

#import "CocoaMarkDocumentProcessor.h"
#import "CocoaMarkRenderer.h"

@implementation CocoaMark

+ (NSString*)renderMarkdown:(NSString*)string
{
    CocoaMarkRenderer *renderer = [[CocoaMarkRenderer alloc] initWithFlags:0];
    CocoaMarkDocumentProcessor *documentProcessor = [[CocoaMarkDocumentProcessor alloc] initWithRenderer:renderer extensions:0 maxNesting:16];
    return [documentProcessor renderMarkdown:string];
}

@end

//
//  MarkdownTests.m
//  CocoaMark
//
//  Created by Clemens Gruber on 14.03.15.
//  Copyright (c) 2015 Gruber Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "CocoaMark.h"

@interface MarkdownTests : XCTestCase
@end

@implementation MarkdownTests

- (void)testBasicMarkdown
{
    NSString *markdown = @"*Hello* **Markdown**! `Nice meeting you`";
    NSString *goodHtml = @"<p><em>Hello</em> <strong>Markdown</strong>! <code>Nice meeting you</code></p>\n";

    NSString *renderedHtml = [CocoaMark renderMarkdown:markdown];

    XCTAssert([renderedHtml isEqualToString:goodHtml]);
}

@end

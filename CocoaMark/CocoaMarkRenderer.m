//
//  CocoaMarkRenderer.m
//  CocoaMark
//
//  Created by Clemens Gruber on 14.03.15.
//  Copyright (c) 2015 Gruber Software. All rights reserved.
//

#import "CocoaMarkRenderer.h"

#import "html.h"

static const int maxTocNesting = 16;

@implementation CocoaMarkRenderer {
    hoedown_renderer *renderer;
}

- (instancetype) initWithFlags:(int)flags
{
    self = [super init];
    if(self) {
        renderer = hoedown_html_renderer_new(flags, 0);
        // Last parameter is 0 because we do not want a TOC
        if(renderer==NULL) {
            return nil;
        }
    }
    return self;
}

- (struct hoedown_renderer *)renderer
{
    return renderer;
}

- (void)dealloc
{
    if(renderer!=NULL) {
        hoedown_html_renderer_free(renderer);
    }
    renderer = NULL;
}

@end

@implementation CocoaMarkTocRenderer {
    hoedown_renderer *renderer;
}

- (instancetype) init
{
    self = [super init];
    if(self) {
        renderer = hoedown_html_toc_renderer_new(maxTocNesting);
        if(renderer==NULL) {
            return nil;
        }
    }
    return self;
}

- (struct hoedown_renderer *)renderer
{
    return renderer;
}

- (void)dealloc
{
    if(renderer!=NULL) {
        hoedown_html_renderer_free(renderer);
    }
    renderer = NULL;
}

@end

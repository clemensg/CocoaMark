//
//  CocoaMarkDocumentProcessor.m
//  CocoaMark
//
//  Created by Clemens Gruber on 14.03.15.
//  Copyright (c) 2015 Gruber Software. All rights reserved.
//

#import "CocoaMarkDocumentProcessor.h"

#import "CocoaMarkRenderer.h"

#import "document.h"

static const int bufferGrowUnit = 1024;

@implementation CocoaMarkDocumentProcessor {
    hoedown_buffer *buffer;
    hoedown_document *document;
}

- (instancetype)initWithRenderer:(NSObject<CocoaMarkBasicRenderer>*)renderer extensions:(int)extensions maxNesting:(size_t)maxNesting
{
    self = [super init];
    if(self) {
        buffer = hoedown_buffer_new(bufferGrowUnit);
        document = hoedown_document_new(renderer.renderer, extensions, maxNesting);
        if(document==NULL) {
            return nil;
        }
        _usedRenderer = renderer;
    }
    return self;
}

- (NSString*)renderMarkdown:(NSString *)markdownString
{
    if(markdownString) {
        uint8_t *byteArray = (uint8_t*) [markdownString UTF8String];

        hoedown_document_render(document, buffer, byteArray, [markdownString length]);

        const char * const szBuffer = hoedown_buffer_cstr(buffer);
        if(szBuffer) {
            return [[NSString alloc] initWithUTF8String:szBuffer];
        }
    }
    return nil;
}

- (void)dealloc
{
    if(document!=NULL) {
        hoedown_document_free(document);
    }
    document = NULL;

    if(buffer!=NULL) {
        hoedown_buffer_free(buffer);
    }
    buffer = NULL;
}

@end

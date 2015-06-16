# CocoaMark
Simple Markdown rendering for Cocoa using hoedown under the hood

## Basic usage

```objective-c
#import "CocoaMark/CocoaMark.h"

NSString *htmlOutput = [CocoaMark renderMarkdown:@"Hello *world*!"];
```

## CocoaPods

[![Dependency Status](https://www.versioneye.com/objective-c/cocoamark/badge.svg?style=flat)](https://www.versioneye.com/objective-c/cocoamark)
<!---[![Reference Status](https://www.versioneye.com/objective-c/cocoamark/reference_badge.svg?style=flat)](https://www.versioneye.com/objective-c/fmdb/references)-->

CocoaMark can be installed using [CocoaPods](http://cocoapods.org/).

```ruby
pod 'CocoaMark'
```

## License

The code is released under the MIT License. See the LICENSE file for details.

Copyright (C) 2015, Clemens Gruber

# LLTextView

[![Version](https://img.shields.io/cocoapods/v/LLTextView.svg?style=flat)](https://cocoapods.org/pods/LLTextView)
[![License](https://img.shields.io/cocoapods/l/LLTextView.svg?style=flat)](https://cocoapods.org/pods/LLTextView)
[![Platform](https://img.shields.io/cocoapods/p/LLTextView.svg?style=flat)](https://cocoapods.org/pods/LLTextView)

## Features
- [x] 支持 设置最大输入字符串长度 <span style="color:blue"> maxStringLength </span>.
- [x] 支持 <span style="color:blue"> placeholder </span> 和 <span style="color:blue"> placeholderColor </span>

## Installation

只需将以下行添加到您的 **Podfile**

```ruby
pod 'LLTextView'
```
## ScreenShot
<div align = "center"> 
<img src="ScreenShot/IMG_0086.JPG" width="200" />
<img src="ScreenShot/IMG_0089.JPG" width="200" />
<img src="ScreenShot/IMG_0087.JPG" width="200" />
<img src="ScreenShot/IMG_0088.JPG" width="200" />
</div>

## Usage

在使用的文件中导入头文件

```objective-c
#import "LLTextView.h"

```

```objective-c
LLTextView *textView = [LLTextView new];
textView.placeHolder = @"请输入字符串";
textView.placeHolderColor = [UIColor lightGrayColor];
textView.maxStingLength = 50;

```

## License

LLTextView is available under the MIT license. See the LICENSE file for more info.



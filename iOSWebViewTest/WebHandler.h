//
//  WebHandler.h
//  iOSWebViewTest
//
//  Created by SeungWon Kim on H27/12/19.
//  Copyright © 平成27年 SEUNGWON KIM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface WebHandler : NSObject

- (id)webView;
- (void)layout:(CGRect)frame;
- (void)setDelegate:(id)delegate;
- (void)clean;

// Load
- (void)loadRequest:(NSURLRequest *)request;
- (void)loadURL:(NSString *)url;
- (void)stopLoading;

// Web history
- (void)goBack;
- (void)goForward;
- (BOOL)canGoBack;
- (BOOL)canGoForward;
- (BOOL)isLoading;

// JavaScript
- (void)stringByEvaluatingJavaScriptFromString:(NSString *)javascript;

// Info
- (NSString *)title;
- (NSURL *)URL;
@end

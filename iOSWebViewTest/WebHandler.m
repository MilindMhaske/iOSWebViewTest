//
//  WebHandler.m
//  iOSWebViewTest
//
//  Created by SeungWon Kim on H27/12/19.
//  Copyright © 平成27年 SEUNGWON KIM. All rights reserved.
//

#import "WebHandler.h"

@interface WebHandler()

@property (nonatomic) UIWebView *uiwebView;
@property (nonatomic) WKWebView *wkwebView;
@property (nonatomic) BOOL ios8;

@end

@implementation WebHandler

- (id)init {
    if (self = [super init]) {
        self.ios8 = [WKWebView class] != nil;
        if (self.ios8) {
            self.wkwebView = [[WKWebView alloc] init];
        }else {
            self.uiwebView = [[UIWebView alloc] init];
        }
    }
    return self;
}

- (id)webView {
    if (self.ios8) {
        return self.wkwebView;
    }
    return self.uiwebView;
}

- (void)layout:(CGRect)frame {
    if (self.ios8) {
        self.wkwebView.frame = frame;
        
    }
    else {
        self.uiwebView.frame = frame;
    }
}

- (void)setDelegate:(id)delegate {  // This is for Navigation Delegate
    if (self.ios8) {
        self.wkwebView.navigationDelegate = delegate;
    }
    else {
        self.uiwebView.delegate = delegate;
    }
}

- (void)setUIDelegate:(id)delegate {  // This is for only ios8
    if (self.ios8) {
        self.wkwebView.UIDelegate = delegate;
    }
}

- (void)clean {
    if (self.ios8) {
        self.wkwebView.navigationDelegate = nil;
    }
    else {
        self.uiwebView.delegate = nil;
    }
    
    if ([self isLoading]) {
        [self stopLoading];
    }
}


#pragma mark - Common Features

/*
 * Load
 */
- (void)loadRequest:(NSURLRequest *)request {
    if (self.ios8) {
        [self.wkwebView loadRequest:request];
    }
    else {
        [self.uiwebView loadRequest:request];
    }
}

- (void)loadURL:(NSString *)url {
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

- (void)stopLoading {
    if (self.ios8) {
        [self.wkwebView stopLoading];
    }
    else {
        [self.uiwebView stopLoading];
    }
}

/*
 *  History
 */
- (void)goBack {
    if (self.ios8) {
        [self.wkwebView goBack];
    }
    else {
        [self.uiwebView goBack];
    }
}

- (void)goForward {
    if (self.ios8) {
        [self.wkwebView goForward];
    }
    else {
        [self.uiwebView goForward];
    }
}

- (BOOL)canGoBack {
    if (self.ios8) {
        return [self.wkwebView canGoBack];
    }
    else {
        return [self.uiwebView canGoBack];
    }
}

- (BOOL)canGoForward {
    if (self.ios8) {
        return [self.wkwebView canGoForward];
    }
    else {
        return [self.uiwebView canGoForward];
    }
}

- (BOOL)isLoading {
    if (self.ios8) {
        return [self.wkwebView isLoading];
    }
    else {
        return [self.uiwebView isLoading];
    }
}

// goToBackForwardListItem is only for iOS8 WKWebView

#pragma mark - JavaScript
- (void)stringByEvaluatingJavaScriptFromString:(NSString *)javascript {
    if (self.ios8) {
        [self.wkwebView evaluateJavaScript:javascript completionHandler:nil];
    }
    else {
        [self.uiwebView stringByEvaluatingJavaScriptFromString:javascript];
    }
}


#pragma mark - Info
/*
 * Info
 */
- (NSString *)title {
    if (self.ios8) {
        return [self.wkwebView title];
    }
    else {
        return [self.webView title];
    }
}

- (NSURL *)URL {
    if (self.ios8) {
        return [self.wkwebView URL];
    }
    else {
        return [self.webView URL];
    }
}
@end

//
//  ViewController.m
//  iOSWebViewTest
//
//  Created by SeungWon Kim on H27/12/15.
//  Copyright © 平成27年 SEUNGWON KIM. All rights reserved.
//

#import "ViewController.h"
#import "UIHeaderView.h"
#import "UIFooterView.h"
#import "WebHandler.h"

#define kHEADERHEIGHT 44
#define kFOOTERHEIGHT 44

@interface ViewController ()

@property (nonatomic) WebHandler *webhandler;
@property (nonatomic) UIHeaderView *header;
@property (nonatomic) UIFooterView *footer;
@property (nonatomic) int webCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Web
    self.webhandler = [[WebHandler alloc] init];
    [self.webhandler setDelegate:self];
    
    self.webCount = 0;
    
    // Header
    self.header = [[UIHeaderView alloc] init];
    
    // Footer
    self.footer = [[UIFooterView alloc] init];
    [self.footer.backButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.footer.forwardButton addTarget:self action:@selector(forwardClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.header];
    [self.view addSubview:self.webhandler.webView];
    [self.view addSubview:self.footer];
    
    [self.webhandler loadURL:@"http://google.com.sg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    if (self.isViewLoaded && [self.view window] == nil) {
        [self dispose];
        self.view = nil;
    }
}

- (void)dealloc {
    [self dispose];
}

- (void)dispose {
    if (self.webhandler != nil) {
        [self.webhandler clean];
    }
}

- (void) viewWillLayoutSubviews {
    
    // Calculate layout
    CGRect viewRect = self.view.frame;
    self.header.frame = CGRectMake(viewRect.origin.x,
                                   viewRect.origin.y,
                                   viewRect.size.width,
                                   kHEADERHEIGHT);
    [self.webhandler layout:CGRectMake(viewRect.origin.x,
                                       viewRect.origin.y + kHEADERHEIGHT,
                                       viewRect.size.width,
                                       viewRect.size.height - kHEADERHEIGHT - kFOOTERHEIGHT)];
    
    self.footer.frame = CGRectMake(viewRect.origin.x,
                                   viewRect.origin.y + viewRect.size.height - kFOOTERHEIGHT,
                                   viewRect.size.width,
                                   kFOOTERHEIGHT);
    
}

#pragma mark - UIWebViewDelegate(iOS7)
- (void)webViewDidStartLoad:(UIWebView *)webView {
    // Start Loading
    NSLog(@"Start iOS7");
    self.webCount++;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.webCount--;
    if (self.webCount == 0) {
        NSLog(@"Finish iOS7");
        [self.header.titleLabel setText:[self.webhandler title]];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"Erorr iOS7");
}

#pragma mark - WKWebViewDelegate(iOS8)
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"Start iOS8");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self.header.titleLabel setText:[self.webhandler title]];
    NSLog(@"title %@", [self.webhandler title]);
    NSLog(@"Finish iOS8");
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"Error iOS8");
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"Error iOS8");
}

#pragma mark - Button Click
- (void)backClick:(id)sender {
    if ([self.webhandler canGoBack]) {
        [self.webhandler goBack];
    }
}

- (void)forwardClick:(id)sender {
    if ([self.webhandler canGoForward]) {
        [self.webhandler goForward];
    }
}

@end

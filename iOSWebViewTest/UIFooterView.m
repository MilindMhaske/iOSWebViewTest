//
//  UIFooterView.m
//  iOSWebViewTest
//
//  Created by SeungWon Kim on H27/12/19.
//  Copyright © 平成27年 SEUNGWON KIM. All rights reserved.
//

#import "UIFooterView.h"

#define kBUTTONSIZE 100

@implementation UIFooterView


- (id)init {
    if(self = [super init]) {
        [self setBackgroundColor:[UIColor grayColor]];
        self.backButton = [[UIButton alloc] init];
        [self.backButton setTitle:@"Back" forState:UIControlStateNormal];
        [self.backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        self.forwardButton = [[UIButton alloc] init];
        [self.forwardButton setTitle:@"Forward" forState:UIControlStateNormal];
        [self.forwardButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        [self addSubview:self.backButton];
        [self addSubview:self.forwardButton];
    }
    return self;
}

- (void)layoutSubviews {
    CGRect viewRect = self.frame;
    self.backButton.frame = CGRectMake(0, 0, kBUTTONSIZE, viewRect.size.height);
    self.forwardButton.frame = CGRectMake(0 + kBUTTONSIZE + 10, 0, kBUTTONSIZE, viewRect.size.height);
}

@end

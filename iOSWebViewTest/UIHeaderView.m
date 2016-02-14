//
//  UIHeaderView.m
//  iOSWebViewTest
//
//  Created by SeungWon Kim on H27/12/19.
//  Copyright © 平成27年 SEUNGWON KIM. All rights reserved.
//

#import "UIHeaderView.h"

@implementation UIHeaderView

- (id)init {
    if(self = [super init]) {
        [self setBackgroundColor:[UIColor grayColor]];
        
        self.titleLabel = [[UILabel alloc] init];
        [self.titleLabel setTextColor:[UIColor whiteColor]];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    self.titleLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

@end

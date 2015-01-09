//
//  BaseTableViewCell.m
//  AddressBookTest
//
//  Created by Samuel Colak on 09/01/15.
//  Copyright (c) 2015 AppShopBoys BV. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface BaseTableViewCell () {
    
    BOOL                        _init;
    
}

@end

@implementation BaseTableViewCell

    @synthesize delegate;

    - (void) setFrame:(CGRect)frame
    {
        CGRect _rect = self.frame;
        [super setFrame:frame];
        if (!CGSizeEqualToSize(_rect.size, frame.size)) {
            [self setNeedsLayout];
        }
    }

    - (void) layoutSubviews
    {
        
        [super layoutSubviews];
        
        [self layoutSubviews:_init];
        
        if (_init) {
            _init = NO;
        }
        
        if (delegate && [delegate respondsToSelector:@selector(cellDidUpdateLayout:)]) {
            [delegate cellDidUpdateLayout:self];
        }
        
    }

    - (void) layoutSubviews:(BOOL)init
    {
        
    }

    - (void) setup
    {
        _init = YES;
        
        [self setNeedsLayout];
    }

    - (void) refresh
    {
        
    }

    - (void) awakeFromNib
    {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
    }

    - (id) init
    {
        self = [super init];
        if (self) {
            [self setup];
        }
        return self;
    }

    - (id) initWithCoder:(NSCoder *)aDecoder
    {
        self = [super initWithCoder:aDecoder];
        if (self) {
            [self setup];
        }
        return self;
    }

    - (id) initWithFrame:(CGRect)frame
    {
        self = [super initWithFrame:frame];
        if (self) {
            [self setup];
        }
        return self;
    }

@end

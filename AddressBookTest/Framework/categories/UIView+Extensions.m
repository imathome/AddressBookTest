//
//  UIView+Extensions.m
//  AddressBookTest
//
//  Created by Samuel Colak on 09/01/15.
//  Copyright (c) 2015 AppShopBoys BV. All rights reserved.
//

#import "UIView+Extensions.h"

@implementation UIView (Extensions)

    - (CGFloat) getCornerRadius
    {
        return self.layer.cornerRadius;
    }

    - (void) setCornerRadius:(CGFloat)cornerRadius
    {
        if (cornerRadius > 0) {
            self.layer.cornerRadius = cornerRadius;
            self.layer.masksToBounds = YES;
        } else {
            self.layer.cornerRadius = 0;
            self.layer.masksToBounds = NO;
        }
    }

@end

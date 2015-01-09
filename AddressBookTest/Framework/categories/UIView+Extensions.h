//
//  UIView+Extensions.h
//  AddressBookTest
//
//  Created by Samuel Colak on 09/01/15.
//  Copyright (c) 2015 AppShopBoys BV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extensions)

    @property (nonatomic, assign, setter = setCornerRadius:, getter = getCornerRadius) CGFloat cornerRadius;

@end

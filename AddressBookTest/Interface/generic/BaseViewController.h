//
//  BaseViewController.h
//  AddressBookTest
//
//  Created by Samuel Colak on 09/01/15.
//  Copyright (c) 2015 AppShopBoys BV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface BaseViewController : UIViewController


    @property (nonatomic, readonly, getter=getAppDelegate) AppDelegate *appDelegate;

    - (void) setup;


@end

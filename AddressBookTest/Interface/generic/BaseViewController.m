//
//  BaseViewController.m
//  AddressBookTest
//
//  Created by Samuel Colak on 09/01/15.
//  Copyright (c) 2015 AppShopBoys BV. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

    - (AppDelegate *) getAppDelegate
    {
        return (AppDelegate*) [[UIApplication sharedApplication] delegate];
    }

    - (void) setup
    {
        
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

    - (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
    {
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        if (self) {
            [self setup];
        }
        return self;
    }


@end

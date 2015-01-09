//
//  ShowABViewController.m
//  AddressBookTest
//
//  Created by Samuel Colak on 09/01/15.
//  Copyright (c) 2015 AppShopBoys BV. All rights reserved.
//

#import "ShowABViewController.h"

@interface ShowABViewController () <UITableViewDataSource, UITableViewDelegate, UICellDelegate> {
    
    NSArray                     *_contacts;
    ABAddressBookRef            _addressBook;
    BOOL                        _canAccessAddressBook;
    
}

@end

@implementation ShowABViewController

    - (void) cellDidUpdateLayout:(UITableViewCell*)sender
    {
        NSIndexPath *_indexPath = [_tableViewContacts indexPathForCell:sender];
        sender.backgroundColor = ((_indexPath.row % 2) == 0)?[UIColor clearColor]:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.02];
    }

    - (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
    {
        return 1;
    }

    - (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        UITableViewCell *_cellOut = nil;
        
        ABRecordRef _person = (__bridge ABRecordRef)([_contacts objectAtIndex:indexPath.row]);
        
        ContactCell *_cell = [tableView dequeueReusableCellWithIdentifier:@"cellContact" forIndexPath:indexPath];
        
        _cell.contact = _person;
        _cell.delegate = self;
        
        _cellOut = _cell;

        return _cellOut;
        
    }

    - (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
        return _contacts.count;
    }

    - (void) viewDidLoad
    {
        [super viewDidLoad];
        [_tableViewContacts registerNib:[UINib nibWithNibName:@"ContactCell" bundle:nil] forCellReuseIdentifier:@"cellContact"];
    }

    - (void) reloadData
    {
        if (_canAccessAddressBook) {
     
            ABRecordRef _source = ABAddressBookCopyDefaultSource(_addressBook);
            _contacts = (__bridge_transfer NSArray*) ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering(_addressBook, _source, kABPersonSortByFirstName);

        }
    }

    - (void) setup
    {
        
        _contacts = nil;
        _canAccessAddressBook = NO;
        _addressBook =  ABAddressBookCreateWithOptions(NULL, NULL);

    }

    - (void) viewDidAppear:(BOOL)animated
    {
        
        [super viewDidAppear:animated];
        
        if (ABAddressBookRequestAccessWithCompletion != nil) { // we're on iOS 6
            
            ABAuthorizationStatus _abStatus = ABAddressBookGetAuthorizationStatus();
            
            switch (_abStatus) {
                
                case kABAuthorizationStatusNotDetermined: {
                    
                    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
                    
                    ABAddressBookRequestAccessWithCompletion(_addressBook, ^(bool granted, CFErrorRef error) {
                        if (granted) {
                            _canAccessAddressBook = YES;
                            [self performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
                        }
                        dispatch_semaphore_signal(sema);
                            
                    });
                    
                    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
                    
                    break;
                }
                
                case kABAuthorizationStatusRestricted:
                case kABAuthorizationStatusDenied: {
                    _canAccessAddressBook = NO;
                    break;
                }
                
                case kABAuthorizationStatusAuthorized: {
                    _canAccessAddressBook = YES;
                    [self reloadData];
                    break;
                }
                
                default:
                break;
            }
            
        } else { // we're on iOS 5 or older
            
            [self reloadData];
            
        }
        
    }

    - (void) viewWillAppear:(BOOL)animated
    {
        [super viewWillAppear:animated];
     
        if (ABAddressBookRequestAccessWithCompletion != nil) { // we're on iOS 6
            
            ABAuthorizationStatus _abStatus = ABAddressBookGetAuthorizationStatus();
            
            switch (_abStatus) {

                case kABAuthorizationStatusAuthorized: {
                    _canAccessAddressBook = YES;
                    [self reloadData];
                    break;
                }
                
                default: {
                    // this is going to be dealt with when the view appears..
                    break;
                }
            }
            
        } else {
            
            [self reloadData];
            
        }
        
    }

@end
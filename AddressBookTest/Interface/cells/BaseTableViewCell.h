//
//  BaseTableViewCell.h
//  AddressBookTest
//
//  Created by Samuel Colak on 09/01/15.
//  Copyright (c) 2015 AppShopBoys BV. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UICellDelegate <NSObject>

@optional

- (void) cellDidUpdateLayout:(id)sender;

@end

@interface BaseTableViewCell : UITableViewCell

    @property (nonatomic, assign) IBOutlet id<UICellDelegate> delegate;

    - (void) setup;
    - (void) layoutSubviews:(BOOL)init;

@end

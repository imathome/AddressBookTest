//
//  ContactCell.h
//  AddressBookTest
//
//  Created by Samuel Colak on 09/01/15.
//  Copyright (c) 2015 AppShopBoys BV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewCell.h"

@interface ContactCell : BaseTableViewCell {
    
    IBOutlet UILabel        *_labelContactName;
    IBOutlet UIImageView    *_imageViewAvatar;
    
}

    @property (nonatomic, assign, setter=setContact:) ABRecordRef contact;

@end

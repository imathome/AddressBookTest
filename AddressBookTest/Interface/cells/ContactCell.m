//
//  ContactCell.m
//  AddressBookTest
//
//  Created by Samuel Colak on 09/01/15.
//  Copyright (c) 2015 AppShopBoys BV. All rights reserved.
//

#import "ContactCell.h"

@interface ContactCell () {
    
    ABRecordRef         _contact;
    
}

@end

@implementation ContactCell

    @synthesize contact=_contact;

    - (void) setContact:(ABRecordRef)contact
    {
        _contact = contact;
        [self setNeedsLayout];
    }

    - (void) layoutSubviews:(BOOL)init
    {
        
        [super layoutSubviews:init];
        
        NSString *_firstname = (__bridge NSString *)(ABRecordCopyValue(_contact, kABPersonFirstNameProperty));
        
        NSString *_lastname = (__bridge NSString *)(ABRecordCopyValue(_contact, kABPersonLastNameProperty));
        
        NSString *_companyname = (__bridge NSString *)(ABRecordCopyValue(_contact, kABPersonOrganizationProperty));
        
        NSData *_thumbNailData = nil;
        UIImage *_imageOut = nil;
        
        if (ABPersonHasImageData(_contact)) {
            _thumbNailData = CFBridgingRelease(ABPersonCopyImageDataWithFormat(_contact, kABPersonImageFormatThumbnail));
            _imageOut = [UIImage imageWithData:_thumbNailData];
        }
        
        if (_companyname) {
            if ((!_firstname) && (!_lastname)) {
                _labelContactName.text = [NSString stringWithFormat:@"%@", _companyname];
            } else {
                if (_firstname && _lastname) {
                    _labelContactName.text = [NSString stringWithFormat:@"%@ %@ / %@", _firstname, _lastname, _companyname];
                } else if (_firstname) {
                    _labelContactName.text = [NSString stringWithFormat:@"%@ / %@", _firstname, _companyname];
                } else {
                    _labelContactName.text = [NSString stringWithFormat:@"%@ / %@", _lastname, _companyname];
                }
            }
        } else {
            if (_firstname && _lastname) {
                _labelContactName.text = [NSString stringWithFormat:@"%@ %@", _firstname, _lastname];
            } else if (_firstname) {
                _labelContactName.text = [NSString stringWithFormat:@"%@", _firstname];
            } else {
                _labelContactName.text = [NSString stringWithFormat:@"%@", _lastname];
            }
        }
        
        if (!_imageOut) {
            _imageViewAvatar.image = _companyname ? [UIImage imageNamed:@"tool_company.png"] : [UIImage imageNamed:@"tool_contact.png"];
            _imageViewAvatar.cornerRadius = 0.0f;
        } else {
            _imageViewAvatar.image = _imageOut;
            _imageViewAvatar.cornerRadius = 15.0f;
        }
        
    }

    - (void) prepareForReuse
    {
        
        [super prepareForReuse];
        
        _imageViewAvatar.image = nil;
        _contact = nil;
        
    }

    - (void) setup
    {
        
        [super setup];
        
    }


@end

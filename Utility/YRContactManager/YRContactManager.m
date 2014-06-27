//
//  YRContactManager.m
//  iCareer
//
//  Created by YANGRui on 14-4-11.
//  Copyright (c) 2014年 LJLD. All rights reserved.
//

#import "YRContactManager.h"
#import <AddressBook/AddressBook.h>
@implementation YRContactManager


+ (NSArray *)getAllContact
{

    NSMutableArray *contacts = [NSMutableArray array];
    CFErrorRef error = NULL;
   
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(nil,&error);
    if (error)
    {
        return nil;
    }
    ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error)
                                             {
                                             });
    
   // NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    CFArrayRef results = ABAddressBookCopyArrayOfAllPeople(addressBook);
    if (results == nil)
    {
        
        return nil;
    }
    for(long i = 0; i < CFArrayGetCount(results); i++)
    {
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        ABRecordRef person = CFArrayGetValueAtIndex(results, i);
        NSString *firstName = (__bridge NSString*)ABRecordCopyValue(person, kABPersonFirstNameProperty);
        if (firstName == nil)
        {
            firstName = @"";
        }
        NSString *lastname = (__bridge NSString*)ABRecordCopyValue(person, kABPersonLastNameProperty);
        if (lastname == nil)
        {
            lastname = @"未知姓名";
        }
        NSString *fullName = [NSString stringWithFormat:@"%@%@",lastname,firstName];
        [dictionary setObject:fullName forKey:@"name"];
        
        ABMultiValueRef phones = (ABMultiValueRef) ABRecordCopyValue(person, kABPersonPhoneProperty);
        // NSString *phone = (__bridge NSString *)ABMultiValueCopyValueAtIndex(phones, 0);
        NSArray *phonesArr = (__bridge NSArray *)ABMultiValueCopyArrayOfAllValues(phones);
        if (phonesArr == nil)
        {
            phonesArr = [NSArray array];
        }
        [dictionary setObject:phonesArr forKey:@"phone"];
        
        if(ABPersonHasImageData(person))
        {
            NSData * imageData = (__bridge NSData *)ABPersonCopyImageDataWithFormat(person,kABPersonImageFormatThumbnail);
            UIImage * image = [[UIImage alloc] initWithData:imageData];
            [dictionary setObject:image forKey:@"avatar"];
        }
        else
        {
            [dictionary setObject:[UIImage imageNamed:@"头像.png"] forKey:@"avatar"];
        }
        
        [contacts addObject:dictionary];
    }
    return contacts;
}


#pragma mark -Access contacts

typedef void(^ABAddressBookRequestAccessCompletionHandler)(bool granted, CFErrorRef error);
AB_EXTERN void ABAddressBookRequestAccessWithCompletion(ABAddressBookRef addressBook,  ABAddressBookRequestAccessCompletionHandler completion) __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);


@end

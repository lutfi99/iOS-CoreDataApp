//
//  Register.h
//  Poto
//
//  Created by Hendra Nicholas on 9/3/13.
//  Copyright (c) 2013 Hendra Nicholas. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>

@interface Register : NSManagedObject

@property (nonatomic, retain) NSData *pic;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *phone;


@end

//
//  HalamanMain.h
//  Poto
//
//  Created by Hendra Nicholas on 8/24/13.
//  Copyright (c) 2013 Hendra Nicholas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HalamanMain : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
- (IBAction)buttonRegister:(UIButton *)sender;
- (IBAction)buttonSignIn:(UIButton *)sender;

@end

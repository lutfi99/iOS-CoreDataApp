//
//  RegisterFormViewController.h
//  Poto
//
//  Created by Hendra Nicholas on 9/10/13.
//  Copyright (c) 2013 Hendra Nicholas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Register.h"

@interface RegisterFormViewController : UITableViewController <UINavigationControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) Register *registerClass;

@property (strong, nonatomic) IBOutlet UIImageView *pic;
@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *emailField;
@property (strong, nonatomic) IBOutlet UITextField *phoneField;
- (IBAction)saveButton:(UIBarButtonItem *)sender;
@end

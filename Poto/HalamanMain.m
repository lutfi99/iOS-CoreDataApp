//
//  HalamanMain.m
//  Poto
//
//  Created by Hendra Nicholas on 8/24/13.
//  Copyright (c) 2013 Hendra Nicholas. All rights reserved.
//

#import "HalamanMain.h"
#import "CoreDataHelper.h"
#import "RegisterFormViewController.h"
#import "Profile.h"

@interface HalamanMain ()

@end

@implementation HalamanMain

@synthesize managedObjectContext;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog(@"KONTEKKKKKKKK %@", managedObjectContext);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonRegister:(UIButton *)sender {
   // [self performSegueWithIdentifier:@"RegisSegue" sender:sender];
}

- (IBAction)buttonSignIn:(UIButton *)sender {
    [self showAlert];
}

- (void) showAlert {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:nil message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Login",nil];
    /*
    UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(16,83,252,25)];
    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.keyboardAppearance = UIKeyboardAppearanceAlert;
    textField1.delegate = self;
    [alert addSubview:textField1];
    
    UITextField *textField2 = [[UITextField alloc] initWithFrame:CGRectMake(16,112,252,25)];
    textField2.placeholder = @"Password";
    textField2.borderStyle = UITextBorderStyleRoundedRect;
    textField2.keyboardAppearance = UIKeyboardAppearanceAlert;
    textField2.delegate = self;
    [alert addSubview:textField2];*/
    
    [alert setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    [alert show];
    //[alert release];
}


//input username lebih dari 10 digit
- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    NSString *inputText = [[alertView textFieldAtIndex:0] text];
    if( [inputText length] >= 1 )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Login"])
    {
        //UITextField *name = [self.device valueForKey:@"username"];
        UITextField *username = [alertView textFieldAtIndex:0];
        UITextField *password = [alertView textFieldAtIndex:1];
        
        NSLog(@"Username: %@\nPassword: %@", [username text], [password text]);
        
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"(username == %@ && password == %@)", [username text], [password text]];
        
        if ([CoreDataHelper countForEntity:@"Register" withPredicate:pred andContext:managedObjectContext] > 0){
            NSLog(@"LOGIN BERHASIL");
            Profile *profile = [[Profile alloc] init];
            [self.navigationController pushViewController:profile animated:YES];
        }else{
            NSLog(@"GAGAL");
        }
        
        /*username.tag = 1;
        password.tag = 2;
        
        UITextField *tf = (UITextField *)sender;
        
        if(username){
            [username becomeFirstResponder];
        } else {
            [password resignFirstResponder];
        }*/
        
      //  NSPredicate *pred = [NSPredicate predicateWithFormat:@"(username == %@ && password == %@)", [username text], [password text]];
        
      //  if ([CoreDataHelper countForEntity:@"Register" withPredicate:pred andContext:managedObjectContext] > 0){
      //      NSLog(@"MASUUUK !");
      //  }
      //  else{
      //      [password setText:@""];
       // }
        
        /*CoreDataAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        
        NSEntityDescription *entityDesc =
        [NSEntityDescription entityForName:@"Register"
                    inManagedObjectContext:context];
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        [request setEntity:entityDesc];
        
        NSPredicate *pred =
        [NSPredicate predicateWithFormat:@"(name = %@)",
         username.text];
        [request setPredicate:pred];
        NSManagedObject *matches = nil;
        
        NSError *error;
        NSArray *objects = [context executeFetchRequest:request
                                                  error:&error];
        
        if ([objects count] == 0) {
            NSLOG(@"no matches");
        } else {
            matches = objects[0];
            UITextField *nama = [self.devices valueForKey:@"username"];
            NSLog(@"nama yg diambil adalah .. %@", nama.text);*/
        
    }
}

/*-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    TimelineViewController *timelineView = segue.destinationViewController;
    NSLog(@"segue yg disiapkan: %@", segue.identifier);
    
    if([segue.identifier isEqualToString:@"timeline"]){
        timelineView.userName = @"tess";
    }
}*/

/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        NSIndexPath *indexPath = [self.view indexPathForSelectedRow];
        TimelineViewController *destViewController = segue.destinationViewController;
        destViewController.userName = [recipes objectAtIndex:indexPath.row];
    }
}*/


/*
 //lempar managed object context
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UINavigationController *navController = (UINavigationController *)[segue destinationViewController];
    RegisterFormViewController *regis = (RegisterFormViewController *)[[navController viewControllers] lastObject];
    regis.managedObjectContext = managedObjectContext;
}
*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"RegisSegue"]) {
        RegisterFormViewController *navController = (RegisterFormViewController *)[segue destinationViewController];
        //RegisterFormViewController *regis = (RegisterFormViewController *)[[navController viewControllers] lastObject];
        navController.managedObjectContext = managedObjectContext;
    }
}
@end

//
//  LTAppDelegate.h
//  Poto
//
//  Created by Hendra Nicholas on 8/24/13.
//  Copyright (c) 2013 Hendra Nicholas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

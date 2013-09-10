//
//  CoreDataHelper.m
//  Poto
//
//  Created by Hendra Nicholas on 9/3/13.
//  Copyright (c) 2013 Hendra Nicholas. All rights reserved.
//

#import "CoreDataHelper.h"

@implementation CoreDataHelper

#pragma mark - Retrieve objects

//fetch objects with a predicate
+(NSMutableArray *)searchObjectsForEntity:(NSString *)entityName withPredicate:(NSPredicate *)predicate andSortKey:(NSString *)sortKey andSortAscending:(BOOL)sortAscending andContext:(NSManagedObjectContext *)managedObjectContext
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:managedObjectContext];
    [request setEntity:entity];
    
    if(predicate != nil)
        [request setPredicate:predicate];
    
    if(sortKey != nil) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:sortKey ascending:sortAscending];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        [request setSortDescriptors:sortDescriptors];
    }
    
    //execute the fetch request
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    
    if (mutableFetchResults == nil)
        NSLog(@"Couldn't get objects for entity %@", entityName);
    
    return mutableFetchResults;
}

//fetch objects without a predicate
+(NSMutableArray *)getObjectsForEntity:(NSString *)entityName withSortKey:(NSString *)sortKey andSortAscending:(BOOL)sortAscending andContext:(NSManagedObjectContext *)managedObjectContext
{
    return [self searchObjectsForEntity:entityName withPredicate:nil andSortKey:sortKey andSortAscending:sortAscending andContext:managedObjectContext];
}

#pragma mark - Count objects

//get a count for an entity with a predicate
+(NSUInteger)countForEntity:(NSString *)entityName withPredicate:(NSPredicate *)predicate andContext:(NSManagedObjectContext *)managedObjectContext
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:managedObjectContext];
    [request setEntity:entity];
    [request setIncludesPropertyValues:NO];
    
    if (predicate != nil)
        [request setPredicate:predicate];
    
    NSError *error = nil;
    NSUInteger count = [managedObjectContext countForFetchRequest:request error:&error];
    
    if(count == NSNotFound)
        NSLog(@"Couldn't get count for entity %@", entityName);
    
    return count;
}

//get count fot an entity without a predicate
+(NSUInteger)countForEntity:(NSString *)entityName andContext:(NSManagedObjectContext *)managedObjectContext
{
    return [self countForEntity:entityName withPredicate:nil andContext:managedObjectContext];
}

#pragma mark - Delete Objects

//Delete all objects for a given entity
+(BOOL)deleteAllObjectsForEntity:(NSString*)entityName withPredicate:(NSPredicate*)predicate andContext:(NSManagedObjectContext *)managedObjectContext
{
	// Create fetch request
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:managedObjectContext];
	[request setEntity:entity];
    
	// Ignore property values for maximum performance
	[request setIncludesPropertyValues:NO];
    
	// If a predicate was specified then use it in the request
	if (predicate != nil)
		[request setPredicate:predicate];
    
	// Execute the count request
	NSError *error = nil;
	NSArray *fetchResults = [managedObjectContext executeFetchRequest:request error:&error];
    
	// Delete the objects returned if the results weren't nil
	if (fetchResults != nil) {
		for (NSManagedObject *manObj in fetchResults) {
			[managedObjectContext deleteObject:manObj];
		}
	} else {
		NSLog(@"Couldn't delete objects for entity %@", entityName);
		return NO;
	}
    
	return YES;	
}

+(BOOL)deleteAllObjectsForEntity:(NSString *)entityName andContext:(NSManagedObjectContext *)managedObjectContext
{
    return [self deleteAllObjectsForEntity:entityName withPredicate:nil andContext:managedObjectContext];
}

@end
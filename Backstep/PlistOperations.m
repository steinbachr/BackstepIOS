/*
 Current Plist Keys:
 * finder_id
 * item_json
 * attempt_ids
 
 */

#import "PlistOperations.h"

@implementation PlistOperations

+ (NSString *) pListPath
{
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *plistPath = [rootPath stringByAppendingPathComponent:@"Data.plist"];
    
    return plistPath;
}

+ (void) writeToPlist:(NSArray *)vals keys:(NSArray *)keys doAppend:(BOOL)doAppend
{
    NSString *error;
    NSString *plistPath = [PlistOperations pListPath];
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects: vals forKeys:keys];
    NSMutableDictionary *dictCopy = [plistDict mutableCopy];
    
    if (doAppend) {
        NSDictionary *prevContents = [PlistOperations openPlist];
        for(id key in prevContents) {
            // make sure we don't override the new data (given by dictCopy) with the old data (given by prevContents)
            if (![dictCopy objectForKey:key]) {
                [dictCopy setObject:[prevContents objectForKey:key] forKey:key];
            }
        }
    }
    
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:dictCopy
                                                                   format:NSPropertyListXMLFormat_v1_0
                                                         errorDescription:&error];
    
    if (plistData) {
        [plistData writeToFile:plistPath atomically:YES];
    }
}

+ (NSDictionary *) openPlist
{
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *plistPath = [PlistOperations pListPath];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    }
    
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization
                                          propertyListFromData:plistXML
                                          mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                          format:&format
                                          errorDescription:&errorDesc];
    
    return temp;
}

+ (void) deletePlist
{
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtPath:[PlistOperations pListPath] error:&error];
}

+ (NSString *) plistVal:(NSString *)key
{
    NSDictionary *plist = [PlistOperations openPlist];
    return [plist objectForKey:key];
}



/**-- Specific Methods --**/
+ (NSString *) getFinderId
{
    return [PlistOperations plistVal:@"finder_id"];
}

+ (LostItem *) getLostItem
{
    NSString *json = [PlistOperations plistVal:@"item_json"];
    NSError* err = nil;
    LostItem *item = [[LostItem alloc] initWithString:json error:&err];
    
    return item;
}

+ (NSString *) getLostItemId
{
    LostItem *lostItem = [PlistOperations getLostItem];
    return lostItem.id;
}

// get the comma separated list of found item ids which represent those items which the user has made attempts on
+ (NSString *)getFoundItemAttempts
{
    NSString *attempts = [PlistOperations plistVal:@"attempt_ids"];
    return attempts;
}

@end

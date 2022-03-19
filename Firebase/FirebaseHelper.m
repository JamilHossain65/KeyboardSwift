//
//  FirebaseHelper.m
//  SmartKeyboard
//
//  Created by Jamil on 12/12/20.
//  Copyright © 2020 Jamil Hossain. All rights reserved.
//

#import "FirebaseHelper.h"

#import <UIKit/UIKit.h>
#import "Utility.h"

@import Firebase;

@implementation FirebaseHelper


+ (id)sharedInstance {
    static FirebaseHelper *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    
    //[FIRApp configure];
    
    return sharedManager;
}

-(void)initialize {
    [FIRApp configure];
}

-(void)addUserDataToDatabase:(NSString*)device_id{
    
    NSString *deviceID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    // Add a new document with a generated ID
    FIRFirestore *defaultFirestore = [FIRFirestore firestore];
    
    __block FIRDocumentReference *ref =
        [[defaultFirestore collectionWithPath:@"user_table"] addDocumentWithData:@{
          @"id": deviceID,
          @"name": @"",
          @"email": @"",
        } completion:^(NSError * _Nullable error) {
          if (error != nil) {
            NSLog(@"Error adding document: %@", error);
          } else {
            NSLog(@"Document added with ID: %@", ref.documentID);
          }
        }];
}

-(void)updateUserDataToDatabase:(NSString*)device_id {
    FIRFirestore *defaultFirestore = [FIRFirestore firestore];
    FIRCollectionReference *colRef = [defaultFirestore collectionWithPath:@"user_table"];
    FIRQuery *query = [colRef queryWhereField:@"id" isEqualTo:device_id];
    
    [query getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
        
        if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
        } else {
            if ([snapshot.documents count]){
                FIRDocumentSnapshot *document = snapshot.documents.firstObject;
                [document.reference updateData:@{
                    @"id": device_id
                }];
            }else{
                NSLog(@"add into: %@", device_id);
                [self addUserDataToDatabase:device_id];
            }
        }
    }];
}

-(void)addPointDataToDatabase:(NSString*)device_id point:(NSNumber*)point{
    // Add a new document with a generated ID
    FIRFirestore *defaultFirestore = [FIRFirestore firestore];
    
    __block FIRDocumentReference *ref =
        [[defaultFirestore collectionWithPath:@"point_table"] addDocumentWithData:@{
          @"id": device_id,
          @"ads": @(0),
          @"point": @(0.0),
        } completion:^(NSError * _Nullable error) {
          if (error != nil) {
            NSLog(@"Error adding document: %@", error);
          } else {
            NSLog(@"Document added with ID: %@", ref.documentID);
          }
        }];
}

-(void)updatePointDataToDatabase:(NSString*)device_id {
    FIRFirestore *defaultFirestore = [FIRFirestore firestore];
    FIRCollectionReference *colRef = [defaultFirestore collectionWithPath:@"point_table"];
    FIRQuery *query = [colRef queryWhereField:@"id" isEqualTo:device_id];
    
    [query getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
        
        if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
        } else {
            if ([snapshot.documents count]){
                
                double newPoints = [self calculatePoints];
                
                FIRDocumentSnapshot *document = snapshot.documents.firstObject;
                NSNumber *ads    = [document data][@"ads"];
                NSNumber *prePoints = [document data][@"point"];
                double newTotalPoints = [prePoints doubleValue] + newPoints;
                [self addValue:@(newTotalPoints) key:kREVENUE];
                NSLog(@"newPoints::%f",newPoints);
                NSLog(@"prePoints::%@",prePoints);
                
                
                [document.reference updateData:@{
                    @"ads": @([ads doubleValue] + 1),
                    @"point": @(newTotalPoints),
                }];
            }else{
                NSLog(@"add point into: %@", device_id);
                [self addPointDataToDatabase:device_id point:@(0)];
            }
        }
    }];
}

-(void)updatePointAfterPaymentToDatabase:(NSNumber*)newPoint {
    NSString *device_id = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    FIRFirestore *defaultFirestore = [FIRFirestore firestore];
    FIRCollectionReference *colRef = [defaultFirestore collectionWithPath:@"point_table"];
    FIRQuery *query = [colRef queryWhereField:@"id" isEqualTo:device_id];
    
    [query getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
        
        if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
        } else {
            if ([snapshot.documents count]){
                FIRDocumentSnapshot *document = snapshot.documents.firstObject;
                NSNumber *ads    = [document data][@"ads"];
                [document.reference updateData:@{
                    @"ads"  : ads,
                    @"point": newPoint,
                }];
            }
        }
    }];
}

-(void)getPointDataToDatabase:(NSString*)device_id {
    FIRFirestore *defaultFirestore = [FIRFirestore firestore];
    FIRCollectionReference *colRef = [defaultFirestore collectionWithPath:@"point_table"];
    FIRQuery *query = [colRef queryWhereField:@"id" isEqualTo:device_id];
    
    [query getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
        
        if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
        } else {
            if ([snapshot.documents count]){
                
                FIRDocumentSnapshot *document = snapshot.documents.firstObject;
                NSNumber *ads    = [document data][@"ads"];
                NSNumber *prePoints = [document data][@"point"];
                NSLog(@"pre ads::%@",ads);
                NSLog(@"prePoints::%@",prePoints);
                [self addValue:prePoints key:kREVENUE];
            }
        }
    }];
}

-(void)requestPaymentDataToDatabase:(NSString*)paymentID amount:(NSNumber*)amount completion:(void (^)(BOOL success))completion{
    // Add a new document with a generated ID
    FIRFirestore *defaultFirestore = [FIRFirestore firestore];
    NSString *deviceID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    __block FIRDocumentReference *ref =
        [[defaultFirestore collectionWithPath:@"payment_table"] addDocumentWithData:@{
          @"id": deviceID,
          @"payment_id": paymentID,
          @"payment_method": @"PAYPAL",
          @"requested_amount": amount,
          @"request_status": @1,
          @"total_paid": @0,
        } completion:^(NSError * _Nullable error) {
          if (error != nil) {
            NSLog(@"Error adding document: %@", error);
              completion(false);
          } else {
            NSLog(@"Document added with ID: %@", ref.documentID);
              completion(true);
          }
        }];
}

-(void)getEcpmDataFromDatabase {
    //NSString *device_id = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    FIRFirestore *defaultFirestore = [FIRFirestore firestore];
    FIRCollectionReference *colRef = [defaultFirestore collectionWithPath:@"ecpm_table"];
    FIRQuery *query = [colRef queryWhereField:@"today" isEqualTo:@(1)];
    
    [query getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
        
        if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
        } else {
            if ([snapshot.documents count]){
                FIRDocumentSnapshot *document = snapshot.documents.firstObject;
                NSLog(@"ecpm table: %@", [document data]);
                
                NSNumber *percent = [document data][@"percent"];
                //NSNumber *value   = [document data][@"value"];
                NSNumber *value = [self getEcpmValue:document];
                
                NSLog(@"percent: %@", percent);
                NSLog(@"value : %@", value);
                
                [self addValue:percent key:kPERCENT];
                [self addValue:value key:kECPM];
                //
//                NSTimeInterval today = [[NSDate date] timeIntervalSince1970];
//                [self addValue:@(today) key:kECPM_DATE];
            }
        }
    }];
}

-(void)getAdNameTableFromDatabase {
    FIRFirestore *defaultFirestore = [FIRFirestore firestore];
    FIRCollectionReference *colRef = [defaultFirestore collectionWithPath:@"ad_name_table"];
    FIRQuery *query = [colRef queryWhereField:@"isEnable" isEqualTo:@(TRUE)];
    
    [query getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
        
        if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
        } else {
            if ([snapshot.documents count]){
                FIRDocumentSnapshot *document = snapshot.documents.firstObject;
                NSLog(@"ad_name_table: %@", [document data]);
                
                NSNumber *admob    = [document data][kADMOBE_AD];
                NSNumber *appodeal = [document data][kAPPODEAL_AD];
                NSNumber *facebook = [document data][kFACEBOOK_AD];
                
                NSNumber *admobKey    = [document data][kADMOBE_AD_KEY];
                NSNumber *appodealKey = [document data][kAPPODEAL_AD_KEY];
                NSNumber *facebookKey = [document data][kFACEBOOK_AD_KEY];
                
                NSLog(@"admob   : %@", admob);
                NSLog(@"appodeal: %@", appodeal);
                NSLog(@"facebook: %@", facebook);
                
                [self addValue:admob    key:kADMOBE_AD];
                [self addValue:appodeal key:kAPPODEAL_AD];
                [self addValue:facebook key:kFACEBOOK_AD];
                
                [self addValue:admobKey    key:kADMOBE_AD_KEY];
                [self addValue:appodealKey key:kAPPODEAL_AD_KEY];
                [self addValue:facebookKey key:kFACEBOOK_AD_KEY];
                
                //save value in user default
                [self saveAdNetworkName];
            }
        }
    }];
}

//fetch ad offer table from db
-(void)getOfferTableFromDatabase {
    //NSString *device_id = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    FIRFirestore *defaultFirestore = [FIRFirestore firestore];
    FIRCollectionReference *colRef = [defaultFirestore collectionWithPath:@"offer_table"];
    FIRQuery *query = [colRef queryWhereField:@"is_offer" isGreaterThanOrEqualTo:@(0)];
    
    [query getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
        
        if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
        } else {
            if ([snapshot.documents count]){
                FIRDocumentSnapshot *document = snapshot.documents.firstObject;
                NSLog(@"offer table: %@", [document data]);
                
                NSNumber *is_offer      = [document data][@"is_offer"];
                NSNumber *offer_time    = [document data][@"offer_time"];
                NSNumber *checking_time = [document data][@"checking_time"];
                
                //message
                NSString *ad_offer_message    = [document data][@"ad_offer_message"];
                NSString *point_offer_message = [document data][@"point_offer_message"];
                NSString *withdraw_message    = [document data][@"withdraw_message"];
                
                NSTimeInterval now = [self getTimeIntervalNow];
                
                //take sever update by repeating this time interval
                NSTimeInterval checkingInterval = [checking_time doubleValue];
                [self addValue:@(checkingInterval) key:kCHEEKING_TIME_INTERVAL];
                
                NSTimeInterval offerStartInterval = now + [checking_time doubleValue];
                [self addValue:@(offerStartInterval) key:kOFFER_START_TIME_INTERVAL];
                
                //offer time duration
                NSTimeInterval offerEndInterval =  [offer_time doubleValue];
                [self addValue:@(offerEndInterval) key:kOFFER_END_TIME_INTERVAL];
                
                //NSLog(@"### now:%f",now);
                NSLog(@"### checkingInterval  :%f",checkingInterval);
                NSLog(@"### offerStartInterval:%f",offerStartInterval);
                NSLog(@"### offerEndInterval  :%f",offerEndInterval);
                
                //set offer true/false
                [self addValue:is_offer key:kIS_OFFER];
                
                //save message
                [self addValue:ad_offer_message    key:kOFFER_MESSAGE_AD];
                [self addValue:point_offer_message key:kOFFER_MESSAGE_POINT];
                [self addValue:withdraw_message    key:kWITHDRAW_MESSAGE];
            }
        }
    }];
}


#pragma mark - Calculate points
-(NSNumber*)getEcpmValue:(FIRDocumentSnapshot*)document{
    NSString *countryCode = [[self getValue:kCOUNTRY_CODE] lowercaseString];
    
    NSNumber *value_bd    = [document data][kCOUNTRY_CODE_BD];
    NSNumber *value_in    = [document data][kCOUNTRY_CODE_IN];
    NSNumber *value_us    = [document data][kCOUNTRY_CODE_US];
    
    NSNumber *value_rank1 = [document data][kCOUNTRY_CODE_RANK1];
    NSNumber *value_rank2 = [document data][kCOUNTRY_CODE_RANK2];
    NSNumber *value_rank3 = [document data][kCOUNTRY_CODE_RANK3];
    NSNumber *value = @(0);
    
    if([countryCode isEqualToString:kCOUNTRY_CODE_BD]){
        value = value_bd;
    }else if([countryCode isEqualToString:kCOUNTRY_CODE_IN]){
        value = value_in;
    }else if([countryCode isEqualToString:kCOUNTRY_CODE_US]){
        value = value_us;
    }else if([countryCode isEqualToString:kCOUNTRY_CODE_RANK1]){
        value = value_rank1;
    }else if([countryCode isEqualToString:kCOUNTRY_CODE_RANK2]){
        value = value_rank2;
    }else if([countryCode isEqualToString:kCOUNTRY_CODE_RANK3]){
        value = value_rank3;
    }else{
        value = @(0);
    }
    return value;
}

-(void)saveAdNetworkName{
    FirebaseHelper *firebaseHelper = [FirebaseHelper sharedInstance];
        
        NSNumber *admob    = [firebaseHelper getValue:kADMOBE_AD];
        NSNumber *appodeal = [firebaseHelper getValue:kAPPODEAL_AD];
        NSNumber *facebook = [firebaseHelper getValue:kFACEBOOK_AD];
        
    //    NSLog(@"admob   ::%@",admob);
    //    NSLog(@"appodeal::%@",appodeal);
    //    NSLog(@"facebook::%@",facebook);
    NSMutableArray *adNameArray = [[NSMutableArray alloc] init];
        
    for (int i=0;i<[admob intValue];i++){
        [adNameArray addObject:kADMOBE_AD];
    }
    for (int i=0;i<[appodeal intValue];i++){
        [adNameArray addObject:kAPPODEAL_AD];
    }
    for (int i=0;i<[facebook intValue];i++){
        [adNameArray addObject:kFACEBOOK_AD];
    }
    
    NSLog(@"adNameArray::%@",adNameArray);
    
    [self addValue:adNameArray key:kAD_NAME_ARRAY_KEY];
}

-(NSMutableArray*)getAdNetworkName{
    
    FirebaseHelper *firebaseHelper = [FirebaseHelper sharedInstance];
        
        NSNumber *admob    = [firebaseHelper getValue:kADMOBE_AD];
        NSNumber *appodeal = [firebaseHelper getValue:kAPPODEAL_AD];
        NSNumber *facebook = [firebaseHelper getValue:kFACEBOOK_AD];
        
    //    NSLog(@"admob   ::%@",admob);
    //    NSLog(@"appodeal::%@",appodeal);
    //    NSLog(@"facebook::%@",facebook);
    NSMutableArray *adNameArray = [[NSMutableArray alloc] init];
        
    for (int i=0;i<[admob intValue];i++){
        [adNameArray addObject:kADMOBE_AD];
    }
    for (int i=0;i<[appodeal intValue];i++){
        [adNameArray addObject:kAPPODEAL_AD];
    }
    for (int i=0;i<[facebook intValue];i++){
        [adNameArray addObject:kFACEBOOK_AD];
    }
    
    NSLog(@"adNameArray::%@",adNameArray);
    [self saveAdNetworkName];
    return adNameArray;
}

#pragma -
-(double)calculatePoints{
    id percent = [self getValue:kPERCENT];
    id value   = [self getValue:kECPM];
    double newRevenue = [percent doubleValue]*0.01 * [value doubleValue] * 0.001;
    NSLog(@"get newRevenue::%@",[self getValue:kREVENUE]);
    return newRevenue;
}

-(BOOL)isRegisteredUser{
    BOOL isRegisteredUser = [[self getValue:kREGISTERED_USER_KEY] boolValue];
    return isRegisteredUser;
}

-(BOOL)isOfferedUser{
   return [[self getValue:kIS_OFFER] boolValue];
}

-(BOOL)isNeedUpdateOfferTime{
   NSTimeInterval nowInterval = [self getTimeIntervalNow];
//    double checking_interval   = [[self getValue:kCHEEKING_TIME_INTERVAL] doubleValue];
    
    double offer_start_time_interval = [[self getValue:kOFFER_START_TIME_INTERVAL] doubleValue];
    double offer_end_time_interval   = [[self getValue:kOFFER_END_TIME_INTERVAL] doubleValue];
    
    NSLog(@"offer_start_time_interval::%f",offer_start_time_interval);
    NSLog(@"offer_end_time_interval  ::%f",offer_end_time_interval);
    if(nowInterval > offer_start_time_interval){
        return true;
    }
    return false;
}

-(NSTimeInterval)getTimeIntervalNow{
    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    return now;
}

-(void)addValue:(id)value key:(NSString*)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:value forKey:key];
    [defaults synchronize];
}

-(id)getValue:(NSString*)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id value = [defaults valueForKey:key];
    return  value;
}

@end

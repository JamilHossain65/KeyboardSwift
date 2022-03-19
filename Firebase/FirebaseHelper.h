//
//  FirebaseHelper.h
//  SmartKeyboard
//
//  Created by Jamil on 12/12/20.
//  Copyright © 2020 Jamil Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirebaseHelper : NSObject

+ (id)sharedInstance;

-(void)initialize;
-(void)addUserDataToDatabase:(NSString*)device_id;
-(void)updateUserDataToDatabase:(NSString*)device_id;
-(void)getPointDataToDatabase:(NSString*)device_id;
-(void)getEcpmDataFromDatabase;
-(void)getAdNameTableFromDatabase;
-(void)getOfferTableFromDatabase;

//update remote db
-(void)updatePointDataToDatabase:(NSString*)device_id;
-(void)addPointDataToDatabase:(NSString*)device_id point:(NSNumber*)point;

//Payment
-(void)updatePointAfterPaymentToDatabase:(NSNumber*)newPoint;
-(void)requestPaymentDataToDatabase:(NSString*)paymentID amount:(NSNumber*)amount completion:(void (^)(BOOL success))completion;

//private methods
-(void)saveAdNetworkName;
-(NSMutableArray*)getAdNetworkName;
-(NSTimeInterval)getTimeIntervalNow;
-(double)calculatePoints;
-(BOOL)isRegisteredUser;
-(BOOL)isOfferedUser;
-(BOOL)isNeedUpdateOfferTime;
//
-(void)addValue:(id)value key:(NSString*)key;
-(id)getValue:(NSString*)key;

@end

NS_ASSUME_NONNULL_END

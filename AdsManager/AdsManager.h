//
//  AdsManager.h
//  QRCodeScan
//
//  Created by Jamil Hossain on ৮/৩/১৭.
//  Copyright © ২০১৭ Jamil Hossain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
//#import "FBAudienceNetworks.h"
//#import "ApplovinAd.h"
#import "AdmobAd.h"
#import "AdAppodeal.h"
#import "FirebaseHelper.h"

@interface AdsManager : UIViewController

@property (nonatomic, copy) void (^adFanFailWithCompletion)(void);
@property (nonatomic, copy) void (^adFanRewardedFailWithCompletion)(void);
@property (nonatomic, copy) void (^adApplovinFailWithCompletion)(void);
@property (nonatomic, copy) void (^adUnityFailWithCompletion)(void);
//@property (nonatomic, copy) void (^adFalconFailWithCompletion)(void);
@property (nonatomic, copy) void (^adMobFailWithCompletion)(void);
@property (nonatomic, copy) void (^completionHandler)(BOOL);
@property (nonatomic, copy) void (^completionHandlerAdmob)(BOOL);
@property (nonatomic, copy) void (^completionHandlerAppodeal)(BOOL);
@property (nonatomic, copy) void (^completionHandlerApplovin)(BOOL);

//ad dismiss
@property (nonatomic, copy) void (^completionWithImpression)(BOOL success);

@property (nonatomic, strong) UIApplication *application;

@property (nonatomic, assign) bool isValidImpression;

//shared instance method
+ (id)sharedInstance;

//method show Facebook ads on the parrent view controller
-(void)showFanAdsOnParrent:(UIViewController*)viewController;
-(void)showFBNativeAd:(UIViewController*)viewController;

//-(void)showFanRewardedAdsOnParrent:(UIViewController*)viewController;
-(void)showFanRewardedVideoAdsOnParrent:(UIViewController*)viewController;

//method show Unity ads on the parrent view controller
-(void)showUnityAdsOnParrent:(UIViewController*)viewController;
//-(void)showUnityVideoAdsOnParrent:(UIViewController*)viewController;

//method show Applovin ads on the parrent view controller
-(void)showAdFalconAdsOnParrent:(UIViewController*)viewController;

//method show admob ads on the parrent view controller
-(void)showAdMobAdsOnParrent:(UIViewController*)viewController;

//method show Appodeal ads on the parrent view controller
-(void)showAppodealOnParrent:(UIViewController*)viewController;

//method show Applovin ads on the parrent view controller
-(void)showApplovinOnParrent:(UIViewController*)viewController;

//update key
-(void)updateAppodealKey:(NSString*)key;
-(void)updateAdmobKey:(NSString*)key;
-(void)updateFacebookKey:(NSString*)key;

-(void)addValue:(id)value key:(NSString*)key;
-(id)getValue:(NSString*)key;

-(void)saveIsPurchased:(BOOL)isPurchase;
-(BOOL)getIsPurchase;
-(BOOL)isRandomTrueFor:(int)adsPercentage;
-(NSDictionary*)getDicFromContent:(NSString *)fileContent;

//unix time stamp
-(void)saveAdsShownCurrentTime;
-(NSTimeInterval)getAdsShownPastTime;
-(BOOL)isTimePastForAds;

//rating
-(void)saveIsRating:(int)rating;
-(void)ratingIncrementBy:(int)ratingIncrement;
-(double)getTotalOpen;
-(BOOL)getIsRating;


//is showing ads check
-(BOOL)getIsShowingAdsChecked;
-(void)saveIsShowingAdChecked:(BOOL)isCheck;

//ad repeat time
-(void)saveAdRepeatTime:(int)adRepeateTime;
-(int)getAdRepeatTime;
//ad mediation time
-(int)getAdMediationTime;
-(NSTimeInterval)getMediationAdShownLastTime;
-(void)saveAdMediationCurrentTime;
-(void)saveAdMediationTime:(int)mediationTime;
-(BOOL)isMediationTimePast;
-(NSTimeInterval)getTimeIntervalNow;
- (void) showAlertMsg:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message;

@end

//
//  AdsManager.h
//  QRCodeScan
//
//  Created by Jamil Hossain on ৮/৩/১৭.
//  Copyright © ২০১৭ Jamil Hossain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBAudienceNetworks.h"
#import "ApplovinAd.h"
#import "UnityAd.h"
//#import "AdFalcon.h"
#import "AdmobAd.h"

@interface AdsManager : UIViewController

@property (nonatomic, copy) void (^adFanFailWithCompletion)(void);
@property (nonatomic, copy) void (^adFanRewardedFailWithCompletion)(void);
@property (nonatomic, copy) void (^adApplovinFailWithCompletion)(void);
@property (nonatomic, copy) void (^adUnityFailWithCompletion)(void);
//@property (nonatomic, copy) void (^adFalconFailWithCompletion)(void);
@property (nonatomic, copy) void (^adMobFailWithCompletion)(void);
@property (nonatomic, copy) void (^completionHandler)(BOOL);
@property (nonatomic, copy) void (^completionHandlerAdmob)(BOOL);

@property (nonatomic, strong) UIApplication *application;

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
-(void)showApplovinAdsOnParrent:(UIViewController*)viewController;

//method show Applovin ads on the parrent view controller
-(void)showAdFalconAdsOnParrent:(UIViewController*)viewController;
//method show admob ads on the parrent view controller
-(void)showAdMobAdsOnParrent:(UIViewController*)viewController;

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
@end

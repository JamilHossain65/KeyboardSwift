//
//  AdsManager.m
//  QRCodeScan
//
//  Created by Jamil Hossain on ৮/৩/১৭.
//  Copyright © ২০১৭ Jamil Hossain. All rights reserved.
//

#import "AdsManager.h"

@import Appodeal;
@import GoogleMobileAds;

#define SUITE_NAME @"group.com.vaticsoft.BurmeseKeyboard"

@interface AdsManager ()

@end

@implementation AdsManager

int  impression_time   = 15;
bool isValidImpression = false;

NSTimeInterval timeIntervalOpen  = 0;
NSTimeInterval timeIntervalClose = 0;

+ (id)sharedInstance{
    static AdsManager *sharedHandler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedHandler = [[self alloc] init];
    });
    return sharedHandler;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 Import this header file.
 
 #import "AdsManager.h"
 
 And call this method from any viewFontroller
 
 [[AdsManager sharedInstance] showAdsOnParrent:self];
 
 */



-(void)showFanAdsOnParrent:(UIViewController*)viewController{
    //[self showFBAd:viewController];
}

-(void)showFBAd:(UIViewController*)viewController{
    /*FBAudienceNetworks *adVC = [[FBAudienceNetworks alloc]initWithNibName:@"FBAudienceNetworks" bundle:nil];
    adVC.adFailWithCompletion = ^(BOOL success){
        self.completionHandler(success);
    };
    [viewController.view addSubview:adVC.view];
    [viewController addChildViewController:adVC];*/
}

/*
-(void)showFanRewardedVideoAdsOnParrent:(UIViewController*)viewController{
    FBAudienceNetworks *adVC = [[FBAudienceNetworks alloc]initWithNibName:@"FBAudienceNetworks" bundle:nil];
    adVC.adFailWithCompletion = ^(BOOL success){
        self.adFanRewardedFailWithCompletion();
    };
    [viewController.view addSubview:adVC.view];
    [viewController addChildViewController:adVC];
}

-(void)showUnityAdsOnParrent:(UIViewController*)viewController{
    [self showUnityAd:viewController];
}

-(void)showFBNativeAd:(UIViewController*)viewController{
    FBAudienceNetworks *adVC = [[FBAudienceNetworks alloc]initWithNibName:@"FBAudienceNetworks" bundle:nil];
    adVC.adFailWithCompletion = ^(BOOL success){
        self.completionHandler(success);
    };
    [viewController.view addSubview:adVC.view];
    [viewController addChildViewController:adVC];
    [adVC showNativeAd];
}

*/

-(void)showUnityAd:(UIViewController*)viewController{
   /* UnityAd *adVC = [[UnityAd alloc]initWithNibName:@"UnityAd" bundle:nil];
    adVC.adFailWithCompletion = ^{
        self.adUnityFailWithCompletion();
    };
    [viewController.view addSubview:adVC.view];
    [viewController addChildViewController:adVC];
    */
}
/*
-(void)showApplovinAdsOnParrent:(UIViewController*)viewController{
    
    ApplovinAd *adVC = [[ApplovinAd alloc]initWithNibName:@"ApplovinAd" bundle:nil];
    adVC.adFailWithCompletion = ^{
        self.adApplovinFailWithCompletion();
    };
    [viewController.view addSubview:adVC.view];
    [viewController addChildViewController:adVC];
}

-(void)showAdFalconAdsOnParrent:(UIViewController*)viewController{
    AdFalcon *adVC = [[AdFalcon alloc]initWithNibName:@"AdFalcon" bundle:nil];
    adVC.adFailWithCompletion = ^{
       
        dispatch_async(dispatch_get_main_queue(), ^{ // 2
             self.adFalconFailWithCompletion();
        });
        
    };
    [viewController.view addSubview:adVC.view];
    [viewController addChildViewController:adVC];
    
}
*/

-(void)showAdMobAdsOnParrent:(UIViewController*)viewController{
    /*
    FirebaseHelper *firebaseHelper = [FirebaseHelper sharedInstance];
    AdmobAd *adVC = [[AdmobAd alloc]initWithNibName:@"AdmobAd" bundle:nil];
    adVC.admobAdKey = [firebaseHelper getValue:kADMOBE_AD_KEY];
    adVC.adFailWithCompletion = ^(BOOL success){
        self.completionHandlerAdmob(success);
    };
    [viewController.view addSubview:adVC.view];
    [viewController addChildViewController:adVC];
     */
}

-(void)showAppodealOnParrent:(UIViewController*)viewController{
    
    AdAppodeal *adVC = [[AdAppodeal alloc]initWithNibName:@"AdAppodeal" bundle:nil];
    adVC.adFailWithCompletion = ^(BOOL success){
        self.completionHandlerAppodeal(success);
        timeIntervalOpen = [[NSDate date] timeIntervalSince1970];
    };
    
    adVC.adDismissWithCompletion = ^(BOOL success){
        timeIntervalClose = [[NSDate date] timeIntervalSince1970];
        int diff = timeIntervalClose - timeIntervalOpen;
        if( diff > 0 && diff >= impression_time){
            self.isValidImpression = true;//todo this variable may be unnecessary
            self.completionWithImpression(true);
        } else {
            self.isValidImpression = false;
            self.completionWithImpression(false);
        }
    };
    
    [viewController.view addSubview:adVC.view];
    [viewController addChildViewController:adVC];
}

-(void)showApplovinOnParrent:(UIViewController*)viewController{
    /*
    ApplovinAd *adVC = [[ApplovinAd alloc]initWithNibName:@"ApplovinAd" bundle:nil];
    adVC.adFailWithCompletion = ^(BOOL success){
        self.completionHandlerApplovin(success);
    };
    [viewController.view addSubview:adVC.view];
    [viewController addChildViewController:adVC];
     */
}

#pragma mark - update ad key
-(void)updateAppodealKey:(NSString*)key{
    if ([key length] <= 0){
        key = @"1e64396174e14aeae1d46a108a8e42e3633f33147290be73";
    }
    [Appodeal initializeWithApiKey:key types:AppodealAdTypeInterstitial];
}

-(void)updateAdmobKey:(NSString*)key{
}

-(void)updateFacebookKey:(NSString*)key{
    
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

#pragma mark - check already purchase
-(void)saveIsPurchased:(BOOL)isPurchase{
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:SUITE_NAME];
    //NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:isPurchase forKey:@"IS_PURHASED_KEY"];
    [defaults synchronize];
}
-(BOOL)getIsPurchase{
    //NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:SUITE_NAME];
    
    return [defaults boolForKey:@"IS_PURHASED_KEY"];
}

#pragma mark - unix time stamp

-(void)saveAdsShownCurrentTime{
    NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:SUITE_NAME];
    [defaults setDouble:timestamp forKey:@"ADS_SHOWN_CURRENT_TIME_EXTENSION"];
    [defaults synchronize];
    
    NSLog(@"time::%d",[self isTimePastForAds]);
}

-(NSTimeInterval)getAdsShownPastTime{
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:SUITE_NAME];
    NSTimeInterval timeStamp = [defaults doubleForKey:@"ADS_SHOWN_CURRENT_TIME_EXTENSION"];
    return timeStamp;
}

-(BOOL)isTimePastForAds{
    NSTimeInterval currentTimestamp = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval pastTimestamp = [self getAdsShownPastTime];
    
    double diffTime = currentTimestamp - pastTimestamp;
    NSLog(@"=================== time diff::%f ============ ",diffTime);
//    if(diffTime >= AD_MIN_TIME){// 5 mins
//        return YES;
//    }
    return NO;
}



# pragma mark - random number and First ads methods

-(void)setIsShownFirstAds:(BOOL)isShow{
    [[NSUserDefaults standardUserDefaults] setBool:isShow forKey:@"FIRST_AD_SHOWN"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(@"isshown1st ads:::%d",[[NSUserDefaults standardUserDefaults] boolForKey:@"FIRST_AD_SHOWN"]);
}

-(BOOL)getIsShownFirstAds{
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"FIRST_AD_SHOWN"];
}

# pragma mark - random number
-(BOOL)isRandomTrueFor:(int)adsPercentage{
    int ranNum = arc4random() % 100;
    NSLog(@"new ran::%d",ranNum);
    if(ranNum > 100 - adsPercentage){
        return YES;
    }
    return NO;
}

-(NSDictionary*)getDicFromContent:(NSString *)fileContent{
    
    NSMutableDictionary *settingDic = [NSMutableDictionary new];
    NSArray *contentComponentArray = [fileContent componentsSeparatedByString:@"\n"];
    for(int i=0;i<contentComponentArray.count;i++){
        
        NSString *str = contentComponentArray[i];
        NSArray *components = [str componentsSeparatedByString:@" = "];
        NSString *key = components[0];
        NSString *value = components[1];
        
        settingDic[key] = value;
        
    }
    
    return settingDic;
}

#pragma mark - show app rating
-(void)saveIsRating:(int)rating{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:rating forKey:@"APP_OPEN_COUNT_KEY"];
    [defaults synchronize];
}

-(void)ratingIncrementBy:(int)ratingIncrement{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int rating = (int)[defaults doubleForKey:@"APP_OPEN_COUNT_KEY"];
    
    if(rating < 0){
        [self saveIsRating: 0];
    }else{
        [self saveIsRating: rating + 1];
    }
   
    NSLog(@"rating count:::%d",(int)rating);
    
}

-(double)getTotalOpen{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double rating = [defaults doubleForKey:@"APP_OPEN_COUNT_KEY"];
    
    return rating;
}
-(BOOL)getIsRating{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double rating = [defaults doubleForKey:@"APP_OPEN_COUNT_KEY"];
    if(rating && (int)rating % 100 == 0){
        return YES;
    }
    return NO;
}
-(BOOL)getIsShowingAdsChecked{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double rating = [defaults doubleForKey:@"IS_SHOWING_AD_CHECKED"];
    return rating;
}

-(void)saveIsShowingAdChecked:(BOOL)isCheck{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:isCheck forKey:@"IS_SHOWING_AD_CHECKED"];
    [defaults synchronize];
}

//ad repeat time
-(void)saveAdRepeatTime:(int)adRepeateTime{
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:SUITE_NAME];
    [defaults setInteger:adRepeateTime forKey:@"AD_REPEAT_TIME"];
    [defaults synchronize];
    
    NSLog(@"save mediation time:::%ld",[defaults integerForKey:@"AD_REPEAT_TIME"]);
}
-(int)getAdRepeatTime{
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:SUITE_NAME];
    int mTime = (int)[defaults integerForKey:@"AD_REPEAT_TIME"];
    return mTime;
}

//ad mediation time
-(void)saveAdMediationTime:(int)mediationTime{
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:SUITE_NAME];
    [defaults setInteger:mediationTime forKey:@"AD_MEDIATION_TIME"];
    [defaults synchronize];
    
    NSLog(@"save mediation time:::%ld",[defaults integerForKey:@"AD_MEDIATION_TIME"]);
}
-(int)getAdMediationTime{
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:SUITE_NAME];
    int mTime = (int)[defaults integerForKey:@"AD_MEDIATION_TIME"];
    return mTime;
}
-(void)saveAdMediationCurrentTime{
    NSTimeInterval currentTimestamp = [[NSDate date] timeIntervalSince1970];
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:SUITE_NAME];
    [defaults setDouble:currentTimestamp forKey:@"AD_MEDIATION_CURRENT_TIME"];
    [defaults synchronize];
    
    NSLog(@"save mediation time:::%ld",[defaults integerForKey:@"AD_MEDIATION_CURRENT_TIME"]);
}
-(NSTimeInterval)getMediationAdShownLastTime{
    NSUserDefaults *defaults = [[NSUserDefaults alloc]initWithSuiteName:SUITE_NAME];
    NSTimeInterval timeStamp = [defaults doubleForKey:@"AD_MEDIATION_CURRENT_TIME"];
    return timeStamp;
}
-(BOOL)isMediationTimePast{
    NSTimeInterval currentTimestamp = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval pastTimestamp = [self getMediationAdShownLastTime];
    
    double diffTime = currentTimestamp - pastTimestamp;
    NSLog(@"================================== mediation time diff::%f ================================== ",diffTime);
    int mediationTime = [self getAdMediationTime];
    NSLog(@"get mediationTime:::%d",mediationTime);
//    if(mediationTime<=0){
//        mediationTime = AD_MIN_TIME;
//    }
    if(diffTime >= mediationTime){// 5 mins
        NSLog(@"return YES");
        return YES;
    }
    NSLog(@"return NO");
    return NO;
}

-(NSTimeInterval)getTimeIntervalNow{
    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    return now;
}

//Alert function
- (void) showAlertMsg:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message {

    UIAlertController * alert = [UIAlertController alertControllerWithTitle : title
                                                                    message : message
                                                             preferredStyle : UIAlertControllerStyleAlert];

    UIAlertAction * ok = [UIAlertAction
                          actionWithTitle:@"OK"
                          style:UIAlertActionStyleDefault
                          handler:^(UIAlertAction * action)
                          { }];

    [alert addAction:ok];
    dispatch_async(dispatch_get_main_queue(), ^{
        [viewController presentViewController:alert animated:YES completion:nil];
    });

}

@end

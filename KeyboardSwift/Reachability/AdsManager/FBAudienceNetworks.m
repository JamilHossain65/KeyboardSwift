//
//  FBAudienceNetworks.m
//  Keyboard
//
//  Created by Jamil Hossain on ৩০/১১/১৬.
//  Copyright © ২০১৬ Jamil Hossain. All rights reserved.
//

#import "FBAudienceNetworks.h"
#import "FBAudienceNetwork/FBAudienceNetwork.h"
#import "AdsManager.h"

@import FBAudienceNetwork;


static NSString  *FB_PLACEMENT_ID = @"231285444194378_345057629483825";

static NSString  *FB_PLACEMENT_ID_BANNER = @"298627933865999_368160270246098";//Bangla Keybaord Goti Banner
static NSString  *FB_PLACEMENT_ID_NATIVE = @"298627933865999_465047263890731";//Bangla Keybaord Goti Native

static NSInteger mins = 60;
static NSInteger repeatedTime = 10;

/*
 //facebook app account
 
 name: Jamil Hossain
 
 phone: 01760614503
 DOB: 02/03/1986
 password: 60614503
 
*/

//testing facebook app
//https://developers.facebook.com/docs/audience-network/testing

//facebook login review guideline
//https://developers.facebook.com/docs/facebook-login/review/what-is-login-review

@interface FBAudienceNetworks ()<FBInterstitialAdDelegate>
{
    FBInterstitialAd *fbInterstitialAd;
    //FBRewardedVideoAd *fbRewardedVideoAd;
    //BOOL alreadyShownRewarded;
}

@end


@implementation FBAudienceNetworks

+ (id)sharedInstance{
    static FBAudienceNetworks *sharedHandler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedHandler = [[self alloc] init];
        //;
    });
    
    return sharedHandler;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //Set to make the view's frame zero
    
    self.view.frame = CGRectZero;
    
    self.view.backgroundColor = [UIColor redColor];
    
    //Show FB ads
    [self showInterstitalAd];
    NSTimeInterval timeInterval = repeatedTime*mins;
    [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(showInterstitalAd) userInfo:nil repeats:YES];
    
    //[self performSelector:@selector(loadFanRewardedVideoAd) withObject:nil afterDelay:1];
    
   /*
    //show banner ad
    [FBAdSettings addTestDevice:[FBAdSettings testDeviceHash]];
    FBAdView *adView = [[FBAdView alloc] initWithPlacementID:FB_PLACEMENT_ID_BANNER
                                                      adSize:kFBAdSizeHeight50Banner
                                          rootViewController:self];
    adView.frame = CGRectMake(0,[UIScreen mainScreen].bounds.size.height - 50, adView.bounds.size.width, adView.bounds.size.height);
    adView.delegate = self;
    [adView loadAd];
    self.view.frame = CGRectMake(0, 0, adView.bounds.size.width, adView.bounds.size.height);
    [self.view addSubview:adView];
     */
    //
    //[self showNativeAd];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)showInterstitalAd {
    NSLog(@"InterstitalAd load");
    fbInterstitialAd = [[FBInterstitialAd alloc] initWithPlacementID:FB_PLACEMENT_ID];
    fbInterstitialAd.delegate = self;
//    [FBAdSettings clearTestDevices];
//    [FBAdSettings addTestDevice:[FBAdSettings testDeviceHash]];
    //http://stackoverflow.com/questions/41053912/how-to-make-the-facebook-ads-live
    [fbInterstitialAd loadAd];
}

#pragma mark - FB Ad Delegate Methods

- (void)interstitialAdDidLoad:(FBInterstitialAd *)interstitialAd {
    NSLog(@"Ad is loaded and ready to be displayed");
    self.adFailWithCompletion(YES);
    // You can now display the full screen ad using this code:
    [interstitialAd showAdFromRootViewController:self];
}

- (void)interstitialAd:(FBInterstitialAd *)interstitialAd didFailWithError:(NSError *)error {
    NSLog(@"Ad failed to load beacuse of %@",error);
    self.adFailWithCompletion(NO);
}

/*
#pragma mark - FB Rewarded Ad Private Methods

- (void) loadFanRewardedVideoAd
{
        fbRewardedVideoAd = [[FBRewardedVideoAd alloc] initWithPlacementID:FB_PLACEMENT_ID];
        fbRewardedVideoAd.delegate = self;
        [FBAdSettings addTestDevice:[FBAdSettings testDeviceHash]];
        [fbRewardedVideoAd loadAd];
    
}

- (void) showRewardedVideoAd
{
    if(fbRewardedVideoAd.isAdValid){
        //if([self alreadyShownRewarded] == NO){
        [fbRewardedVideoAd showAdFromRootViewController:self];
        //}
    }
}

#pragma mark - FB Rewarded Ad Delegate Methods

- (void)rewardedVideoAd:(FBRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error
{
    NSLog(@"Rewarded video ad failed to load, reson:%@",error);
    self.adFailWithCompletion(NO);
}

- (void)rewardedVideoAdDidLoad:(FBRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"Video ad is loaded and ready to be displayed");
    [self showRewardedVideoAd];
}

- (void)rewardedVideoAdDidClick:(FBRewardedVideoAd *)rewardedVideoAd
{
    NSLog(@"Video ad clicked");
    //fbRewardedVideoAd = nil;
}

- (void)rewardedVideoAdComplete:(FBRewardedVideoAd *)rewardedVideoAd;
{
    NSLog(@"Rewarded Video ad complete - this is called after a fullvideo view, before the ad end card is shown. You can use this event to initialize your reward");
//[self alreadyShownRewarded:YES];
//    if([self.delegate respondsToSelector:@selector(FBAudienceAdsDidComplete)]){
//        [self.delegate FBAudienceAdsDidComplete];
//    }
    
    
}
          
- (void)rewardedVideoAdDidClose:(FBRewardedVideoAd *)rewardedVideoAd
{
   NSLog(@"Rewarded Video ad closed - this can be triggered by closing the application, or closing the video end card");
    //fbRewardedVideoAd = nil;
}

#pragma mark - Banner ad delegate methods

- (void)adViewDidLoad:(FBAdView *)adView
{
    NSLog(@"Ad was loaded and ready to be displayed");
}

- (void)adViewDidClick:(FBAdView *)adView
{
    NSLog(@"Banner ad was clicked.");
}

- (void)adViewDidFinishHandlingClick:(FBAdView *)adView
{
    NSLog(@"Banner ad did finish click handling.");
}

- (void)adViewWillLogImpression:(FBAdView *)adView
{
    NSLog(@"Banner ad impression is being captured.");
}

- (void)adView:(FBAdView *)adView didFailWithError:(NSError *)error
{
    NSLog(@"Ad failed to load:%@",error.localizedDescription);
}

#pragma mark - Native ads delegate methods

- (void)showNativeAd
{
    FBNativeAd *nativeAd = [[FBNativeAd alloc] initWithPlacementID:FB_PLACEMENT_ID_NATIVE];
    nativeAd.delegate = self;
    [nativeAd loadAd];
}


- (void)nativeAdWillLogImpression:(FBNativeAd *)nativeAd{
    
}
- (void)nativeAd:(FBNativeAd *)nativeAd didFailWithError:(NSError *)error{
    
}
- (void)nativeAdDidClick:(FBNativeAd *)nativeAd{
    
}
- (void)nativeAdDidFinishHandlingClick:(FBNativeAd *)nativeAd{
    
}
*/

@end

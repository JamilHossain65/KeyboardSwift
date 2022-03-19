//
//  ApplovinAd.m
//  SmartKeyboard
//
//  Created by Jamil Hossain on 11/16/17.
//  Copyright © 2017 Jamil Hossain. All rights reserved.
//

#import "ApplovinAd.h"
#import <AppLovinSDK/AppLovinSDK.h>
#import "AdsManager.h"

@interface ApplovinAd ()<ALAdDisplayDelegate,ALAdLoadDelegate>
{
    BOOL isShown;
}

@property (nonatomic, strong) ALAd *ad;


@end

@implementation ApplovinAd

- (void)viewDidLoad {
    [super viewDidLoad];
   
   //[self performSelector:@selector(showAplovinAd) withObject:nil afterDelay:1];
    
   //
   isShown = NO;
   [ALInterstitialAd shared].adDisplayDelegate = self;
   [ALInterstitialAd shared].adLoadDelegate = self;
    
//   [[ALSdk shared].adService loadNextAd: [ALAdSize sizeInterstitial] andNotify: self];
//   [[ALSdk shared].adService preloadAdOfSize:[ALAdSize sizeInterstitial]];
   // ALSdkUriNextAd
    
    
    if([[ALSdk shared].adService hasPreloadedAdOfSize:[ALAdSize sizeInterstitial]]){
        [self showAplovinAd];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)showAplovinAd{
    //http://www.iostutorialjunction.com/2014/10/integrate-applovin-banner-ad-in-ios.html
    if([ALInterstitialAd isReadyForDisplay]){
        NSLog(@"Ready to display ...");
        [ALInterstitialAd show];
        isShown = YES;
    }
    else{
        if(!isShown){
            [self performSelector:@selector(showAplovinAd) withObject:nil afterDelay:1];
            NSLog(@"No interstitial ad is currently available.  Perform failover logic...");
        }
    }
}


-(void) adService:(ALAdService *)adService didLoadAd:(ALAd *)ad
{
    NSLog(@"didLoadAd..............");
    self.ad = ad;
    [self showAplovinAd];
}

-(void) adService:(ALAdService *)adService didFailToLoadAdWithError:(int)code
{
    self.adFailWithCompletion();
    [self.view removeFromSuperview];
    if(code == kALErrorCodeNoFill){
        // Indicates that no ads are currently eligible for your device & location.
    }else{
        // Unable to reach AppLovin; the user's device likely has poor connectivity.
    }
}

#pragma mark - Display delegate
- (void)ad:(ALAd *)ad wasDisplayedIn:(UIView *)view{
    NSLog(@"wasDisplayedIn");
}
- (void)ad:(ALAd *)ad wasHiddenIn:(UIView *)view{
     NSLog(@"wasHiddenIn");
    [self.view removeFromSuperview];
}
- (void)ad:(ALAd *)ad wasClickedIn:(UIView *)view{
     NSLog(@"wasClickedIn");
    [self.view removeFromSuperview];
}

@end

//
//  AdAppodeal.m
//  SmartKeyboard
//
//  Created by Jamil Hossain on 12/12/17.
//  Copyright © 2017 Jamil Hossain. All rights reserved.
//

#import "AdAppodeal.h"
#import "Appodeal/Appodeal.h"

@interface AdAppodeal ()<AppodealInterstitialDelegate>

@end

@implementation AdAppodeal

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // key
    //eeee4e1c555fb055153b45b9444be6636ca4ac238babdc69
    
    //sample code
    //https://github.com/appodeal/appodeal-ios-demo
    
   
    [Appodeal setInterstitialDelegate:self];
    [self performSelector:@selector(showAds) withObject:nil afterDelay:1];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showAds{
    NSString * placement = @"eeee4e1c555fb055153b45b9444be6636ca4ac238babdc69";
    if ([Appodeal canShowAd:AppodealShowStyleInterstitial forPlacement:placement]) {
        NSLog(@"showing ads.....");
        [Appodeal showAd:AppodealShowStyleInterstitial forPlacement:placement rootViewController:self];
    }else{
        NSLog(@"trying to show ads......");
        [self performSelector:@selector(showAds) withObject:nil afterDelay:1];
    }
}

#pragma mark - AppodealInterstitialDelegate

/*!
 *  Method called when precache (cheap and fast load) or usual interstitial view did load
 *  @warning If you want show only expensive ad, ignore this callback call with precache equal to YES
 *
 *  @param precache If precache is YES it's mean that precache loaded
 */
- (void)interstitialDidLoadAdisPrecache:(BOOL)precache{
    //[self showAds];
}

/*!
 *  Method called if interstitial mediation failed
 */
- (void)interstitialDidFailToLoadAd{
    NSLog(@"appodeal ads error...........");
    self.adFailWithCompletion(NO);
    [self.view removeFromSuperview];
}

/*!
 *  Method called if interstitial mediation was success, but ready ad network can't show ad or
 *  ad presentation was to frequently according your placement settings
 */
- (void)interstitialDidFailToPresent{
    
}

/*!
 *  Method called when interstitial will display on screen
 */
- (void)interstitialWillPresent{
    self.adFailWithCompletion(YES);
    [self.view removeFromSuperview];
}

/*!
 *  Method called after interstitial leave screeen
 */
- (void)interstitialDidDismiss{
    
}

/*!
 *  Method called when user tap on interstitial
 */
- (void)interstitialDidClick{
    
}

@end

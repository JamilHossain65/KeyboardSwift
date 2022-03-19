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

int count = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = CGRectZero;
    
    //sample code
    //https://github.com/appodeal/appodeal-ios-demo
    
    [Appodeal setInterstitialDelegate:self];
    //[Appodeal setTestingEnabled:FALSE];
    [Appodeal cacheAd:AppodealAdTypeInterstitial];
    //[Appodeal setLogLevel:APDLogLevelInfo];
    [self performSelector:@selector(showAds) withObject:nil afterDelay:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showAds{
    if ([Appodeal canShow:AppodealAdTypeInterstitial forPlacement:@"default"]) {
        NSLog(@"showing ads.....");
        [Appodeal showAd:AppodealShowStyleInterstitial forPlacement:@"default" rootViewController:self];
    } else {
        //NSLog(@"trying to show ads.....");
        [self performSelector:@selector(showAds) withObject:nil afterDelay:5];
        count += 1;
    }
}

#pragma mark - AppodealInterstitialDelegate

- (void)interstitialDidLoadAdisPrecache:(BOOL)precache{
    [Appodeal showAd:AppodealShowStyleInterstitial forPlacement:@"default" rootViewController:self];
}

- (void)interstitialDidFailToLoadAd{
    NSLog(@"appodeal ads error...........");
    if (count >= 5) {
       self.adFailWithCompletion(NO);
    }
}

- (void)interstitialWillPresent{
    self.adFailWithCompletion(true);
}

- (void)interstitialDidDismiss{
    self.adDismissWithCompletion(true);
}

- (void)interstitialDidClick{}

@end

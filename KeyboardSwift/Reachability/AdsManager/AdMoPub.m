//
//  AdMoPub.m
//  SmartKeyboard
//
//  Created by Jamil Hossain on 12/13/17.
//  Copyright © 2017 Jamil Hossain. All rights reserved.
//

#import "AdMoPub.h"

@interface AdMoPub ()
@property (nonatomic) MPInterstitialAdController *interstitial;
@end

@implementation AdMoPub

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadInterstitial];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)loadInterstitial {
    // Instantiate the interstitial using the class convenience method.
    self.interstitial = [MPInterstitialAdController
                         interstitialAdControllerForAdUnitId:@"32f060494c2a4466ad08bc37e2fde8be"];
    
    // Fetch the interstitial ad.
    [self.interstitial loadAd];
}

// Present the ad only after it is ready.
- (void)levelDidEnd {
    if (self.interstitial.ready) [self.interstitial showFromViewController:self];
    else {
        // The interstitial wasn't ready, so continue as usual.
    }
}

- (void)interstitialWillAppear:(MPInterstitialAdController *)interstitial {
    
}

- (void)interstitialDidDisappear:(MPInterstitialAdController *)interstitial {
    
}

@end

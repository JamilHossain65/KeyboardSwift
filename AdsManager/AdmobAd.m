//
//  AdmobAd.m
//  SmartKeyboard
//
//  Created by Jamil Hossain on 4/4/18.
//  Copyright © 2018 Jamil Hossain. All rights reserved.
//

#import "AdmobAd.h"

@interface AdmobAd ()

@end

@implementation AdmobAd

+(id)sharedInstance{
    static AdmobAd *sharedHandler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedHandler = [[self alloc] init];
        //;
    });
    
    return sharedHandler;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = CGRectZero;
    
    [self showAdsOn:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showAdsOn:(UIViewController*)viewController{
    NSLog(@"self.adKey::%@",self.admobAdKey);
    
    if ([self.admobAdKey length] <= 0){
        self.admobAdKey = @"ca-app-pub-9133033983333483/2368759846";
    }
    
    self.interstitial = [[GADInterstitial alloc] initWithAdUnitID:self.admobAdKey];
    self.interstitial.delegate = self;
    GADRequest *request = [GADRequest request];
    
    NSString *deviceID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSLog(@"deviceID::%@",deviceID);
    NSString *staticID = @"71A58269-B856-4864-BEE1-C50067623E75";
    //this check avoid admob policy violation
    if([deviceID isEqualToString:staticID]){
        GADMobileAds.sharedInstance.requestConfiguration.testDeviceIdentifiers = @[@"06fa119d4743dd21237899a32e0d1031"];
    }
    [self.interstitial loadRequest:request];
}

- (void)interstitialDidReceiveAd:(DFPInterstitial *)ad
{
    if (self.interstitial.isReady) {
        NSLog(@"Admob ad is ready");
        self.adFailWithCompletion(YES);
        [self.interstitial presentFromRootViewController:self];
    } else {
        NSLog(@"Admob ad wasn't ready");
        self.adFailWithCompletion(NO);
    }
}

- (void)interstitial:(GADInterstitial *)ad didFailToReceiveAdWithError:(GADRequestError *)error{
    NSLog(@"admob error:%@",error.localizedDescription);
    self.adFailWithCompletion(NO);
}

@end

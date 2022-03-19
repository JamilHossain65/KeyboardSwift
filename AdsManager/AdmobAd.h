//
//  AdmobAd.h
//  SmartKeyboard
//
//  Created by Jamil Hossain on 4/4/18.
//  Copyright © 2018 Jamil Hossain. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GoogleMobileAds.h>

@import GoogleMobileAds;

@interface AdmobAd : UIViewController<GADInterstitialDelegate>
@property(nonatomic, strong) GADInterstitial *interstitial;
@property(nonatomic, strong) NSString *admobAdKey;

@property (nonatomic, copy) void (^adFailWithCompletion)(BOOL success);

+(id)sharedInstance;

@end

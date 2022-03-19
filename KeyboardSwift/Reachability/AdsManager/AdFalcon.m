//
//  AdFalcon.m
//  SmartKeyboard
//
//  Created by Jamil Hossain on 11/21/17.
//  Copyright © 2017 Jamil Hossain. All rights reserved.
//

#import "AdFalcon.h"

@import AdFalconSDK;

@interface AdFalcon ()<ADFInterstitialAdDelegate>
{
    ADFInterstitialAd * adfInterstitial;
}
@end

@implementation AdFalcon

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //initialize ADFInterstitialAd
    adfInterstitial = [[ADFInterstitialAd alloc] init];
    //If you want to receive test ads
    //adView.testing = YES;
    //load new interstitial
    adfInterstitial.testing = NO;
    [adfInterstitial loadInterstitialWithSiteID:@"ec8a899b8f4b45c58a74397445bb7744" delegate:self];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.view removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadInterstitialWithSiteID:(NSString*) siteID testing:(BOOL) testing delegate:(NSObject<ADFInterstitialAdDelegate> *) delegate params:(ADFTargetingParams*) params{

    NSLog(@"testing::%d",testing);

}
-(void)adfInterstitialDidLoadAd: (ADFInterstitialAd*) adfInterstitial{
    [adfInterstitial presentFromRootViewController:self];
}
-(void)adfInterstitialDidDismissScreen: (ADFInterstitialAd*) adfInterstitial{
    
}
-(void)adfInterstitial: (ADFInterstitialAd*) adfInterstitial didFailWithErrorCode:(int) code message:(NSString*)message{
    NSLog(@"message::%@",message);
    self.adFailWithCompletion();
    [self.view removeFromSuperview];
    switch (code) {
        case kADFAdViewErrorNoAdAvailabe: // No Ad Availabe
            break;
        case kADFAdViewErrorInvalidParam:
            // Invalid Param send to server
            break;
        case kADFAdViewErrorMissingParam:
            // Missing Param send to server
            break;
        case kADFAdViewErrorCommunication:
            //Communication with server failed or no internet
            break;
        default:
            break;
            
    }
}


@end

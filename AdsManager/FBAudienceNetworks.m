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

//static NSInteger mins = 60;
//static NSInteger repeatedTime = 10;

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
    NSTimeInterval timeInterval = AD_MIN_TIME;
    [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(showInterstitalAd) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)showInterstitalAd {
    NSLog(@"InterstitalAd load");
    fbInterstitialAd = [[FBInterstitialAd alloc] initWithPlacementID:FB_PLACEMENT_ID];
    fbInterstitialAd.delegate = self;
    [FBAdSettings clearTestDevices];
    [FBAdSettings addTestDevice:[FBAdSettings testDeviceHash]];
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

@end

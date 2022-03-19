//
//  UnityAd.m
//  Keyboard
//
//  Created by Jamil Hossain on ২১/৭/১৭.
//  Copyright © ২০১৭ Jamil Hossain. All rights reserved.
//

#import "UnityAd.h"
#import "UnityAds/UnityAds.h"

@interface UnityAd ()<UnityAdsDelegate>

@end

/*
 //https://dashboard.unityads.unity3d.com
 email: jmlhossain65@gmail.com
 pass: Jamil123
 
 */

@implementation UnityAd

BOOL hasShownRewarderVideo = FALSE;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UnityAds initialize:@"1486851" delegate:self];//1488197 Digital Scanner

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Unity Ads delegate methods

- (void)unityAdsReady:(NSString *)placementId{
    NSLog(@"%@ is ready",placementId);
    if ([UnityAds isReady:@"rewardedVideo"] && !hasShownRewarderVideo) {
        [UnityAds show:self placementId:@"rewardedVideo"];
        hasShownRewarderVideo = YES;
    }
}

- (void)unityAdsDidStart:(NSString *)placementId{
    
}

- (void)unityAdsDidFinish:(NSString *)placementId withFinishState:(UnityAdsFinishState)state{
    NSLog(@"State:%ld",state);
}

- (void)unityAdsDidError:(UnityAdsError)error withMessage:(NSString *)message{
    
    self.adFailWithCompletion();
}

@end

//
//  FBAudienceNetworks.h
//  Keyboard
//
//  Created by Jamil Hossain on ৩০/১১/১৬.
//  Copyright © ২০১৬ Jamil Hossain. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FBAudienceDelegate <NSObject>
@optional

- (void)FBAudienceAdsDidComplete;

@end

@interface FBAudienceNetworks : UIViewController
{
    
}

@property (nonatomic, weak) id <FBAudienceDelegate> delegate;
@property (nonatomic, copy) void (^adFailWithCompletion)(BOOL success);

+ (id)sharedInstance;
- (void)loadFanRewardedVideoAd;
-(void)showRewardedVideoAd;
- (void)showNativeAd;

@end

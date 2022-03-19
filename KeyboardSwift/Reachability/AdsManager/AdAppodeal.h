//
//  AdAppodeal.h
//  SmartKeyboard
//
//  Created by Jamil Hossain on 12/12/17.
//  Copyright © 2017 Jamil Hossain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdAppodeal : UIViewController
@property (nonatomic, copy) void (^adFailWithCompletion)(BOOL success);
@end

//
//  KeyCapView.h
//  KeyboardExtension
//
//  Created by Jamil on 27/2/21.
//

#import <UIKit/UIKit.h>
#import "JHKey.h"

NS_ASSUME_NONNULL_BEGIN

@interface KeyCapView : UIView

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *characterKeys;

@end

NS_ASSUME_NONNULL_END

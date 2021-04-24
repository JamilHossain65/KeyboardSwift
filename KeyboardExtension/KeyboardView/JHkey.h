//
//  JHkey.h
//  KeyboardExtension
//
//  Created by Jamil on 27/2/21.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ACHintPosition) {
    ACHintPositionFarLeft,
    ACHintPositionLeft,
    ACHintPositionRight,
    ACHintPositionFarRight
};

typedef NS_ENUM(NSUInteger, appearance) { //todo need to check either right
    ACKeyAppearanceDark,
    ACKeyAppearanceLight
};


NS_ASSUME_NONNULL_BEGIN

@interface JHkey : UIButton

/** The position for long-tap hint - for "a" ACHintPositionFarLeft
 */
@property (nonatomic, assign) enum ACHintPosition hintPosition;

/** List of strings for showing in hint popup
 */
@property (nonatomic, strong) NSArray *hintSymbolsList;
@property (nonatomic,   weak) NSTimer *hidePopupTimer;
@property (nonatomic,   weak) NSTimer *showHintTimer;
@property (nonatomic, strong) UIView  *hintView;
@property (nonatomic, strong) NSArray *hintButtons;
@property (nonatomic, assign) CGFloat hintAdditionalWidth;

@end

NS_ASSUME_NONNULL_END

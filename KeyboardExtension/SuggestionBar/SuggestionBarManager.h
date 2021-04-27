//
//  SuggestionBarManager.h
//  TOMSSuggestionBarExample
//
//  Created by Jamil Hossain on ১/৭/১৭.
//  Copyright © ২০১৭ TomKnig. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// ====================================================================
@protocol SuggestionBarDelegate

- (void)nextDidTouchDown;
- (void)previousDidTouchDown;
- (void)doneDidTouchDown;

//Suggestion button selected
- (void)suggestionDidSelect:(NSString*)suggestion;


@end

@interface SuggestionBarManager : NSObject

@property (nonatomic, strong) id <SuggestionBarDelegate> delegate;


//shared instance method
+ (id)sharedInstance;


//- (UIToolbar *)getToolbarWithPrevEnabled:(BOOL)prevEnabled NextEnabled:(BOOL)nextEnabled DoneEnabled:(BOOL)doneEnabled;

//-(void)reloadToolbarSuggestionWordsWithContext:(NSString*)context;
-(void)reloadCustomSuggestionWordsWithContext:(NSString*)context;

-(void)addSuggestionBar:(UITextView*)parentView subview:(UIView*)txtView;


//mock database
//- (void)mockSomePersons;
-(NSArray*)getBanglaWord;


@end

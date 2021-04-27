//
//  SuggestionBarManager.m
//  TOMSSuggestionBarExample
//
//  Created by Jamil Hossain on ১/৭/১৭.
//  Copyright © ২০১৭ TomKnig. All rights reserved.
//

#import "SuggestionBarManager.h"

UIButton *sgButton1,*sgButton2,*sgButton3,*sgButton4,*sgButton5,*sgButton6,*sgButton7,*sgButton8,*sgButton9,*sgButton10;
NSArray *wordArray;

//UI Suggestion bar
UIView *suggestionBarView;
UIScrollView *suggestionBarScrollView;
int barHeight = 36;

#define MAX_WORD 10

@implementation SuggestionBarManager

+ (id)sharedInstance{
    static SuggestionBarManager *sharedHandler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedHandler = [[self alloc] init];
    });
    return sharedHandler;
}

//- (NSArray *)mockedNames
//{
//    return @[
//             @"Steve",
//             @"Steven",
//             @"Sandra",
//             @"Estefania",
//             @"Stephen",
//             @"Shalymar",
//             @"Stephano",
//             @"কাকা",
//             @"জামিল",
//             @"লাবনী"
//             ];
//}
//
//- (void)mockSomePersons
//{
//    NSManagedObjectContext *managedObjectContext = [TOMSCoreDataManager managerForModelName:@"Model"].managedObjectContext;
//    
//    for (NSString *name in [self mockedNames]) {// getBanglaWords
//        [Person toms_newObjectFromDictionary:@{@"name": name}
//                                   inContext:managedObjectContext
//                             autoSaveContext:NO];
//    }
//    
//}


-(void)addSuggestionBar:(UIView*)parentView subview:(UITextView*)txtView{
    wordArray = [[SuggestionBarManager sharedInstance] getBanglaWord];
    //wordArray = [[NSArray alloc]initWithObjects:@"কান্ত",@"খা",@"খাকি",@"কি",@"কী",@"কাকতালিয়",@"কাকা",@"আচানক",@"চুরমার",@"চানাচুর",@"পাগল",@"গলদ",@"ছাগল",@"বাবা",@"বাবর",@"আবার",@"কাকে",@"কিন্তু", nil];
    NSLog(@"init total words:%ld",wordArray.count);
    
    //wordDicArray = [[KBNSearchEngine sharedInstance] getAllWordsWithDictionaryOfArray:wordArray];
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    
    CGFloat _expandedHeight = 216 + barHeight;//216
    
    
    //Add suggestion bar
    int border = 1;
    int index = 0;
    int screenWidth              = [[UIScreen mainScreen] bounds].size.width-2*border;
    int buttonWidth              = screenWidth/3;
    
    
    sgButton1          = [UIButton buttonWithType:UIButtonTypeSystem];
    sgButton1.frame              = CGRectMake(index*(buttonWidth+border) ,0, buttonWidth, barHeight);
    sgButton1.backgroundColor    = [self color:174 g:179 b:189];
    [sgButton1 setTitle:@"" forState:UIControlStateNormal];
    [sgButton1 addTarget:self action:@selector(suggestionButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    sgButton2 = [UIButton buttonWithType:UIButtonTypeSystem];
    sgButton2.frame     = CGRectMake(++index*(buttonWidth + border) ,0, buttonWidth, barHeight);
    [sgButton2 setTitle:@"" forState:UIControlStateNormal];
    sgButton2.backgroundColor    = [self color:174 g:179 b:189];
    [sgButton2 addTarget:self action:@selector(suggestionButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    sgButton3 = [UIButton buttonWithType:UIButtonTypeSystem];
    sgButton3.frame     = CGRectMake(++index*(buttonWidth + border) ,0, buttonWidth, barHeight);
    [sgButton3 setTitle:@"" forState:UIControlStateNormal];
    sgButton3.backgroundColor    = [self color:174 g:179 b:189];
    [sgButton3 addTarget:self action:@selector(suggestionButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    sgButton4 = [UIButton buttonWithType:UIButtonTypeSystem];
    sgButton4.frame     = CGRectMake(++index*(buttonWidth + border) ,0, buttonWidth, barHeight);
    [sgButton4 setTitle:@"" forState:UIControlStateNormal];
    sgButton4.backgroundColor    = [self color:174 g:179 b:189];
    [sgButton4 addTarget:self action:@selector(suggestionButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    sgButton5 = [UIButton buttonWithType:UIButtonTypeSystem];
    sgButton5.frame     = CGRectMake(++index*(buttonWidth + border) ,0, buttonWidth, barHeight);
    [sgButton5 setTitle:@"" forState:UIControlStateNormal];
    sgButton5.backgroundColor    = [self color:174 g:179 b:189];
    [sgButton5 addTarget:self action:@selector(suggestionButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    sgButton6 = [UIButton buttonWithType:UIButtonTypeSystem];
    sgButton6.frame     = CGRectMake(++index*(buttonWidth + border) ,0, buttonWidth, barHeight);
    [sgButton6 setTitle:@"" forState:UIControlStateNormal];
    sgButton6.backgroundColor    = [self color:174 g:179 b:189];
    [sgButton6 addTarget:self action:@selector(suggestionButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    sgButton7 = [UIButton buttonWithType:UIButtonTypeSystem];
    sgButton7.frame     = CGRectMake(++index*(buttonWidth + border) ,0, buttonWidth, barHeight);
    [sgButton7 setTitle:@"" forState:UIControlStateNormal];
    sgButton7.backgroundColor    = [self color:174 g:179 b:189];
    [sgButton7 addTarget:self action:@selector(suggestionButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    sgButton8 = [UIButton buttonWithType:UIButtonTypeSystem];
    sgButton8.frame     = CGRectMake(++index*(buttonWidth + border) ,0, buttonWidth, barHeight);
    [sgButton8 setTitle:@"" forState:UIControlStateNormal];
    sgButton8.backgroundColor    = [self color:174 g:179 b:189];
    [sgButton8 addTarget:self action:@selector(suggestionButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    sgButton9 = [UIButton buttonWithType:UIButtonTypeSystem];
    sgButton9.frame     = CGRectMake(++index*(buttonWidth + border) ,0, buttonWidth, barHeight);
    [sgButton9 setTitle:@"" forState:UIControlStateNormal];
    sgButton9.backgroundColor    = [self color:174 g:179 b:189];
    [sgButton9 addTarget:self action:@selector(suggestionButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    sgButton10 = [UIButton buttonWithType:UIButtonTypeSystem];
    sgButton10.frame     = CGRectMake(++index*(buttonWidth + border) ,0, buttonWidth, barHeight);
    [sgButton10 setTitle:@"" forState:UIControlStateNormal];
    sgButton10.backgroundColor    = [self color:174 g:179 b:189];
    [sgButton10 addTarget:self action:@selector(suggestionButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    //Keyboard bar
    suggestionBarScrollView          = [[UIScrollView alloc] initWithFrame:CGRectZero];
    suggestionBarScrollView.frame = CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, barHeight);
    //barScrollView.delegate = self;
    suggestionBarScrollView.backgroundColor  = [UIColor colorWithRed:211/255.0 green:213/255.0 blue:219/255.0 alpha:1.0];
    suggestionBarScrollView.bounces = NO;
    suggestionBarScrollView.scrollEnabled = NO;
    suggestionBarScrollView.showsHorizontalScrollIndicator = NO;
    suggestionBarScrollView.contentSize = CGSizeMake(++index*(buttonWidth + border), suggestionBarScrollView.contentSize.height);
    //[parentView addSubview: suggestionBarScrollView];
    
    [suggestionBarScrollView addSubview:sgButton1];
    [suggestionBarScrollView addSubview:sgButton2];
    [suggestionBarScrollView addSubview:sgButton3];
    [suggestionBarScrollView addSubview:sgButton4];
    [suggestionBarScrollView addSubview:sgButton5];
    [suggestionBarScrollView addSubview:sgButton6];
    [suggestionBarScrollView addSubview:sgButton7];
    [suggestionBarScrollView addSubview:sgButton8];
    [suggestionBarScrollView addSubview:sgButton9];
    [suggestionBarScrollView addSubview:sgButton10];
    
    
    //Keyboard bar
    UIView *barView         = [[UIView alloc] initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] bounds].size.width, barHeight)];
    barView.backgroundColor = [UIColor clearColor];
    [parentView addSubview:barView];
    [barView addSubview:suggestionBarScrollView];
    [barView sizeToFit];
    //
    [txtView sizeToFit];
    txtView.translatesAutoresizingMaskIntoConstraints = NO;
    [txtView.leftAnchor constraintEqualToAnchor:parentView.leftAnchor].active = YES;
    [barView.bottomAnchor constraintEqualToAnchor:parentView.topAnchor].active = YES;
    
    //CGFloat _expandedHeight = 252;//193;//252;
    NSLayoutConstraint *_heightConstraint = [NSLayoutConstraint constraintWithItem:parentView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant: _expandedHeight];
    [parentView addConstraint: _heightConstraint];
    
}

-(void)reloadCustomSuggestionWordsWithContext:(NSString*)context{
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        //Background Thread
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF LIKE[cd] %@",[NSString stringWithFormat:@"%@*", context]];
        NSArray   *sgWordArray = [wordArray filteredArrayUsingPredicate:predicate];
        
        for(int i=0;i<MAX_WORD;i++){
            if(i<MAX_WORD){
                sgWordArray = [sgWordArray arrayByAddingObject:@""];
            }else{break;}
        }
        
        dispatch_async(dispatch_get_main_queue(), ^(void){
            if(sgWordArray.count>=MAX_WORD){
                [sgButton1 setTitle:sgWordArray[0] forState:UIControlStateNormal];
                [sgButton2 setTitle:sgWordArray[1] forState:UIControlStateNormal];
                [sgButton3 setTitle:sgWordArray[2] forState:UIControlStateNormal];
                //
                [sgButton4 setTitle:sgWordArray[3] forState:UIControlStateNormal];
                [sgButton5 setTitle:sgWordArray[4] forState:UIControlStateNormal];
                [sgButton6 setTitle:sgWordArray[5] forState:UIControlStateNormal];
                [sgButton7 setTitle:sgWordArray[6] forState:UIControlStateNormal];
                [sgButton8 setTitle:sgWordArray[7] forState:UIControlStateNormal];
                [sgButton9 setTitle:sgWordArray[8] forState:UIControlStateNormal];
                [sgButton10 setTitle:sgWordArray[9] forState:UIControlStateNormal];
            }
            
        });
    });
}

-(NSPredicate*)getPredicate:(NSString*)context{
    //return [NSPredicate predicateWithFormat:@"%K LIKE[cd] %@", attributeName, [NSString stringWithFormat:@"*%@*", context]];
    return nil;
}

// --------------------------------------------------------------------
- (void)nextPrevHandlerDidChange:(id)sender
{
    if (!self.delegate) return;
    
    switch ([(UISegmentedControl *)sender selectedSegmentIndex])
    {
        case 0:
            //NSLog(@"Previous");
            [self.delegate previousDidTouchDown];
            break;
        case 1:
            //NSLog(@"Next");
            [self.delegate nextDidTouchDown];
            break;
        default:
            break;
    }
}

-(UIColor*)color:(int)r g:(int)g b:(int)b{
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}

// --------------------------------------------------------------------
- (void)suggestionButtonDidClick:(id)sender
{
    
    if (!self.delegate) return;
    
    if([sender isKindOfClass:[UIBarButtonItem class]]){
        UIBarButtonItem *btn = (UIBarButtonItem*)sender;
        [self.delegate suggestionDidSelect:btn.title];
    }else if([sender isKindOfClass:[UIButton class]]){
        UIButton *btn = (UIButton*)sender;
        [self.delegate suggestionDidSelect:btn.titleLabel.text];
    }
    
}

// --------------------------------------------------------------------
- (void)doneDidClick:(id)sender
{
    if (!self.delegate) return;
    
    //NSLog(@"Done");
    [self.delegate doneDidTouchDown];
}

#pragma mark - Database Mocks

-(NSArray*)getBanglaWord{
    
    NSString *wordString = [self readFileWith:@"word" fileType:@"txt"];
    
    NSArray *wordArray = [wordString componentsSeparatedByString:@"\n"];
    NSLog(@"total word:%ld",wordArray.count);
    
    NSMutableArray *banglaWordsArray = [NSMutableArray new];
    
    banglaWordsArray = [wordArray valueForKeyPath:@"@distinctUnionOfObjects.self"];
    NSLog(@"unique word::[%ld]",banglaWordsArray.count);
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"self" ascending: YES];
    banglaWordsArray = (NSMutableArray*)[banglaWordsArray sortedArrayUsingDescriptors: [NSArray arrayWithObject:sortDescriptor]];
    
    //*
    [[SuggestionBarManager sharedInstance] writeToTextFile:banglaWordsArray];
    //[[SuggestionBarManager sharedInstance] ShowContentlist];
    //*/
    return (NSArray*)banglaWordsArray;
}

-(NSString*)readFileWith:(NSString*)fileName fileType:(NSString*)fType{
    NSString *pathName = [[NSBundle mainBundle] pathForResource:fileName
                                                         ofType:fType];
    //Then loading the content into a NSString is even easier.
    NSError *error = nil;
    NSString *content = [NSString stringWithContentsOfFile:pathName
                                                  encoding:NSUTF8StringEncoding
                                                     error:&error];
    
    NSLog(@"content:::%@",error);
    return content;
}

-(void)writeToTextFile:(NSArray*)contentArray{
    
    NSString *wdString = [contentArray componentsJoinedByString:@"\n"];
    //NSLog(@"wdString:::%@",wdString);
    
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //make a file name to write the data to using the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/word.txt",
                          documentsDirectory];
    //NSString *content = @"This is Demo\nThis is Demo";
    [wdString writeToFile:fileName
               atomically:NO
                 encoding:NSUTF8StringEncoding
                    error:&error];
    
    NSLog(@"Path\n%@",paths);
    
}

-(void)ShowContentlist{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"%@/word.txt",
                          documentsDirectory];
    NSString *content = [[NSString alloc] initWithContentsOfFile:fileName
                                                        encoding:NSUTF8StringEncoding
                                                           error:nil];
    //NSLog(@"content::%@",content);
}

@end

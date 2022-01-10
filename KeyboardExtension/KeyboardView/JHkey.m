//
//  JHkey.m
//  KeyboardExtension
//
//  Created by Jamil on 27/2/21.
//

#import "JHkey.h"
#define ACKEY_OVERLAY_KEY -12

#define kNotificationHideButtonPopup @"kNotificationHideButtonPopup"

#define ACKEY_POPUP_VIEV_TAG -13 //todo

#define kKeyPopapAppearDuration 0.00

#define kKeyPopapStayAliveInterval 0.00


#define __FAR_SHIFT         (12 * [[UIScreen mainScreen] scale])
#define __UPPER_WIDTH       (55.0 * [[UIScreen mainScreen] scale])
#define __LOWER_WIDTH       (self.frame.size.width * [[UIScreen mainScreen] scale])
#define __PAN_UPPER_RADIUS  (10.0 * [[UIScreen mainScreen] scale])
#define __PAN_LOWER_RADIUS  (5.0 * [[UIScreen mainScreen] scale])
#define __PAN_UPPDER_WIDTH  (__UPPER_WIDTH-__PAN_UPPER_RADIUS*2)
#define __PAN_UPPER_HEIGHT  (56.0 * [[UIScreen mainScreen] scale])
#define __PAN_LOWER_WIDTH   (__LOWER_WIDTH-__PAN_LOWER_RADIUS*2)
#define __PAN_LOWER_HEIGHT  (47.0 * [[UIScreen mainScreen] scale])
#define __PAN_UL_WIDTH      ((__UPPER_WIDTH-__LOWER_WIDTH)/2)
#define __PAN_MIDDLE_HEIGHT (2.0 * [[UIScreen mainScreen] scale])
#define __PAN_CURVE_SIZE    (10.0 * [[UIScreen mainScreen] scale])
#define __PADDING_X         (15 * [[UIScreen mainScreen] scale])
#define __PADDING_Y         (10 * [[UIScreen mainScreen] scale])
#define __WIDTH             (__UPPER_WIDTH + __PADDING_X*2)
#define __HEIGHT            (__PAN_UPPER_HEIGHT + __PAN_MIDDLE_HEIGHT + __PAN_LOWER_HEIGHT + __PADDING_Y*2)
#define __OFFSET_X          (-25 * [[UIScreen mainScreen] scale])
#define __OFFSET_Y          (59 * [[UIScreen mainScreen] scale])
#define __GAP_X             (3 * [[UIScreen mainScreen] scale])


@implementation JHkey


- (void)drawRect:(CGRect)rect {

}

-(void)checkHintPosition:(UIButton*)keyButton{
    //let kRowKeys = [10,9,9,4]
    NSArray *rowKeys = [NSArray arrayWithObjects:@10,@9,@9,@5, nil];
    int value = 0;
    int index = 0;
    long tagValue = keyButton.tag + 1;
    //NSLog(@"keyButton tag::%ld",tagValue);
    
    while (index < rowKeys.count) {
        int rowValue = [rowKeys[index] intValue];
        value += rowValue;
        
        if (value >= tagValue){
            int halfvalue = rowValue/2;
            int pos = value - halfvalue;
            
            //NSLog(@"value::%d",value);
            //NSLog(@"pos::%d",pos);
            
            if(pos >= tagValue){
                switch (tagValue) {
                    case 1:
                        self.hintPosition = ACHintPositionFarLeft;
                        break;
                        
                    default:
                        self.hintPosition = ACHintPositionLeft;
                        break;
                }
                
            }else{
                switch (tagValue) {
                    case 10:
                        self.hintPosition = ACHintPositionFarRight;
                        break;
                        
                    default:
                        self.hintPosition = ACHintPositionRight;
                        break;
                }
                
            }
            return;
        }
        
        index += 1;
    }
}

-(void)gestureHandler:(UILongPressGestureRecognizer*)gesture {
    if(UIGestureRecognizerStateBegan == gesture.state) {
        NSLog(@"gestureHandler");
        [self startShowHintTimer]; //todo enable it for long pressed mutiple keys
    }
}

-(NSString*)trim:(NSString*)text{
    NSString *mText = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return  mText;
}

- (void)addPopupToButton:(UIButton*)button {
    
    [self hidePopup];
    
    [self checkHintPosition:button];
    
    NSUserDefaults *defaults =  [NSUserDefaults standardUserDefaults];
    NSString *hintString = [defaults valueForKey:@"kSelectedHintString"];
    //NSLog(@"hintString: %@",hintString);
    
    NSString *title = button.titleLabel.text;
    NSArray  *array = [hintString componentsSeparatedByString:@","];//hintsList
    
    for(NSString *text in array){
        NSArray *letters = [[self trim:text] componentsSeparatedByString:@" "];
        
        if([letters.firstObject isEqual:[self trim:title]]){
            self.hintSymbolsList = letters;
            NSMutableArray *newArray = [NSMutableArray new];
            for (NSString *txt in self.hintSymbolsList){
                [newArray addObject:[self trim:txt]];
            }
            self.hintSymbolsList = newArray;
            NSLog(@"letters::%@",self.hintSymbolsList);
            
            break;
        }
    }
    
    //self.hintSymbolsList = [[NSArray alloc] initWithObjects:@"a",@"b",@"c",@"d",@"e", nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationHideButtonPopup
                                                        object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hidePopup)
                                                 name:kNotificationHideButtonPopup
                                               object:nil];
    
    if (true/*b.titleLabel.text.length && b.titleLabel.text.length == 1*/){
        
        UIImageView *keyPop = nil;
        
        if (/*self.appearance == ACKeyAppearanceClearWhite*/false) {//todo
            keyPop = [[UIImageView alloc] initWithFrame:CGRectMake(-3,
                                                                   -4.5,
                                                                   self.frame.size.width+6,
                                                                   self.frame.size.height+9)];
            
            keyPop.backgroundColor = [UIColor colorWithRed: 19/255.0
                                                     green:160/255.0
                                                      blue:237/255.0
                                                     alpha:0.3];
            
        } else {
            UIImage* image = [self keytopImage];
            
            keyPop = [[UIImageView alloc] initWithImage:image];
            keyPop.frame = CGRectMake((self.frame.size.width - image.size.width) / 2,
                                      -71,
                                      keyPop.frame.size.width,
                                      keyPop.frame.size.height);
            
            CGFloat shift = 0;
            CGFloat amount = self.frame.size.width/3;
            if (self.hintPosition == ACHintPositionFarLeft) {
                shift = amount;
            }else if (self.hintPosition == ACHintPositionFarRight) {
                shift = -amount;
            }
            
            UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(shift, 10, keyPop.frame.size.width, 60)];
            
            [text setFont:[UIFont systemFontOfSize:35]];
            [text setTextAlignment:NSTextAlignmentCenter];
            [text setBackgroundColor:[UIColor clearColor]];
            [text setAdjustsFontSizeToFitWidth:YES];
            [text setText:button.titleLabel.text];
            [text setTextColor:button.titleLabel.textColor];
            
            keyPop.layer.shadowColor    = [UIColor colorWithWhite:0.1 alpha:1.0].CGColor;
            keyPop.layer.shadowOffset   = CGSizeMake(0, 2.0);
            keyPop.layer.shadowOpacity  = 0.30;
            keyPop.layer.shadowRadius   = 3.0;
            keyPop.clipsToBounds        = NO;
            
            [keyPop addSubview:text];
        }
        
        [keyPop setTag:ACKEY_POPUP_VIEV_TAG];
        [keyPop setAlpha:1.0];
        [button addSubview:keyPop];
        
        [UIView animateWithDuration:kKeyPopapAppearDuration
                         animations:^{
                             [keyPop setAlpha:1.0];
                         }];
        
//        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(gestureHandler:)];
//        [longPressGesture setMinimumPressDuration:0.6];
//        [button addGestureRecognizer:longPressGesture];
        
        NSLog(@"tap tag::%ld",(long)button.tag);
        
        [self startShowHintTimer]; //todo enable for keycap overlay view
    }
}

- (void)showKeyCapView {
    
    if (!self.hintSymbolsList || ![self.hintSymbolsList count]) {
        //NSLog(@"tap tag::%ld",(long)self.tag);
        return;
    }
    
    if ([self.delegate conformsToProtocol:@protocol(JHkeyDelegate)]) {
        [self.delegate didTapLongOnButton:self];
        NSLog(@"tap long::%@",self.titleLabel.text);
    }
    NSLog(@"hintSymbolsList::%@", self.hintSymbolsList);
    [self setHighlighted:NO];
    [self setSelected:NO];
    [self updateState];
    
    [self hidePopup];
    
    UIImage* image = [self hintImage];
    
    //NSLog(@"image::%@",image);
    
    self.hintView = [[UIImageView alloc] initWithImage:image];
    BOOL isRightHint = self.hintPosition == ACHintPositionFarRight || self.hintPosition == ACHintPositionRight;
    CGFloat xPos;
    if (isRightHint) {
        xPos = (self.frame.size.width - (image.size.width + self.hintAdditionalWidth/2))/2;
    } else { //ACHintPositionLeft & ACHintPositionFarLeft
        xPos = -27;
    }
    
    self.hintView.frame = CGRectMake(xPos,
                                     -71,
                                     self.hintView.frame.size.width,
                                     self.hintView.frame.size.height);
    
    self.hintView.layer.shadowColor   = [UIColor colorWithWhite:0.1 alpha:1.0].CGColor;
    self.hintView.layer.shadowOffset  = CGSizeMake(0, 2.0);
    self.hintView.layer.shadowOpacity = 0.30;
    self.hintView.layer.shadowRadius  = 3.0;
    self.hintView.clipsToBounds       = NO;
    
    UIButton *button;
    NSString *hint;
    
    NSMutableArray *hintStrings = [NSMutableArray array];
    if (isRightHint) {
        for (int i = (int)[self.hintSymbolsList count]-1; i >= 0; i--) {
            [hintStrings addObject:self.hintSymbolsList[i]];
        }
    }else{
        [hintStrings addObjectsFromArray: self.hintSymbolsList];
    }
    
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i=0; i<[self.hintSymbolsList count]; i++) {
        
        hint = [hintStrings objectAtIndex:i];
        button  = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(__PAN_UL_WIDTH+i*(self.frame.size.width+__GAP_X)+(isRightHint?0:__GAP_X-1),
                                  20,
                                  self.frame.size.width,
                                  self.frame.size.height);
        [button setTitle:hint forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        UIColor *blueColor  = [UIColor colorWithRed:3/255.0 green:122/255.0 blue:1.0 alpha:1.0];
        UIImage *imageBlue  = [JHkey imageWithColor:blueColor];
        UIImage *imageWhite = [JHkey imageWithColor:UIColor.whiteColor];
        [button setBackgroundImage:imageBlue  forState:UIControlStateHighlighted];
        [button setBackgroundImage:imageWhite forState:UIControlStateNormal];

        button.layer.masksToBounds = true;
        button.layer.cornerRadius  = 5.0;
        
        [self.hintView addSubview:button];
        [mArray addObject:button];
    }
    
    if (isRightHint) {
        [mArray.lastObject setHighlighted:YES];
    } else {
        [mArray.firstObject setHighlighted:YES];
    }
    
    self.hintButtons = mArray;
    
    self.hintView.layer.shadowColor   = [UIColor colorWithWhite:0.1 alpha:1.0].CGColor;
    self.hintView.layer.shadowOffset  = CGSizeMake(0, 2.0);
    self.hintView.layer.shadowOpacity = 0.40;
    self.hintView.layer.shadowRadius  = 3.0;
    self.hintView.clipsToBounds       = NO;
    
    [self addSubview:self.hintView];
}

-(BOOL)getIsRightHint{
    BOOL isRightHint = self.hintPosition == ACHintPositionFarRight || self.hintPosition == ACHintPositionRight;
    CGFloat xPos;
    if (isRightHint) {
        xPos = (self.frame.size.width - ([self hintImage].size.width + self.hintAdditionalWidth/2))/2;
    } else { //ACHintPositionLeft & ACHintPositionFarLeft
        xPos = -27;
    }
    return  isRightHint;
}

// scheme
/*

    1       2
    _______>  3
13 /        \
   |        |
12 |        | 4
   \        /
11  \      /  5
   10|    |
     |    | 6
   9 \<---/ 7
      8
 
     1       2
      _______>_______  3
  13 /               \
     |               |
  12 |               | 4
     \   5.2  _______/5.1
  11  \      /  5.3
     10|    |
       |    | 6
     9 \<---/ 7
       8
 
 */

- (UIImage *)keytopImage {
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPoint p = CGPointMake(__PADDING_X, __PADDING_Y);
    CGPoint p1 = CGPointZero;
    CGPoint p2 = CGPointZero;
    //1
    p.x += __PAN_UPPER_RADIUS;
    CGPathMoveToPoint(path, NULL, p.x, p.y);
    //2
    p.x += __PAN_UPPDER_WIDTH;
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    //3
    p.y += __PAN_UPPER_RADIUS;
    CGPathAddArc(path, NULL,
                 p.x, p.y,
                 __PAN_UPPER_RADIUS,
                 3.0*M_PI/2.0,
                 4.0*M_PI/2.0,
                 false);
    //4
    p.x += __PAN_UPPER_RADIUS;
    p.y += __PAN_UPPER_HEIGHT - __PAN_UPPER_RADIUS - __PAN_CURVE_SIZE;
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    //5
    p1 = CGPointMake(p.x, p.y + __PAN_CURVE_SIZE);
    switch (self.hintPosition) {
        case ACHintPositionFarRight:
            p.x -= __PAN_UL_WIDTH*2;
            break;
            
        case ACHintPositionLeft:
        case ACHintPositionRight:
            p.x -= __PAN_UL_WIDTH;
            break;
            
        case ACHintPositionFarLeft:
            break;
    }
    p.y += __PAN_MIDDLE_HEIGHT + __PAN_CURVE_SIZE*2;
    p2 = CGPointMake(p.x, p.y - __PAN_CURVE_SIZE);
    CGPathAddCurveToPoint(path, NULL,
                          p1.x, p1.y,
                          p2.x, p2.y,
                          p.x, p.y);
    //6
    p.y += __PAN_LOWER_HEIGHT - __PAN_CURVE_SIZE - __PAN_LOWER_RADIUS;
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    //7
    p.x -= __PAN_LOWER_RADIUS;
    CGPathAddArc(path, NULL,
                 p.x, p.y,
                 __PAN_LOWER_RADIUS,
                 4.0*M_PI/2.0,
                 1.0*M_PI/2.0,
                 false);
    //8
    p.x -= __PAN_LOWER_WIDTH;
    p.y += __PAN_LOWER_RADIUS;
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    //9
    p.y -= __PAN_LOWER_RADIUS;
    CGPathAddArc(path, NULL,
                 p.x, p.y,
                 __PAN_LOWER_RADIUS,
                 1.0*M_PI/2.0,
                 2.0*M_PI/2.0,
                 false);
    //10
    p.x -= __PAN_LOWER_RADIUS;
    p.y -= __PAN_LOWER_HEIGHT - __PAN_LOWER_RADIUS - __PAN_CURVE_SIZE;
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    //11
    p1 = CGPointMake(p.x, p.y - __PAN_CURVE_SIZE);
    switch (self.hintPosition) {
        case ACHintPositionFarRight:
            break;
            
        case ACHintPositionLeft:
        case ACHintPositionRight:
            p.x -= __PAN_UL_WIDTH;
            break;
            
        case ACHintPositionFarLeft:
            p.x -= __PAN_UL_WIDTH*2;
            break;
    }
    p.y -= __PAN_MIDDLE_HEIGHT + __PAN_CURVE_SIZE*2;
    p2 = CGPointMake(p.x, p.y + __PAN_CURVE_SIZE);
    CGPathAddCurveToPoint(path, NULL,
                          p1.x, p1.y,
                          p2.x, p2.y,
                          p.x, p.y);
    //12
    p.y -= __PAN_UPPER_HEIGHT - __PAN_UPPER_RADIUS - __PAN_CURVE_SIZE;
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    //13
    p.x += __PAN_UPPER_RADIUS;
    CGPathAddArc(path, NULL,
                 p.x, p.y,
                 __PAN_UPPER_RADIUS,
                 2.0*M_PI/2.0,
                 3.0*M_PI/2.0,
                 false);
    //----
    CGContextRef context;
    UIGraphicsBeginImageContext(CGSizeMake(__WIDTH,
                                           __HEIGHT));
    context = UIGraphicsGetCurrentContext();
    
    switch (self.hintPosition) {
        case ACHintPositionFarRight:
            CGContextTranslateCTM(context, __FAR_SHIFT, __HEIGHT);
            break;
            
        case ACHintPositionLeft:
        case ACHintPositionRight:
            CGContextTranslateCTM(context, 0.0, __HEIGHT);
            break;
            
        case ACHintPositionFarLeft:
            CGContextTranslateCTM(context, (-1)*__FAR_SHIFT, __HEIGHT);
            break;
    }
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextAddPath(context, path);
    CGContextClip(context);
    
    //----
    
    CGRect frame = CGPathGetBoundingBox(path);
    CGColorRef backColor = [UIColor whiteColor].CGColor;//todo enable code
//    switch (self.appearance) {
//        case ACKeyAppearanceDark:
//            backColor = [ACDarkAppearance lightKeyColor].CGColor;
//            break;
//
//        case ACKeyAppearanceLight:
//            backColor = [ACLightAppearance lightKeyColor].CGColor;
//            break;
//
//        default:
//            break;
//    }
    CGContextSetFillColorWithColor(context, backColor);
    CGContextFillRect(context, frame);
    
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    
    UIImage * image = [UIImage imageWithCGImage:imageRef scale:[[UIScreen mainScreen] scale] orientation:UIImageOrientationDown];
    CGImageRelease(imageRef);
    
    UIGraphicsEndImageContext();
    
    
    CFRelease(path);
    
    return image;
}

- (UIImage*)hintImage {
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPoint p = CGPointMake(__PADDING_X, __PADDING_Y);
    CGPoint p1 = CGPointZero;
    CGPoint p2 = CGPointZero;
    //1
    p.x += __PAN_UPPER_RADIUS;
    CGPathMoveToPoint(path, NULL, p.x, p.y);
    
    NSUInteger hintCount = [self.hintSymbolsList count];
    //!!!:magic numbers
    self.hintAdditionalWidth = 2*(hintCount-1)*(self.frame.size.width+__GAP_X);
    
    //2
    p.x += __PAN_UPPDER_WIDTH + self.hintAdditionalWidth;
    //!!!:+hintCount*(__PAN_LOWER_WIDTH+__GAP_X);
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    
    //3
    p.y += __PAN_UPPER_RADIUS;
    CGPathAddArc(path, NULL,
                 p.x, p.y,
                 __PAN_UPPER_RADIUS,
                 3.0*M_PI/2.0,
                 4.0*M_PI/2.0,
                 false);
    p.x += __PAN_UPPER_RADIUS;
    
    //4
    p.y += __PAN_UPPER_HEIGHT - __PAN_UPPER_RADIUS;
    if (self.hintPosition == ACHintPositionFarRight ||
        self.hintPosition == ACHintPositionRight) {
        p.y += - 2*__PAN_UPPER_RADIUS + __PAN_CURVE_SIZE + __PAN_MIDDLE_HEIGHT;
    } else { //ACHintPositionLeft & ACHintPositionFarLeft
        p.y -= __PAN_CURVE_SIZE;
    }
    CGPathAddLineToPoint(path, NULL, p.x, p.y);

    if (self.hintPosition == ACHintPositionFarRight ||
        self.hintPosition == ACHintPositionRight) {
        //5.1
        p.x -= __PAN_UPPER_RADIUS;
        CGPathAddArc(path, NULL,
                     p.x, p.y,
                     __PAN_UPPER_RADIUS,
                     4.0*M_PI/2.0,
                     1.0*M_PI/2.0,
                     false);
        p.y += __PAN_UPPER_RADIUS;
        
        //5.2
        p.x -= self.hintAdditionalWidth + __PAN_UL_WIDTH-2*__PAN_UPPER_RADIUS;
        CGPathAddLineToPoint(path, NULL, p.x, p.y);
        
        //5.3
        p.y += __PAN_UPPER_RADIUS;
        CGPathAddArc(path, NULL,
                     p.x, p.y,
                     __PAN_UPPER_RADIUS,
                     3.0*M_PI/2.0,
                     2.0*M_PI/2.0,
                     true);
        p.x -= __PAN_UPPER_RADIUS;
    } else { //ACHintPositionLeft & ACHintPositionFarLeft
        //5
        p1 = CGPointMake(p.x, p.y + __PAN_CURVE_SIZE);
        p.x -= __PAN_UL_WIDTH;
        p.y += __PAN_MIDDLE_HEIGHT + __PAN_CURVE_SIZE*2;
        p2 = CGPointMake(p.x, p.y - __PAN_CURVE_SIZE);
        CGPathAddCurveToPoint(path, NULL,
                              p1.x, p1.y,
                              p2.x, p2.y,
                              p.x, p.y);
    }
    
    //6
    p.y += __PAN_LOWER_HEIGHT - __PAN_CURVE_SIZE - __PAN_LOWER_RADIUS;
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    //7
    p.x -= __PAN_LOWER_RADIUS;
    CGPathAddArc(path, NULL,
                 p.x, p.y,
                 __PAN_LOWER_RADIUS,
                 4.0*M_PI/2.0,
                 1.0*M_PI/2.0,
                 false);
    //8
    p.x -= __PAN_LOWER_WIDTH;
    p.y += __PAN_LOWER_RADIUS;
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    //9
    p.y -= __PAN_LOWER_RADIUS;
    CGPathAddArc(path, NULL,
                 p.x, p.y,
                 __PAN_LOWER_RADIUS,
                 1.0*M_PI/2.0,
                 2.0*M_PI/2.0,
                 false);
    //10
    p.x -= __PAN_LOWER_RADIUS;
    p.y -= __PAN_LOWER_HEIGHT - __PAN_LOWER_RADIUS - __PAN_CURVE_SIZE;
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    
    if (self.hintPosition == ACHintPositionFarRight ||
        self.hintPosition == ACHintPositionRight) {
        //11
        p1 = CGPointMake(p.x, p.y - __PAN_CURVE_SIZE);
        p.x -= __PAN_UL_WIDTH;
        p.y -= __PAN_MIDDLE_HEIGHT + __PAN_CURVE_SIZE*2;
        p2 = CGPointMake(p.x, p.y + __PAN_CURVE_SIZE);
        CGPathAddCurveToPoint(path, NULL,
                              p1.x, p1.y,
                              p2.x, p2.y,
                              p.x, p.y);
    } else { //ACHintPositionLeft & ACHintPositionFarLeft
        
        //11.1
        p.x -= __PAN_UPPER_RADIUS;
        CGPathAddArc(path, NULL,
                     p.x, p.y,
                     __PAN_UPPER_RADIUS,
                     4.0*M_PI/2.0,
                     3.0*M_PI/2.0,
                     true);
        p.y -= __PAN_UPPER_RADIUS;
        
        //11.2
        p.x -= self.hintAdditionalWidth + __PAN_UL_WIDTH-2*__PAN_UPPER_RADIUS;
        CGPathAddLineToPoint(path, NULL, p.x, p.y);
        
        //11.3
        p.y -= __PAN_UPPER_RADIUS;
        CGPathAddArc(path, NULL,
                     p.x, p.y,
                     __PAN_UPPER_RADIUS,
                     1.0*M_PI/2.0,
                     2.0*M_PI/2.0,
                     false);
        p.x -= __PAN_UPPER_RADIUS;
    }
    
    //12
    p.y -= __PAN_UPPER_HEIGHT - __PAN_UPPER_RADIUS;
    if (self.hintPosition == ACHintPositionFarRight ||
        self.hintPosition == ACHintPositionRight) {
        p.y += __PAN_CURVE_SIZE;
    } else {
        p.y -= - 2*__PAN_UPPER_RADIUS + __PAN_CURVE_SIZE + __PAN_MIDDLE_HEIGHT;
    }
    CGPathAddLineToPoint(path, NULL, p.x, p.y);
    
    //13
    p.x += __PAN_UPPER_RADIUS;
    CGPathAddArc(path, NULL,
                 p.x, p.y,
                 __PAN_UPPER_RADIUS,
                 2.0*M_PI/2.0,
                 3.0*M_PI/2.0,
                 false);
    //----
    CGContextRef context;
    UIGraphicsBeginImageContext(CGSizeMake(__WIDTH+self.hintAdditionalWidth,
                                           __HEIGHT));
    context = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(context, 0.0, __HEIGHT);
    
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextAddPath(context, path);
    CGContextClip(context);
    
    //----
    
    CGRect frame = CGPathGetBoundingBox(path);
    CGColorRef backColor = [UIColor whiteColor].CGColor; //todo enable code
//    switch (self.appearance) {
//        case ACKeyAppearanceDark:
//            backColor = [ACDarkAppearance lightKeyColor].CGColor;
//            break;
//
//        case ACKeyAppearanceLight:
//            backColor = [ACLightAppearance lightKeyColor].CGColor;
//            break;
//
//        default:
//            break;
//    }
    
    CGContextSetFillColorWithColor(context, backColor);
    CGContextFillRect(context, frame);
    
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    
    UIImage * image = [UIImage imageWithCGImage:imageRef scale:[[UIScreen mainScreen] scale] orientation:UIImageOrientationDown];
    CGImageRelease(imageRef);
    
    UIGraphicsEndImageContext();
    
    CFRelease(path);
    
    return image;
}

+(UIImage*)imageWithColor:(UIColor*)color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

-(UIImageView*)cornerRadius:(UIImageView*)imageView{
    // Get your image somehow
    //UIImage *image = [UIImage imageNamed:@"image.jpg"];
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, [UIScreen mainScreen].scale);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds
                                cornerRadius:10.0] addClip];
    // Draw your image
    [imageView.image drawInRect:imageView.bounds];
    
    // Get the image, here setting the UIImageView image
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    return imageView;
}

#pragma mark - Touch handling

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    self.clipsToBounds = NO;
    
    if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad){
        [self addPopupToButton:self];
    }
    [self updateState]; //todo enable code
    long long time = (long long)([[NSDate date] timeIntervalSince1970] * 1000.0);
    NSLog(@"T begin:%lld",time);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    if (self.hintView) {
        UITouch *firstTouch = [touches anyObject];
        BOOL leftHand = self.hintPosition == ACHintPositionLeft || self.hintPosition == ACHintPositionFarLeft;
        CGFloat touchX = [firstTouch locationInView:self.superview].x  + (leftHand ?self.frame.size.width - self.frame.origin.x:self.hintView.frame.size.width-self.frame.origin.x-2*self.frame.size.width);
        
        UIButton *rightButton = self.hintButtons.lastObject, *leftButton = self.hintButtons.firstObject;
        
        NSArray *array = [self.hintButtons filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nonnull evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
            
            return ((UIButton*)evaluatedObject).center.x < touchX;
        }]];
        
        if ([array count]) {
            leftButton = array.lastObject;
        }
        
        array = [self.hintButtons filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nonnull evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
            
            return ((UIButton*)evaluatedObject).center.x > touchX;
        }]];
        
        if ([array count]) {
            rightButton = array.firstObject;
        }
        
        for (UIButton* button in self.hintButtons) {
            button.highlighted = NO;
        }
        
        //NSLog(@"L %f | %f | %f R",leftButton.center.x, touchX, rightButton.center.x);
        
        if ((touchX - leftButton.center.x) < (rightButton.center.x - touchX)) {
            [leftButton setHighlighted:YES];
        } else {
            [rightButton setHighlighted:YES];
        }
    }
    
    [self updateState];
    //NSLog(@"T move");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    self.clipsToBounds = YES;
    
    if (self.hintButtons) {
        
        [self setHighlighted:NO];
        
        NSArray *array = [self.hintButtons filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nonnull evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
            return ((UIButton*)evaluatedObject).highlighted;
        }]];
        
        for (UIButton *btn in self.hintButtons){
            NSLog(@"btn title:[%d]::%@",btn.isHighlighted,btn.titleLabel.text);
        }
        
        if ([array count]) {
            
            UIButton* highlightedButton = array.firstObject;
            
            if (highlightedButton) {
                if ([self.delegate conformsToProtocol:@protocol(JHkeyDelegate)]) {
                    [self.delegate didSelectHintButton:highlightedButton];
                    NSLog(@"highlightedButton tap::%@",highlightedButton.titleLabel.text);
                    
                    //Reset Hint Highlighted
                    for (UIButton *btn in self.hintButtons){
                        if (highlightedButton.titleLabel.text == btn.titleLabel.text){
                            [btn setHighlighted:NO];
                            break;
                        }
                    }
                    
                    //Set First Hint Highlighted
                    if ([self getIsRightHint]) {
                        [self.hintButtons.lastObject setHighlighted:YES];
                    } else {
                        [self.hintButtons.firstObject setHighlighted:YES];
                    }
                    
                }
            }
        }
        [self hideHintView];
    } else {
        NSLog(@"button title::%@",self.titleLabel.text);
        [super touchesEnded:touches withEvent:event];
    }
    [self startHideTimerPopup];
    [self updateState];
    long long time = (long long)([[NSDate date] timeIntervalSince1970] * 1000.0);
    NSLog(@"T end:%lld",time);
    
    if ([self.delegate conformsToProtocol:@protocol(JHkeyDelegate)]) {
        [self.delegate didReleaseLongOn:self];
        NSLog(@"release long on::%@",self.titleLabel.text);
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    
    [self startHideTimerPopup];
    [self updateState];
    
    NSLog(@"T cancel");
}

- (void)startHideTimerPopup{
    
    [self stopHideTimerPopup];
    
    if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad){
        
        _hidePopupTimer = [NSTimer scheduledTimerWithTimeInterval:kKeyPopapStayAliveInterval
                                                           target:self
                                                         selector:@selector(hidePopup)
                                                         userInfo:nil
                                                          repeats:NO];
    }
}

- (void)hidePopup{
    [self stopShowHintTimer];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:kNotificationHideButtonPopup
                                                  object:nil];
    [self stopHideTimerPopup];
    
    [[self viewWithTag:ACKEY_POPUP_VIEV_TAG] removeFromSuperview];
    
    for (UIView *view in [[self superview] subviews]){
        if([view isKindOfClass:JHkey.class]){
            JHkey *jhKey = (JHkey*)view;
            [jhKey.hintView removeFromSuperview];
        }
    }
}

- (void)stopHideTimerPopup{
    
    [self.hidePopupTimer invalidate];
    _hidePopupTimer = nil;
}

- (void)startShowHintTimer {
    
    [self stopShowHintTimer];
    
    if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad){
        _showHintTimer = [NSTimer scheduledTimerWithTimeInterval:0.6 target:self selector:@selector(showKeyCapView) userInfo:nil repeats:NO];
    }
}

- (void)stopShowHintTimer {
    
    [self.showHintTimer invalidate];
    _showHintTimer = nil;
}

- (void)hideHintView {
    
    [self.hintView removeFromSuperview];
}
- (void)updateState{
    //todo do here something
}

@end

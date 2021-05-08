//
//  HintBarManager.swift
//  KeyboardExtension
//
//  Created by Jamil on 27/4/21.
//

import UIKit

var sgButton1  = UIButton()
var sgButton2  = UIButton()
var sgButton3  = UIButton()
var sgButton4  = UIButton()
var sgButton5  = UIButton()
var sgButton6  = UIButton()
var sgButton7  = UIButton()
var sgButton8  = UIButton()
var sgButton9  = UIButton()
var sgButton10 = UIButton()

var wordArray:[String] = [String]()

//UI Suggestion bar
var suggestionBarView:UIView = UIView()
var suggestionBarScrollView:UIScrollView = UIScrollView();
let barHeight:Int = 46//36;

let MAX_WORD = 10

class HintBarManager: NSObject {
    public static let shared = HintBarManager()
    
    func addSuggestionBar(parentView:UIView,txtView:UITextDocumentProxy) {
        //wordArray = ["কান্ত","খা","খাকি","কি","কী","কাকতালিয়","কাকা","আচানক", "চুরমার","চানাচুর","পাগল","গলদ","ছাগল","বাবা","বাবর","আবার","কাকে","কিন্তু"]
        wordArray = ["কান্ত","আবার"]
        let _expandedHeight:CGFloat = CGFloat(216 + barHeight);
        //Add suggestion bar
        let border:CGFloat = 1;
        var index = 0;
        let screenWidth  = UIScreen.main.bounds.size.width - 2*border;
        let buttonWidth  = screenWidth/3;
        
        sgButton1 = UIButton.init(type: .custom)
        sgButton1.frame = CGRect(x: index*Int((buttonWidth+border)) ,y: 0, width: Int(buttonWidth), height: barHeight)
        sgButton1.backgroundColor = .red //[self color:174 g:179 b:189];
        sgButton1.setTitle("Jamil", for: .normal)
        sgButton1.addTarget(self, action: #selector(suggestionButtonDidClick), for: .touchUpInside)
        
        index += 1
        sgButton2 = UIButton.init(type: .custom)
        sgButton2.frame = CGRect(x: index*Int((buttonWidth+border)) ,y: 0, width: Int(buttonWidth), height: barHeight)
        sgButton2.backgroundColor = .red //[self color:174 g:179 b:189];
        sgButton2.setTitle("Hossain", for: .normal)
        sgButton2.addTarget(self, action: #selector(suggestionButtonDidClick), for: .touchUpInside)
        
        index += 1
        sgButton3 = UIButton.init(type: .custom)
        sgButton3.frame = CGRect(x: index*Int((buttonWidth+border)) ,y: 0, width: Int(buttonWidth), height: barHeight)
        sgButton3.backgroundColor = .red //[self color:174 g:179 b:189];
        sgButton3.setTitle("go", for: .normal)
        sgButton3.addTarget(self, action: #selector(suggestionButtonDidClick), for: .touchUpInside)
        
        //Keyboard bar
        suggestionBarScrollView = UIScrollView.init()
        
        suggestionBarScrollView.frame = CGRect(x:0, y:0, width: Int(UIScreen.main.bounds.size.width), height:barHeight);
        //barScrollView.delegate = self;
        suggestionBarScrollView.backgroundColor  = .clear //[UIColor colorWithRed:211/255.0 green:213/255.0 blue:219/255.0 alpha:1.0];
        suggestionBarScrollView.bounces = false;
        suggestionBarScrollView.isScrollEnabled = false;
        suggestionBarScrollView.showsHorizontalScrollIndicator = false;
        suggestionBarScrollView.contentSize = CGSize(width: CGFloat((index+1))*(buttonWidth + border), height: suggestionBarScrollView.contentSize.height);
        
        suggestionBarScrollView.addSubview(sgButton1)
        suggestionBarScrollView.addSubview(sgButton2)
        suggestionBarScrollView.addSubview(sgButton3)
        
        //Keyboard bar
        let barView:UIView =  UIView.init(frame: CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.size.width), height: barHeight))
        barView.backgroundColor = UIColor.clear
        parentView.superview?.addSubview(barView)
        barView.addSubview(suggestionBarScrollView)
        barView.layer.zPosition = -10
        barView.sizeToFit()
        //
        //txtView.sizeToFit()
        //txtView.translatesAutoresizingMaskIntoConstraints = NO;
        //[txtView.leftAnchor constraintEqualToAnchor:parentView.leftAnchor].active = YES;
        //[barView.bottomAnchor constraintEqualToAnchor:parentView.topAnchor].active = YES;
       
//        txtView.translatesAutoresizingMaskIntoConstraints = false
//        txtView.leftAnchor.constraint(equalTo: parentView.leftAnchor).isActive = true
//        barView.bottomAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        
        
        /*CGFloat _expandedHeight = 252;//193;//252;*/
        //NSLayoutConstraint *_heightConstraint = [NSLayoutConstraint constraintWithItem:parentView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant: _expandedHeight];
        //[parentView addConstraint: _heightConstraint];
        
//        let _heightConstraint : NSLayoutConstraint = NSLayoutConstraint(item: parentView, attribute:  NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 0.0, constant: _expandedHeight)
//        parentView.addConstraint(_heightConstraint)
    }
    
    @objc func suggestionButtonDidClick(button:UIButton){
        print("\(button.titleLabel?.text)")
    }
/*
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
    */
}

//extension UIButton{
//    override open var isHighlighted: Bool {
//        didSet {
//            //backgroundColor = isHighlighted ? UIColor.lightGray : UIColor.white
//        }
//    }
//}

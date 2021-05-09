//
//  HintBarManager.swift
//  KeyboardExtension
//
//  Created by Jamil on 27/4/21.
//

import UIKit

protocol HintBarDelegate: class {
  func didSelectHint(_ text: String)
}

var wordArray:[String] = [String]()

//UI Suggestion bar
var suggestionBarView:UIView = UIView()
var suggestionBarScrollView:UIScrollView = UIScrollView();
let barHeight:Int = 46//36;

let MAX_WORD = 10

class HintBarManager: NSObject {
    public static let shared = HintBarManager()
    weak var delegate: HintBarDelegate?
    
    func addSuggestionBar(parentView:UIView,txtView:UITextDocumentProxy) {
        
        wordArray = ["কান্ত","খা","খাকি","কি","কী","কাকতালিয়","কাকা","আচানক", "চুরমার","চানাচুর","পাগল","গলদ","ছাগল","বাবা","বাবর","আবার","কাকে","কিন্তু"]
        //wordArray = ["কান্ত","খা","খাকি","কি"]
        
        //Keyboard bar
        suggestionBarScrollView = UIScrollView.init()
        refresh(scrollView: suggestionBarScrollView, dataArray: wordArray)
        
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
    
    func refresh(scrollView:UIScrollView, dataArray:[String]){
        if dataArray.count <= 0 {return}
        //Add suggestion bar
        let border:CGFloat = 1
        let screenWidth  = UIScreen.main.bounds.size.width - 2*border
        let buttonWidth  = screenWidth/3
        
        
        //Keyboard bar
        scrollView.frame = CGRect(x:0, y:0, width: Int(UIScreen.main.bounds.size.width), height:barHeight)
        //barScrollView.delegate = self;
        scrollView.backgroundColor  = .clear //[UIColor colorWithRed:211/255.0 green:213/255.0 blue:219/255.0 alpha:1.0];
        scrollView.bounces = false
        scrollView.isScrollEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: CGFloat(CGFloat((wordArray.count))*(buttonWidth + border)), height: scrollView.contentSize.height)
        
        for index in 0...dataArray.count - 1  {
            let sgButton = UIButton.init(type: .custom)
            sgButton.tag = index
            sgButton.backgroundColor = kHintButtonColor  //[self color:174 g:179 b:189];
            sgButton.setTitle(dataArray[index], for: .normal)
            sgButton.setTitleColor(.black, for: .normal)
            sgButton.frame = CGRect(x: index*Int((buttonWidth+border)) ,y: 0, width: Int(buttonWidth), height: barHeight)
            sgButton.addTarget(self, action: #selector(suggestionButtonDidClick(button:)), for: .touchUpInside)
            scrollView.addSubview(sgButton)
        }
        
    }
    
    @objc func suggestionButtonDidClick(button:UIButton){
        print("\(button.titleLabel?.text)")
        if let _delegate = delegate, let text = button.titleLabel?.text {
            self.delegate?.didSelectHint(text)
        }
    }
}

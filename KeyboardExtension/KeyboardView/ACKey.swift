//
//  ACKey.swift
//  KeyboardExtension
//
//  Created by Jamil on 15/1/22.
//

import Foundation

protocol JHkeyDelegate: class {
    func didSelectHintButton(_ sender : UIButton)
    func didTapLongOnButton (_ sender : UIButton)
    func didReleaseLongOn   (_ sender : UIButton)
}

enum ACHintPosition:UInt {
    case ACHintPositionFarLeft
    case ACHintPositionLeft
    case ACHintPositionRight
    case ACHintPositionFarRight
}

enum appearance:UInt {
    case ACKeyAppearanceDark
    case ACKeyAppearanceLight
}

/*
 @protocol JHkeyDelegate <NSObject>   //define delegate protocol
     - (void)didSelectHintButton:(UIButton*)sender;
     - (void)didTapLongOnButton:(UIButton*)sender;
     - (void)didReleaseLongOn:(UIButton*)sender;

 @end //end protocol

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

 @interface ACkey : UIButton

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
 @property (nonatomic, weak) id <JHkeyDelegate> delegate; //define MyClassDelegate as delegate


 @end

 NS_ASSUME_NONNULL_END
 */

//MARK:- keycap view show
extension KeyboardView {
    func keyPopupOn(_ keyButton:UIButton) {
        if currentFontLetters.count <= 0 { return }
        
        let title = currentFontLetters[currentButtonIndex % currentFontLetters.count]
        let jhKey   = JHkey(type: .custom)
        jhKey.frame = keyButton.frame
        jhKey.tag   = keyButton.tag
        jhKey.delegate = self
        jhKey.backgroundColor = .white
        jhKey.setTitle(title, for: .normal)
        jhKey.setTitleColor(kKeyboardTextColor, for: .normal)
        jhKey.setTitleShadowColor(kTextShadowColor, for: .normal)
        jhKey.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        addSubview(jhKey)
        jhKey.clipsToBounds = true
        jhKey.layer.cornerRadius = 5.0
        
//        jhKey.titleLabel?.numberOfLines = 0
//        jhKey.titleLabel?.lineBreakMode = .byWordWrapping
//        jhKey.setTitle("খ\nক", for: .normal)
//        jhKey.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        
    }
}

//
//  KeyboardViewController.swift
//  KeyboardExtension
//
//  Created by Jamil on 22/2/21.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    var hintBarManager: HintBarManager = HintBarManager();
    var keyboardView  : KeyboardView   = KeyboardView();
    
    var textView : UITextView = UITextView();
    var wordArray: NSArray  = [];
    var context  : NSString = "";
    
    var nextButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showView(){
        keyboardView = KeyboardView(frame: self.view.frame)
        keyboardView.sizeToFit()
        view.addSubview(keyboardView)
        
        //set keyboard switch target
        nextButton = keyboardView.nextButton
        nextButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        //add suggestion bar
//        self.suggestionBarManager = [SuggestionBarManager sharedInstance];
//        self.suggestionBarManager.delegate = self;
//        //add suggestion  bar
//        [self.suggestionBarManager addSuggestionBar:self.view subview:self.textView];
        
        let hintBarManager = HintBarManager.shared
        //hintBarManager.addSuggestionBar(parentView: keyboardView, txtView: textView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        showView()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        //self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}

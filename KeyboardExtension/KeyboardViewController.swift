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
    var heightConstraint: NSLayoutConstraint?
    var height: CGFloat = 216 + 46
    
    private func prepareHeightConstraint() {
        guard self.heightConstraint != nil else {
            let dummyView = UILabel(frame:view.frame)
            dummyView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(dummyView)
            
            self.heightConstraint = NSLayoutConstraint( item:view, attribute:.height, relatedBy:.equal, toItem:nil, attribute:.notAnAttribute, multiplier:0.0, constant: height)
            
            //self.heightConstraint?.priority = UILayoutPriority(rawValue: 750)
            view.addConstraint(self.heightConstraint!)
            return
        }
        
        // Update when change orientation etc..
        self.heightConstraint?.constant = height
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // When keyboard is create
        self.prepareHeightConstraint()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        guard let viewKeyboard = self.inputView, viewKeyboard.frame.size.width != 0 && viewKeyboard.frame.size.width != 0 else {
            return
        }
        //Update change orientation, update just the constant
        self.prepareHeightConstraint()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showView(){
        var mFrame = self.view.frame
        mFrame.origin.y = 46
        
        keyboardView = KeyboardView(frame: mFrame)
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

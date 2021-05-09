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
    
    //var textView:UITextDocumentProxy = UITextDocumentProxy();
    var wordArray: NSArray  = []
    var context  : NSString = ""
    
    var nextButton: UIButton!
    var heightConstraint: NSLayoutConstraint?
    
    var hintBarHeight: CGFloat =  46
    var height: CGFloat = 216 + 46
    
    var relevantContextRange:NSRange?
    
    private func prepareHeightConstraint() {
        guard self.heightConstraint != nil else {
            let dummyView = UILabel(frame:view.frame)
            dummyView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(dummyView)
            
            self.heightConstraint = NSLayoutConstraint( item:view as Any, attribute:.height, relatedBy:.equal, toItem:nil, attribute:.notAnAttribute, multiplier:0.0, constant: height)
            
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
        self.relevantContextRange = NSRange(location: 0, length: 0);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showView(){
        var mFrame = self.view.frame
        mFrame.origin.y = hintBarHeight
        mFrame.size.height = height
        
//        keyboardView = KeyboardView(frame: mFrame)
//        keyboardView.sizeToFit()
//        view.addSubview(keyboardView)
        
        let keyboardView = KeyboardView(frame: mFrame)
        keyboardView.delegate = self
        guard let inputView = inputView else { return }
        inputView.addSubview(keyboardView)
        
        //set keyboard switch target
        nextButton = keyboardView.nextButton
        nextButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        //add suggestion bar
//        self.suggestionBarManager = [SuggestionBarManager sharedInstance];
//        self.suggestionBarManager.delegate = self;
//        //add suggestion  bar
//        [self.suggestionBarManager addSuggestionBar:self.view subview:self.textView];
        
        let hintBarManager = HintBarManager.shared
        hintBarManager.delegate = self
        hintBarManager.addSuggestionBar(parentView: keyboardView, txtView: self.textDocumentProxy)
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
        
        var relevantContext:NSString;
        /*
        UITextView *myTextView = (UITextView*)self.textView;
        UITextPosition *caretPosition = myTextView.selectedTextRange.start;
        UITextRange *inputRange = [myTextView textRangeFromPosition:myTextView.beginningOfDocument
                                                            toPosition:caretPosition];
        
        */
        //var inputText:String = self.textView.documentContextBeforeInput ?? "" //[myTextView textInRange:inputRange];
        
        //print("inputText::\(textInput.)")
        
        /*
        //var lastWordRange:Range = [inputText rangeOfString:" " options:NSBackwardsSearch];
        
        var lastWordRange:NSRange = inputText.range(of: " ", options: .backwards)
        
        if (lastWordRange.location == NSNotFound) {
            relevantContext = inputText as NSString;
            self.relevantContextRange = NSRange(location: 0, length: inputText.length);
        } else {
            let location = lastWordRange.location + 1;
            relevantContext = inputText.substring(to: location) as NSString;
            self.relevantContextRange = NSMakeRange(location, inputText.length - location);
            
        }
 */
        
//        NSLog(@"context:%@",relevantContext);
//        NSLog(@"range:(%ld,%ld)",self.relevantContextRange.location,self.relevantContextRange.length);
//        if([self.delegate respondsToSelector:@selector(customKeyboard:currentContext:)]){
//            [self.delegate customKeyboard:self currentContext:relevantContext];
//        }
    }
    
    /*
    func draw(_ rect: CGRect) {
        print("rect")
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 32)]
        let attributedString = NSAttributedString(string: "test", attributes: attrs)
        attributedString.draw(in: rect)
    }
    */

}

extension KeyboardViewController: KeyboardViewDelegate {
    func insertCharacter(_ newCharacter: String){
        let unicodeText = "\u{2145}" //"\u{24B7}" //"\u{1F18}" //todo
        self.textDocumentProxy.insertText(unicodeText)
    }
}

extension KeyboardViewController: HintBarDelegate {
    func didSelectHint(_ text: String) {
        self.textDocumentProxy.insertText(text)
    }
}

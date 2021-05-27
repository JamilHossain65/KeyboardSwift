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
        
        //https://unsplash.com/backgrounds/phone/keyboard
        kKeyboardBGColor = UIColor.init(patternImage: UIImage(named: "photo4")!)
        kHintButtonColor = .clear
        
        var mFrame = self.view.frame
        mFrame.origin.y = hintBarHeight
        mFrame.size.height = height

        keyboardView = KeyboardView(frame: mFrame)
        keyboardView.delegate = self
        guard let inputView = inputView else { return }
        inputView.addSubview(keyboardView)
        
        inputView.backgroundColor = kKeyboardBGColor
        
        //set keyboard switch target
        nextButton = keyboardView.nextButton
        nextButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        //set word suggestion view
        let hintBarManager = HintBarManager.shared
        hintBarManager.delegate = self
        hintBarManager.addSuggestionBar(parentView: keyboardView, txtView: self.textDocumentProxy)
        
        //add a button on left side
        let fontButton = UIButton(type: .custom)
        fontButton.frame  = CGRect(x: 10, y: 0, width: 30, height: 30)
        fontButton.setTitle("F", for: .normal)
        fontButton.center = CGPoint(x: fontButton.center.x, y: hintBarHeight/2)
        fontButton.layer.cornerRadius = fontButton.frame.height/2
        fontButton.addTarget(self, action: #selector(fontButtonPressed), for: .touchUpInside)
        fontButton.backgroundColor = .red
        view.addSubview(fontButton)
        
        //add a button on right side
        let colorButton = UIButton(type: .custom)
        colorButton.setTitle("C", for: .normal)
        colorButton.frame  = CGRect(x: UIScreen.main.bounds.width - 40, y: 0, width: 30, height: 30)
        colorButton.center = CGPoint(x: colorButton.center.x, y: hintBarHeight/2)
        colorButton.layer.cornerRadius = colorButton.frame.height/2
        colorButton.addTarget(self, action: #selector(colorButtonPressed), for: .touchUpInside)
        colorButton.backgroundColor = .red
        view.addSubview(colorButton)
        
    }
    
    @objc func fontButtonPressed() {
       print("fontButtonPressed")
        openContainerApp()
    }
    
    @objc func colorButtonPressed() {
        print("colorButtonPressed")
        openContainerApp()
    }
    
    func openContainerApp() {
        let url = URL(string: "SmartFonts://")
        let selectorOpenURL = sel_registerName("openURL:")
        let context = NSExtensionContext()
        context.open(url! as URL, completionHandler: nil)
        
        var responder = self as UIResponder?
        
        while (responder != nil) {
            if responder?.responds(to: selectorOpenURL) == true {
                responder?.perform(selectorOpenURL, with: url)
            }
            responder = responder!.next
        }
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
    func deleteCharacter(_ newCharacter: String) {
        self.textDocumentProxy.deleteBackward()
    }
    
    func insertCharacter(_ newCharacter: String) {
        self.textDocumentProxy.insertText(newCharacter)
    }
    
    func gotoNextKeyboard(_ button: UIButton){
        button.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
    }
}

extension KeyboardViewController: HintBarDelegate {
    func didSelectHint(_ sender: Any) {
        //self.textDocumentProxy.insertText(text) //todo
        let button = sender as! UIButton
        keyboardView.reloadFont(button.tag)
    }
}

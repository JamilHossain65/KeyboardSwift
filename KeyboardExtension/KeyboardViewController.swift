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
    
    var height: CGFloat = 216 + hintBarHeight //216 is keyboard height //todo do it dynamic
    
    var relevantContextRange:NSRange?
    
    var fontButton   :UIButton!
    var bgColorButton:UIButton!
    var textColorBtn :UIButton!
    var floatingButtonView : UIView!
    var coutTime   = 0
    var countLimit = 5
    var timer:Timer?
    
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
    
    //MARK: SETTING VIEW METHODS
    @objc func showSettingView() {
        print("not writing....")
        DispatchQueue.main.async {
            self.floatingButtonView.isHidden = false
        }
        
        HintBarManager.shared.refresh(scrollView: suggestionBarScrollView, dataArray: kUnicodeFontNameArray)
    }
    
    func hideSettingView() {
        DispatchQueue.main.async {
            self.floatingButtonView.isHidden = true
        }
        
        //set word suggestion view
        for view in suggestionBarScrollView.subviews{
            view.removeFromSuperview()
        }
        
        HintBarManager.shared.refresh(scrollView: suggestionBarScrollView, dataArray: ["Hi","I","How","We"])
        coutTime = 0
        
        if let _timer = timer {
            _timer.invalidate()
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.checkWriting), userInfo: nil, repeats: true)
            
    }
    
    @objc func checkWriting(){
        
        coutTime += 1
        print("coutTime::\(coutTime)")
        if coutTime >= countLimit {
            timer?.invalidate()
            coutTime = 0
            showSettingView()
        }
    }
    
    func showView() {
        
        //https://unsplash.com/backgrounds/phone/keyboard
        kKeyboardBGColor = Color.shared.color(209,212,218) 
        kAltButtonColor  = Color.shared.color(171,177,188)
        
        kHintButtonColor   = .brown
        kKeyButtonColor    = .white
        kHighlightColor    = .white
        kKeyboardTextColor = .black
        kTextShadowColor   = .black
        
        if let _fontName = getObject(kKeyAlphabetFont) as? [String] {
            kTextFontAlphabet = _fontName
        } else {
            kTextFontAlphabet = kUnicodeFontArray[0]
        }
        
        if let _bgColor:UIColor = UserDefaults.standard.keyboardBgColor {
            kKeyboardBGColor = _bgColor
        } else if let _imageName = getObject(kKeyBgImageName) as? String {
            kKeyboardBGColor = _imageName.color()
        }
        
        if let _keyboardTextColor:UIColor = UserDefaults.standard.keyboardTextColor {
            kKeyboardTextColor = _keyboardTextColor
        } else if let _textColorImageName = getObject(kKeyTextColor) as? String {
            kKeyboardTextColor = _textColorImageName.color()
        }
        
        var  mFrame        = view.frame
        mFrame.origin.y    = hintBarHeight
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
        hintBarManager.addSuggestionBar(parentView: inputView, txtView: textDocumentProxy)
        
        
        if let _floatingButtonView = floatingButtonView {
            _floatingButtonView.removeFromSuperview()
        }
        floatingButtonView = UIView()
        floatingButtonView.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        floatingButtonView.center = CGPoint(x: view.center.x, y: hintBarHeight/2)
        floatingButtonView.backgroundColor = .clear
        view.addSubview(floatingButtonView)
        
        //add a button on right side
        bgColorButton = UIButton(type: .custom)
        bgColorButton.setTitle("bg", for: .normal)
        bgColorButton.setTitleColor(kKeyboardTextColor, for: .normal)
        bgColorButton.frame  = CGRect(x: 0, y: 0, width: 30, height: 30)
        //bgColorButton.center = CGPoint(x: bgColorButton.center.x, y: hintBarHeight/2)
        bgColorButton.layer.cornerRadius = bgColorButton.frame.height/2
        bgColorButton.addTarget(self, action: #selector(colorButtonPressed), for: .touchUpInside)
        //bgColorButton.setBackgroundImage(UIImage(named: "photo0"), for: .normal)
        bgColorButton.titleLabel?.adjustsFontSizeToFitWidth = true
        bgColorButton.layer.cornerRadius = bgColorButton.frame.height/2
        bgColorButton.backgroundColor = "photo0".colorSmall(30)
        floatingButtonView.addSubview(bgColorButton)
        
        //add a button on right side
        textColorBtn = UIButton(type: .custom)
        textColorBtn.setTitle("txt", for: .normal)
        textColorBtn.setTitleColor(kKeyboardTextColor, for: .normal)
        textColorBtn.frame  = CGRect(x: 35, y: 0, width: 30, height: 30)
        //textColorBtn.center = CGPoint(x: textColorBtn.center.x, y: hintBarHeight/2)
        textColorBtn.layer.cornerRadius = textColorBtn.frame.height/2
        textColorBtn.addTarget(self, action: #selector(textColorButtonPressed), for: .touchUpInside)
        textColorBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        textColorBtn.backgroundColor = "photo0".colorSmall(30)
        floatingButtonView.addSubview(textColorBtn)
        
        //add a button on left side
        fontButton = UIButton(type: .custom)
        fontButton.frame = CGRect(x: 70, y: 0, width: 30, height: 30)
        fontButton.setTitle("font", for: .normal)
        fontButton.setTitleColor(kKeyboardTextColor, for: .normal)
        //fontButton.center = CGPoint(x: fontButton.center.x, y: hintBarHeight/2)
        fontButton.layer.cornerRadius = fontButton.frame.height/2
        fontButton.addTarget(self, action: #selector(fontButtonPressed), for: .touchUpInside)
        fontButton.backgroundColor = .white
        fontButton.titleLabel?.adjustsFontSizeToFitWidth = true
        fontButton.backgroundColor = "photo0".colorSmall(30)
        floatingButtonView.addSubview(fontButton)
        
        //set font button selected initialy
        resetColor(fontButton as Any)
    }
    
    //MARK: SETTING BUTTON ACTION
    @objc func fontButtonPressed(_ sender: Any) {
        print("fontButtonPressed")
        openContainerApp()
        resetColor(sender)
        
        keyboard = KEYBOARD_TYPE.FONT
        
        guard let inputView = inputView else { return }
        inputView.backgroundColor = kKeyboardBGColor
        
        //set word suggestion view
        HintBarManager.shared.refresh(scrollView: suggestionBarScrollView, dataArray: kUnicodeFontNameArray)
    }
    
    @objc func colorButtonPressed(_ sender: Any) {
        print("colorButtonPressed")
        openContainerApp()
        resetColor(sender)
        
        keyboard = KEYBOARD_TYPE.COLOR
        
        guard let inputView = inputView else { return }
        inputView.backgroundColor = kKeyboardBGColor

        //set suggestion view
        let colorArray = Color.shared.colorList()
        let colorList:[UIColor] = colorArray.map({ $0.colorSmall})
        
        HintBarManager.shared.refreshColor(scrollView: suggestionBarScrollView, colorArray: colorList)
    }
    
    @objc func textColorButtonPressed(_ sender: Any) {
        print("textColorButtonPressed")
        openContainerApp()
        resetColor(sender)
        keyboard = KEYBOARD_TYPE.TEXT_COLOR
        
        let colorArray = Color.shared.colorList()
        let colorList:[UIColor] = colorArray.map({ $0.colorSmall})
        
        HintBarManager.shared.refreshColor(scrollView: suggestionBarScrollView, colorArray: colorList)
    }
    
    func resetColor(_ sender:Any) {
        bgColorButton.backgroundColor = .lightGray
        textColorBtn .backgroundColor = .lightGray
        fontButton   .backgroundColor = .lightGray
        
        let button = sender as! UIButton
        button.backgroundColor = "photo0".colorSmall(30)
    }

    //MARK: OPEN CONTAINER APP
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
    }
}

extension KeyboardViewController: KeyboardViewDelegate {
    func deleteCharacter(_ newCharacter: String) {
        textDocumentProxy.deleteBackward()
    }
    
    func insertCharacter(_ newCharacter: String) {
        textDocumentProxy.insertText(newCharacter)
        hideSettingView()
    }
    
    func gotoNextKeyboard(_ button: UIButton){
        button.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
    }
    
    func voiceButtonTapped(_ voiceButton: UIButton){
        print("voice button tapped")
    }
}

extension KeyboardViewController: HintBarDelegate {
    func didSelectColor(_ sender: Any) {
        
        let button = sender as! UIButton
        let colorArray = Color.shared.colorList()
        let color:Color = colorArray[button.tag]
        
        switch keyboard {
        case .COLOR:
            kKeyboardBGColor = color.color
            inputView?.backgroundColor = kKeyboardBGColor
            //print("pattern color:::\(kKeyboardBGColor)")
            
            if color.colorType == .PATTERN {
                setObject(color.imageName, key: kKeyBgImageName)
            } else {
                UserDefaults.standard.keyboardBgColor = kKeyboardBGColor
            }
            
            keyboardView.backgroundColor = kKeyboardBGColor
            
            break
            
        case .TEXT_COLOR:
            kKeyboardTextColor = color.color //kColorArray[button.tag]
            keyboardView.reloadTextColor(button.tag)
            
            if color.colorType == .PATTERN {
                setObject(color.imageName, key: kKeyTextColor)
            } else {
                UserDefaults.standard.keyboardTextColor = kKeyboardTextColor
            }
            
            //set setting button text color
            bgColorButton.setTitleColor(kKeyboardTextColor, for: .normal)
            textColorBtn .setTitleColor(kKeyboardTextColor, for: .normal)
            fontButton   .setTitleColor(kKeyboardTextColor, for: .normal)
            break
            
        default:
            break
        }
    }
    
    func didSelectHint(_ sender: Any) {
        
//        if let _inputView = inputView {
//            for view in _inputView.subviews {
//                view.removeFromSuperview()
//            }
//        }
        
        let button = sender as! UIButton
        keyboard   = KEYBOARD_TYPE.FONT
        kTextFontAlphabet  = kUnicodeFontArray[button.tag]
        setObject(kTextFontAlphabet, key: kKeyAlphabetFont)
        keyboardView.reloadFont(button.tag)
        keyboardView.backgroundColor = kKeyboardBGColor
    }
}

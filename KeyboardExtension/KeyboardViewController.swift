//
//  KeyboardViewController.swift
//  KeyboardExtension
//
//  Created by Jamil on 22/2/21.
//

import UIKit
import AudioToolbox

class KeyboardViewController: UIInputViewController,UIInputViewAudioFeedback{

    var hintBarManager: HintBarManager = HintBarManager()
    var keyboardView  : KeyboardView   = KeyboardView()
    
    let audioManager = AudioManager()
    
    var wordArray: [String]  = []
    //var currentWordArray: [String]  = []
    var context  : String = ""
    
    var nextButton: UIButton!
    var heightConstraint: NSLayoutConstraint?
    
    var height: CGFloat = 216 + hintBarHeight //216 is keyboard height //todo do it dynamic
    
    var relevantContextRange:NSRange?
    
    //var settingButton:UIButton!
    var langButton   :UIButton!
    var fontButton   :UIButton!
    var bgColorButton:UIButton!
    var textColorBtn :UIButton!
    var floatingButtonView : UIView!
    var coutTime   = 0
    var countLimit = 5 //MARK:- TODO: countLimit = 5
    var timer:Timer?
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
//        dispatch_async(dispatch_get_main_queue(), ^{
//                AudioServicesPlaySystemSound(1104);
//            });
        
        let wordString = readf("words")
        if let _wordString = wordString, _wordString.count > 0 {
            wordArray = _wordString.components(separatedBy: "\n") //MARK: - TODO: crash sometimes
            print("words count::\(wordArray.count)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // When keyboard is create
        self.prepareHeightConstraint()
        
        if thisClassName.contains("KeyboardViewController") {
            
            deleteDoccumentText()
            
            let val = getObject(SUITE_KEY) as? String ?? ""
            // write to clipboard
            UIPasteboard.general.string = val
            // read from clipboard
            let content = UIPasteboard.general.string
            self.textDocumentProxy.insertText(content ?? "")
        }
    }
    
    func deleteDoccumentText(){
        //remove text from document
        let text = (textDocumentProxy.documentContextBeforeInput ?? "") + (textDocumentProxy.documentContextAfterInput ?? "")
        for _: Int in 0 ..< text.count {
            self.textDocumentProxy.deleteBackward()
        }
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
    
    //MARK: SETTING VIEW METHODS
    @objc func showSettingView() {
        print("user no longer writing....")
        DispatchQueue.main.async {
            if let _floatingButtonView = self.floatingButtonView {
                _floatingButtonView.isHidden = false
            }
        }
        
        context = ""
        hintBarType = .SETTING
        suggestionBarScrollView.isHidden = true
        //HintBarManager.shared.refresh(scrollView: suggestionBarScrollView, dataArray:["","",""])
    }
    
    func hideSettingView() {
        
        hintBarType = .HINT_WORD
        suggestionBarScrollView.isHidden = false
        
        DispatchQueue.main.async {
            if let _floatingButtonView = self.floatingButtonView {
                _floatingButtonView.isHidden = true
            }
        }
        
        //set word suggestion view
        for view in suggestionBarScrollView.subviews{
            view.removeFromSuperview()
        }
        
        coutTime = 0
        
        if let _timer = timer {
            _timer.invalidate()
        }
        
        //MARK:- TODO: enable timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.checkWriting), userInfo: nil, repeats: true)
            
    }
    
    func getHintWords() -> [String] {
        let textLeft  = textDocumentProxy.documentContextBeforeInput ?? ""
        context = textLeft.components(separatedBy: " ").last ?? ""
        context = context.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        print("context[\(context.count)]::\(context)")
        
        var wordList:[String] = ["I","is","are","you"]
        //let uniqueWords = Array(Set(filteredArray))
        
        if context.count <= 0 {
            return wordList
        } else {
            let filteredArray = wordArray.filter (where: {$0.lowercased().hasPrefix(context)}, limit: 5)
            
            print("filteredArray::\(filteredArray)")
            if filteredArray.count > 0 {
                wordList = filteredArray
            }
        }
        
        return wordList
    }
    
    @objc func checkWriting(){
        
        coutTime += 1
        //print("coutTime::\(coutTime)")
        if coutTime >= countLimit {
            timer?.invalidate()
            coutTime = 0
            showSettingView()
        }
    }
    
    func showView() {
        //record audio
        audioManager.initAudio()
        audioManager.delegate = self
        
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
        
        showSettingOptionView()
        
    }
    
    func showSettingOptionView(){
        if let _floatingButtonView = floatingButtonView {
            _floatingButtonView.removeFromSuperview()
        }
        floatingButtonView = UIView()
        floatingButtonView.frame = CGRect(x: 0, y: 0, width: 135, height: 30)
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
        
        //add language setting button
        langButton = UIButton(type: .custom)
        langButton.setTitle("lang", for: .normal)
        langButton.setTitleColor(kKeyboardTextColor, for: .normal)
        langButton.frame  = CGRect(x: 105, y: 0, width: 30, height: 30)
        langButton.layer.cornerRadius = langButton.frame.height/2
        langButton.addTarget(self, action: #selector(languageButtonPressed), for: .touchUpInside)
        langButton.titleLabel?.adjustsFontSizeToFitWidth = true
        langButton.backgroundColor = .white
        floatingButtonView.addSubview(langButton)
        
        //set font button selected initialy
        resetColor(UIButton())
        counter = 0
    }
    
    //MARK: SETTING BUTTON ACTION
    
    @objc func settingButtonPressed(_ sender: UIButton) {
        print("settingButtonPressed")
        showSettingOptionView()
    }
    
    
    @objc func fontButtonPressed(_ sender: Any) {
        print("fontButtonPressed")
        openContainerApp()
        resetColor(sender)
        
        //hide setting view
        hideSettingView()
        
        hintBarType = .SETTING
        keySettingType = .FONT
        
        guard let inputView = inputView else { return }
        inputView.backgroundColor = kKeyboardBGColor
        
        //set word suggestion view
        HintBarManager.shared.refresh(scrollView: suggestionBarScrollView, dataArray: kUnicodeFontNameArray)
    }
    
    @objc func colorButtonPressed(_ sender: Any) {
        print("colorButtonPressed")
        openContainerApp()
        resetColor(sender)
        
        keySettingType = .COLOR
        
        guard let inputView = inputView else { return }
        inputView.backgroundColor = kKeyboardBGColor

        //set suggestion view
        let colorArray = Color.shared.colorList()
        let colorList:[UIColor] = colorArray.map({ $0.colorSmall})
        
        //hide setting view
        hideSettingView()
        
        HintBarManager.shared.refreshColor(scrollView: suggestionBarScrollView, colorArray: colorList)
    }
    
    @objc func textColorButtonPressed(_ sender: Any) {
        print("textColorButtonPressed")
        openContainerApp()
        resetColor(sender)
        keySettingType = .TEXT_COLOR
        
        let colorArray = Color.shared.colorList()
        let colorList:[UIColor] = colorArray.map({ $0.colorSmall})
        
        //hide setting view
        hideSettingView()
        
        HintBarManager.shared.refreshColor(scrollView: suggestionBarScrollView, colorArray: colorList)
    }
    
    @objc func languageButtonPressed(_ sender: Any) {
        print("languageButtonPressed")
        openContainerApp()
        resetColor(sender)
        
        keySettingType = .LANGUAGE
        
        guard let inputView = inputView else { return }
        inputView.backgroundColor = kKeyboardBGColor
        
        //hide setting view
        hideSettingView()
        
        //set word suggestion view
        HintBarManager.shared.refreshLanguage(scrollView: suggestionBarScrollView, dataArray: kLanguageArray)
    }
    
    func resetColor(_ sender:Any) {
        bgColorButton.backgroundColor = .lightGray
        textColorBtn .backgroundColor = .lightGray
        fontButton   .backgroundColor = .lightGray
        langButton   .backgroundColor = .lightGray
        
        let button = sender as! UIButton
        button.backgroundColor = "photo0".colorSmall(30)
    }

    //MARK: OPEN CONTAINER APP
    func openContainerApp() {
        let textLeft  = textDocumentProxy.documentContextBeforeInput ?? ""
        let textRight = textDocumentProxy.documentContextAfterInput ?? ""
        let fullText  = textLeft + textRight
        print("text::\(fullText)")

        setObject(fullText, key: SUITE_KEY)
        //textDocumentProxy.insertText(fullText)
        
//        if counter == 0 || true {
//            textDocumentProxy.insertText(fullText)
//            setObject(fullText, key: SUITE_KEY)
//            let val = getObject(SUITE_KEY)
//            print("get val::\(val)")
//            counter += 1
//        }
        
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
    
//    override func loadView() {
//        super.loadView()
//
//        print("initialize keboard")
//        let val = getObject(SUITE_KEY) as? String ?? ""
//        print("get val::\(val)")
//        textDocumentProxy.insertText("loadView")
//    }
    
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
        
        let textLeft  = textDocumentProxy.documentContextBeforeInput ?? ""
        let textRight = textDocumentProxy.documentContextAfterInput ?? ""
        let fullText  = textLeft + textRight
        
        let val = getObject(SUITE_KEY) as? String ?? ""
        print("get val::\(val)")
        
        if fullText == val{
            return
        } else {
            setObject(val, key: SUITE_KEY)
        }
        
    }
}

extension KeyboardViewController: KeyboardViewDelegate {
    
    func didTapLongPressed() {
        hideSettingView()
    }
    
    func deleteCharacter(_ newCharacter: String) {
        textDocumentProxy.deleteBackward()
        let textLeft  = textDocumentProxy.documentContextBeforeInput ?? ""
        let textRight = textDocumentProxy.documentContextAfterInput  ?? ""
        let fullText  = textLeft + textRight
        
        setObject(fullText, key: SUITE_KEY)
        
        HintBarManager.shared.refresh(scrollView: suggestionBarScrollView, dataArray: getHintWords())
    }
    
    func insertCharacter(_ newCharacter: String) {
        
        //MARK:- TODO: play sound when tap letter
        //UIDevice.current.playInputClick()
        //AudioServicesPlaySystemSound (1104);
        //AudioServicesPlaySystemSound (0x450);
        
        hintBarType = .HINT_WORD
        
        //https://picturetosound.com/en/a/26/iphone-typing-on-keyboard
        audioManager.playSoundFile("key_sound.mp3")
        
        textDocumentProxy.insertText(newCharacter)
        
        let textLeft  = textDocumentProxy.documentContextBeforeInput ?? ""
        let textRight = textDocumentProxy.documentContextAfterInput ?? ""
        let fullText  = textLeft + textRight
        setObject(fullText, key: SUITE_KEY)
        print("insert :: \(fullText)")
        
        hideSettingView()
        
        //show hint word
        HintBarManager.shared.refresh(scrollView: suggestionBarScrollView, dataArray: getHintWords())
    }
    
    func insertHintWord(_ hintWord:String){
        //MARK: - TODO: insert word before cursor
        let deleteText  = textDocumentProxy.documentContextBeforeInput ?? ""
        let deleteWord  = deleteText.components(separatedBy: " ").last
        
        if let _deleteWord = deleteWord {
            for _ in 0..._deleteWord.count {
                textDocumentProxy.deleteBackward()
            }
        }
        
        textDocumentProxy.insertText(hintWord)
        
        let textLeft  = textDocumentProxy.documentContextBeforeInput ?? ""
        let textRight = textDocumentProxy.documentContextAfterInput ?? ""
        let fullText  = textLeft + textRight
        setObject(fullText, key: SUITE_KEY)
        print("insert word :: \(fullText)")
    }
    
    //MARK:- Keyboard special buttion action
    func gotoNextKeyboard(_ button: UIButton){
        button.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
    }
    
    func voiceButtonTapped(_ voiceButton: UIButton){
        print("voice button tapped")
        openContainerApp()
        
//        if voiceButton.isSelected{
//            print("voice recording...")
//            recordTapped()
//        } else{
//            print("voice stoped....")
//            recordDidFinish()
//        }
    }
    
    func altButtonPressed(_ altButton: UIButton) {
        print("alt button tapped:\(altButton.isSelected)")
        
        if altButton.isSelected {
            keyLetterMode = .NUMBERS
        } else {
            keyLetterMode = .LOWER_CASE
        }
        
        //kTextFontAlphabet = kUnicodeBnFontArray[button.tag]
        kTextFontAlphabet = getLetters(keyLetterMode)
        setObject(kTextFontAlphabet, key: kKeyAlphabetFont)
        //keyboardView.reloadFontBn(0)
        keyboardView.reloadFont(0)
        keyboardView.backgroundColor = kKeyboardBGColor
        
    }
    
    func shiftButtonPressed(_ shiftButton:UIButton){
        print("shift button tapped:\(shiftButton.isSelected)")
        
        if keyboardView.altButton.isSelected {
            keyLetterMode = shiftButton.isSelected ? .PANCTUATIONS : .NUMBERS
        } else {
            keyLetterMode = shiftButton.isSelected ? .UPPER_CASE : .LOWER_CASE
        }
        
        
        //kTextFontAlphabet = kUnicodeBnFontArray[button.tag]
        kTextFontAlphabet = getLetters(keyLetterMode)
        setObject(kTextFontAlphabet, key: kKeyAlphabetFont)
        //keyboardView.reloadFontBn(0)
        keyboardView.reloadFont(0)
        keyboardView.backgroundColor = kKeyboardBGColor
    }
}

//MARK:- HINT BAR DELEGATE METHODS
extension KeyboardViewController: HintBarDelegate {
    @objc func showFlotingView(){
        if let _floatingButtonView = floatingButtonView {
            _floatingButtonView.isHidden = false
        }
    }
    
    func didSartScroll(_ scrollView: UIScrollView) {
        print("scrollView start")
        if let _floatingButtonView = floatingButtonView {
            _floatingButtonView.isHidden = true
        }
    }
    
    func didEndScroll (_ scrollView: UIScrollView) {
        print("scrollView end")
        self.perform(#selector(showFlotingView), with: nil, afterDelay: 5)
    }
    
    func didSelectColor(_ sender: Any) {
        
        let button = sender as! UIButton
        let colorArray = Color.shared.colorList()
        let color:Color = colorArray[button.tag]
        
        switch keySettingType {
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
        
        switch hintBarType {
        case .HINT_WORD:
            print("HINT_WORD...")
            if let button = sender as? UIButton, let _hint = button.titleLabel?.text {
                insertHintWord(_hint)
                context = ""
                hintBarManager.refresh(scrollView: suggestionBarScrollView, dataArray: getHintWords(), selectedIndex: button.tag)
            }
            
        case .SETTING:
            print("hintBarType default")
            switch keySettingType {
            case .FONT:
                print("FONT")
                if let button = sender as? UIButton {
                    print("selected font tag::\(button.tag)")
                    hintBarManager.refresh(scrollView: suggestionBarScrollView, dataArray: kUnicodeFontNameArray,selectedIndex: button.tag)
                    
                    let button = sender as! UIButton
                    keySettingType    = .FONT //MARK:- TODO: try to remove this line
                    kTextFontAlphabet = kUnicodeFontArray[button.tag]
                    setObject(kTextFontAlphabet, key: kKeyAlphabetFont)
                    keyboardView.reloadFont(button.tag)
                    keyboardView.backgroundColor = kKeyboardBGColor
                    
                    
                    let selctedLang = "English"
                    let fontname = kUnicodeFontNameArray[button.tag]
                    
                    KeyInfo().setKeyInfo(langKey: selctedLang, fontValue: fontname)
                    let info = KeyInfo().getKeyInfo()
                    if let _info = info {
                        print("name::\(_info.fontDic)")
                    }
                    
                }
            case .COLOR:
                print("COLOR")
                
            case .TEXT_COLOR:
                print("TEXT_COLOR")
            case .LANGUAGE:
                print("LANGUAGE")
            }
            
        }
        
    }
    
    func didSelectLanguage(_ sender: Any) {
        print("didSelectLanguage")
        if let button = sender as? UIButton{
            hintBarManager.refreshLanguage(scrollView: suggestionBarScrollView, dataArray: kLanguageArray,selectedIndex: button.tag)
            keySettingType    = .LANGUAGE //MARK:- TODO: remove this line
            kTextFontAlphabet = kUnicodeLanguageArray[button.tag]
            setObject(kTextFontAlphabet, key: kKeyAlphabetFont)
            keyboardView.reloadFont(button.tag)
            keyboardView.backgroundColor = kKeyboardBGColor
            
            let selectedLang = kLanguageArray[button.tag]
            
            KeyInfo().setKeyInfo(langKey: selectedLang, fontValue: "Normal")
            let info = KeyInfo().getKeyInfo()
            if let _info = info {
                print("name::\(_info.fontDic)")
            }
        }
    }
}

//MARK:- CONVERT TO TEXT
extension KeyboardViewController:AudioManagerDelegate {
 
    @objc func recordTapped(){
        print("recordTapped.....")
        
        stopRecord()
        audioManager.recordTapped()
    }
    
    func stopRecord(){
        if audioManager.audioRecorder != nil {
            audioManager.audioRecorder.stop()
        }
    }
    
    func recordDidFinish(){
        print("convert start.....")
        convertToText2()
    }
    
    func restartSpeech(sec:Double){
        self.perform(#selector(resetSpeech), with: nil, afterDelay: sec)
    }
    
    @objc func resetSpeech(){
        //recordTapped() //enable this line for aumatic recording when app launch
        //restartSpeech(sec:5)
    }
    
    //convert recorded voice to text
    func convertToText2(){
        let audioManager = AudioManager()
        audioManager.delegate = self
        let speechModel  = SpeechModel()
        speechModel.fileUrl = audioManager.getDocumentsDirectory().appendingPathComponent("recording.flac")
        print("speechModel.fileUrl::\(speechModel.fileUrl)")
       
        speechModel.doTranslate2({errors in
            if let _errors = errors,_errors == nil {
                print("error::\(_errors.message)")
            } else {
                self.textDocumentProxy.insertText(" \(speechModel.convertedText)")
                print("text::\(speechModel.convertedText)")
            }
        })
    }
}

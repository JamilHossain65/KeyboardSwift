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
    
    //duplicate of 'langName' and 'fontName' in JhUtil
//    var langName = getString(kSelectedLanguageName) ?? English
//    var fontName = getString(kSelectedFontName)     ?? NORMAL
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
//        dispatch_async(dispatch_get_main_queue(), ^{
//                AudioServicesPlaySystemSound(1104);
//            });
        
        Bundle.setLanguage(lang: "en") //bn
        let button = UIButton()
        //app setting::3
        button.setTitle(JpHiragana, for: .normal) //MARK: - do it dynamic
        didSelectLanguage(button)
        refreshWordFile()
        hideSettingView()
        
        let isPurchased = getObject(kIsPurchaed) as? Bool ?? false
        if !isPurchased {
            self.perform(#selector(loadAd), with: nil, afterDelay: AD_MIN_TIME)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // When keyboard is create
        self.prepareHeightConstraint()
        
        if thisClassName.contains("KeyboardViewController") {
            /*
            deleteDoccumentText()
            
            let val = getObject(SUITE_KEY) as? String ?? ""
            // write to clipboard
            UIPasteboard.general.string = val
            // read from clipboard
            let content = UIPasteboard.general.string
            self.textDocumentProxy.insertText(content ?? "")
            */
            //check first ad
            let nowTime   = getCurrentTime()
            let PrevTime  = getObject(kPrevAdShownTime) as? TimeInterval ?? nowTime
            
            //check for first time ad show
            if nowTime == PrevTime || (nowTime - PrevTime) > AD_MIN_TIME*1000 {
                setObject(nowTime, key: kPrevAdShownTime)
                self.perform(#selector(loadAd), with: nil, afterDelay: 10)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showView()
    }
    
    @objc func loadAd(){
        let isAppUsed = getObject(kIsAppUsed) as? Bool ?? false
        if isAppUsed {
            if isAppActive {
                switch(adLoadingStatus){
                case .REQUESTED:
                    self.perform(#selector(loadAd), with: nil, afterDelay: 10)
                    break
                case .LOADING:
                    self.perform(#selector(loadAd), with: nil, afterDelay: 10)
                    break
                case .LOADED:
                    openContainerApp()
                    break
                default: //NOT_REQUESTED
                    adLoadingStatus = .REQUESTED
                    self.perform(#selector(loadAd), with: nil, afterDelay: 10)
                    break
                }
            }else{
                openContainerApp()
            }
        }
    }
    
    func refreshWordFile(){
        let filename = getFileName()
        guard let wordString = readf(filename) else {return}
        
        wordArray = wordString.components(separatedBy: "\n") //MARK: - TODO: crash sometimes
        log("words count::\(wordArray.count)")
        
        /*
        for str in wordArray{
            let word = str.components(separatedBy: "   ")
            
            if word.count == 3 {
                let wordTrimmed = word[1].trimmingCharacters(in: .whitespaces)
                //log("\(word[0])")
                log("\(wordTrimmed)")
            }
        }
        */
        
        /*
        //oria
        //https://www.punjabalerts.com/2020/10/1002003005001000-most-common-word-in_26.html
        var index = 0
        wordArray = wordArray.filter({$0 != ""})
        
        for str in wordArray{
            //log("index[\(index)]: \(str)")
            
            if index % 3 == 2 {
                log("\(str)")
            }
            index = index + 1
        }
        */
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
        log("user no longer writing....")
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
        log("context[\(context.count)]::\(context)")
        
        var wordList:[String] = [" "," "," "]
        //let uniqueWords = Array(Set(filteredArray))
        if langName == Indonesian{
            wordList = ["saya","hai","anda","mereka"]
        }else if langName == Russian{
            wordList = ["он","я","ты","Oни"]
        }else if langName == English{
            wordList = ["I","is","are","you"]
        }
        
        if context.count <= 0 {
            return wordList
        } else {
            let filteredArray = wordArray.filter (where: {$0.lowercased().hasPrefix(context)}, limit: 5)
            
            log("filteredArray::\(filteredArray)")
            if filteredArray.count > 0 {
                wordList = filteredArray
            }
        }
        
        //set word capitalization according to shift button status
        switch keyMode {
        case DOUBLE_TAP:
            wordList = wordList.map({$0.uppercased()})
        case SHIFT:
            wordList = wordList.map({$0.capitalized})
        default:
            wordList = wordList.map({$0.lowercased()})
        }
        
        log("wordList::\(wordList)")
        return wordList
    }
    
    @objc func checkWriting(){
        
        coutTime += 1
        //log("coutTime::\(coutTime)")
        if coutTime >= countLimit {
            timer?.invalidate()
            coutTime = 0
            showSettingView()
        }
    }
    
    func resetTimerToShowSettingOption(){
        coutTime = 0
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(checkWriting), userInfo: nil, repeats: true)
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
        
        refreshShiftKey()
        setString(getHintString(), key: kSelectedHintString)
        
        //set keyboard switch target
        nextButton = keyboardView.nextButton
        nextButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        //set word suggestion view
        let hintBarManager = HintBarManager.shared
        hintBarManager.delegate = self
        hintBarManager.addSuggestionBar(parentView: inputView, txtView: textDocumentProxy)
        
//        if isProVersion{
//            showSettingOptionView()
//        }
        
        showSettingOptionView()
        
        refreshWordFile()
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
        langButton.addTarget(self, action: #selector(languageSettingButtonPressed), for: .touchUpInside)
        langButton.titleLabel?.adjustsFontSizeToFitWidth = true
        langButton.backgroundColor = .white
        floatingButtonView.addSubview(langButton)
        
        //set font button selected initialy
        resetColor(UIButton())
        counter = 0
    }
    
    //MARK: SETTING BUTTON ACTION
    
    @objc func settingButtonPressed(_ sender: UIButton) {
        log("settingButtonPressed")
        showSettingOptionView()
    }
    
    
    @objc func fontButtonPressed(_ sender: Any) {
        log("fontButtonPressed")
        //openContainerApp()
        resetColor(sender)
        
        //hide setting view
        hideSettingView()
        
        hintBarType = .SETTING
        keySettingType = .FONT
        
        guard let inputView = inputView else { return }
        inputView.backgroundColor = kKeyboardBGColor
        
        let index = getFontNamesOf(langName).firstIndex(of: fontName)
        
        let fontnameList = getFontNamesOf(langName)
        
        //set word suggestion view
        HintBarManager.shared.refresh(scrollView: suggestionBarScrollView, dataArray: fontnameList, selectedIndex: index)
    }
    
    @objc func colorButtonPressed(_ sender: Any) {
        log("colorButtonPressed")
        //openContainerApp()
        resetColor(sender)
        
        keySettingType = .BG_COLOR
        
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
        log("textColorButtonPressed")
        //openContainerApp()
        resetColor(sender)
        keySettingType = .TEXT_COLOR
        
        let colorArray = Color.shared.colorList()
        let colorList:[UIColor] = colorArray.map({ $0.colorSmall})
        
        //hide setting view
        hideSettingView()
        
        HintBarManager.shared.refreshColor(scrollView: suggestionBarScrollView, colorArray: colorList)
    }
    
    @objc func languageSettingButtonPressed(_ sender: Any) {
        log("languageSettingButtonPressed")
        //openContainerApp()
        resetColor(sender)
        
        guard let inputView = inputView else { return }
        inputView.backgroundColor = kKeyboardBGColor
        
        //hide setting view
        hideSettingView()
        
        keySettingType = .LANGUAGE
        hintBarType = .SETTING
        
        //set word suggestion view
        log("langNameList::\(langNameArray)")
        let index = langNameArray.firstIndex(of: langName) ?? 0
        HintBarManager.shared.refreshLanguage(scrollView: suggestionBarScrollView, dataArray: langNameArray,selectedIndex: index)
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
    @objc func openContainerApp() {
        let textLeft  = textDocumentProxy.documentContextBeforeInput ?? ""
        let textRight = textDocumentProxy.documentContextAfterInput ?? ""
        let fullText  = textLeft + textRight
        log("text::\(fullText)")

        //setObject(fullText, key: SUITE_KEY)

        let url = URL(string: "\(appSchemeName)://") //VaticSoftThaiKeyboard://
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
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        
//        var textColor: UIColor
//        let proxy = self.textDocumentProxy
//        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
//            textColor = UIColor.white
//        } else {
//            textColor = UIColor.black
//        }
//
//        let textLeft  = textDocumentProxy.documentContextBeforeInput ?? ""
//        let textRight = textDocumentProxy.documentContextAfterInput ?? ""
//        let fullText  = textLeft + textRight
//
//        let val = getObject(SUITE_KEY) as? String ?? ""
//        log("get val::\(val)")
//
//        if fullText == val{
//            return
//        } else {
//            setObject(val, key: SUITE_KEY)
//        }
        
    }
}

extension KeyboardViewController: KeyboardViewDelegate {
    func spaceButtonDoubleTap(_ spaceButton : UIButton){
        insertCharacter("kDoubleSpace".localized())
    }
    
    func shiftButtonDoubleTap(_ shiftButton: UIButton) {
        log("shiftButtonDoubleTap::\(shiftButton.isSelected)")
        if !keyboardView.altButton.isSelected{
            keyMode = DOUBLE_TAP
            refreshShiftKey()
        }
    }
    
    func didReleaseLong( _ button:UIButton){
        refreshShiftKey()
    }
    
    func didTapLongPressed() {
        log("didTapLongPressed")
        hideSettingView()
    }
    
    func deleteCharacter(_ newCharacter: String) {
        writingMode = .DELETING
        hideSettingView()
        UIDevice.current.playInputClick()
        
        textDocumentProxy.deleteBackward()
        let textLeft  = textDocumentProxy.documentContextBeforeInput ?? ""
        let textRight = textDocumentProxy.documentContextAfterInput  ?? ""
        let fullText  = textLeft + textRight
        
        //setObject(fullText, key: SUITE_KEY)
        
        //refreshStatus()
        
        HintBarManager.shared.refresh(scrollView: suggestionBarScrollView, dataArray: getHintWords())
    }
    
    func insertCharacter(_ newCharacter: String) {
        let isAppUsed = getObject(kIsAppUsed) as? Bool ?? false
        if !isAppUsed {
            setObject(1, key: kIsAppUsed)
            openContainerApp()
        }
        
        //MARK:- TODO: play sound when tap letter
        //UIDevice.current.playInputClick()
        ////AudioServicesPlaySystemSound (1104);
        //AudioServicesPlaySystemSound (0x450);
        
        hintBarType = .HINT_WORD
        
        //https://picturetosound.com/en/a/26/iphone-typing-on-keyboard
        //audioManager.playSoundFile("key_sound.mp3")
        UIDevice.current.playInputClick()
        
        //check and update fullstop
        if newCharacter == "kDoubleSpace".localized() {
            updateFullStop(newCharacter)
        }else{
            if langName == BanglaDruti && newCharacter != " "{
                var _newCharacter = newCharacter.trimmingCharacters(in: .whitespaces)
//                let textLeft  = textDocumentProxy.documentContextBeforeInput ?? ""
//                if !BanglaConsonents.contains(textLeft.last!) &&  _newCharacter == "া"{
//                    _newCharacter = "আ"
//                }
                
                textDocumentProxy.insertText(_newCharacter)
            }else{
                textDocumentProxy.insertText(newCharacter)
            }
        }
        
        
        let textLeft  = textDocumentProxy.documentContextBeforeInput ?? ""
        //MARK: - Todo: implement korean jamo
        if langName == Korean {
            if shouldCombined(textLeft){
                let newText = combinedUnicode(textLeft)
                
                if kOREAN_BLOCK_TYPE == .INITIAL || kOREAN_BLOCK_TYPE == .MEDIAL || kOREAN_BLOCK_TYPE == .FINAL {
                    for _ in 0...1{
                        textDocumentProxy.deleteBackward()
                    }
                    textDocumentProxy.insertText(newText)
                    log("newText :: \(newText)")
                }
            }
        }
        
        let textRight = textDocumentProxy.documentContextAfterInput ?? ""
        let fullText  = textLeft + textRight
        //setObject(fullText, key: SUITE_KEY)
        log("insert :: \(fullText)")
        
        //Hide setting view from suggestion bar
        hideSettingView()
        
        //show hint word
        HintBarManager.shared.refresh(scrollView: suggestionBarScrollView, dataArray: getHintWords())
        //Refresh Shift Button Status
        refreshStatus()
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
        //setObject(fullText, key: SUITE_KEY)
        log("insert word :: \(fullText)")
    }
    
    //MARK:- Keyboard special buttion action
    func gotoNextKeyboard(_ button: UIButton){
        button.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
    }
    
    func voiceButtonTapped(_ voiceButton: UIButton){
        log("voice button tapped")
        openContainerApp()
        
//        if voiceButton.isSelected{
//            log("voice recording...")
//            recordTapped()
//        } else{
//            log("voice stoped....")
//            recordDidFinish()
//        }
    }
    
    func altButtonPressed(_ altButton: UIButton) {
        log("alt button tapped:\(altButton.isSelected)")

        if keyboardView.altButton.isSelected {
            if keyboardView.shiftButton.isSelected{
                keyboardView.buttonPressed(sender: keyboardView.shiftButton)
            }
        } else {
            let leftText = self.textDocumentProxy.documentContextBeforeInput
            if let _leftText = leftText,_leftText.count > 0 {
                
            }else{
                if !keyboardView.shiftButton.isSelected {
                    keyboardView.buttonPressed(sender: keyboardView.shiftButton)
                }
            }
        }
        
        refreshShiftKey()
        
        keyboardView.backgroundColor = kKeyboardBGColor
    }
    
    func shiftButtonPressed(_ shiftButton:UIButton){
        log("shift button tapped:\(shiftButton.isSelected)")
        if !keyboardView.altButton.isSelected {
            keyMode = keyMode == NORMAL ? SHIFT : NORMAL
        }
        
        refreshShiftKey()
        keyboardView.backgroundColor = kKeyboardBGColor
    }
    
    func updateFullStop(_ newCharacter:String){
        let text  = textDocumentProxy.documentContextBeforeInput ?? ""
        log("full stop text::\(text)")
        
        if writingMode == .INSERTING{
            if String(text.suffix(2)) == "kStopSpace".localized(){
                textDocumentProxy.insertText("kDoubleSpace".localized())
            }else if String(text.suffix(2)) == "kDoubleSpace".localized(){
                textDocumentProxy.insertText("kDoubleSpace".localized())
            }else{
                if String(text.suffix(1)) == " "{
                    textDocumentProxy.deleteBackward()
                    textDocumentProxy.insertText("kStopSpace".localized())
                }else{
                    textDocumentProxy.insertText("kStopSpace".localized())
                }
            }
            
        }else{
            textDocumentProxy.insertText(newCharacter)
        }
        writingMode = .INSERTING
    }
    
    func refreshStatus(){
        let textLeft  = textDocumentProxy.documentContextBeforeInput ?? ""
        if textLeft.count > 0 {
            let last2 = String(textLeft.suffix(2))
            if last2 == "kStopSpace".localized(){
                keyMode = SHIFT
                keyboardView.altButton.isSelected = false
                refreshShiftKey()
            }else{
                if !keyboardView.altButton.isSelected {
                    keyMode = keyMode == SHIFT ? NORMAL : keyMode
                }
            }
        }else{
            keyboardView.altButton.isSelected = false
            keyMode = SHIFT
        }
    }
    
    func refreshShiftKey(){
        
        if keyboardView.altButton.isSelected{ //NUMERIC,SYMBOL
            keyMode = keyboardView.shiftButton.isSelected ? SYMBOL : NUMERIC
        } else { //NORMAL,SHIFT
            if keyMode == SHIFT || keyMode == DOUBLE_TAP {
                keyboardView.shiftButton.isSelected = true
            }else{
                keyboardView.shiftButton.isSelected = false
            }
            
            keyMode = keyboardView.shiftButton.isSelected ? keyMode == DOUBLE_TAP ? DOUBLE_TAP:SHIFT : NORMAL
        }
        
        log("keyboardView.altButton::\(keyboardView.altButton.isSelected)")
        log("keyboardView.shiftButton::\(keyboardView.shiftButton.isSelected)")
        
        log("langName::\(langName)")
        log("fontName::\(fontName)")
        log("keyMode ::\(keyMode)")
        
        dataSource = getAlphabetOf(langName,fontName,keyMode)
        keyboardView.reloadFont(dataSource)
    }
    
}

//MARK:- HINT BAR & SCROLL VIEW DELEGATE METHODS
extension KeyboardViewController: HintBarDelegate {
    func didTapRefreshSetting(_ button: UIButton) {
        button.isSelected = !button.isSelected
        if button.isSelected{
            //Hide setting view from suggestion bar
            hideSettingView()
            
            //show hint word
            HintBarManager.shared.refresh(scrollView: suggestionBarScrollView, dataArray: getHintWords())
        }else{
            showSettingView()
        }
    }
    
    func didSartScroll(_ scrollView: UIScrollView) {
        log("scrollView start")
        resetTimerToShowSettingOption()
    }
    
    func doingScroll(_ scrollView: UIScrollView) {
        log("doingScroll.....")
        resetTimerToShowSettingOption()
    }
    func didEndScroll (_ scrollView: UIScrollView) {
        log("scrollView end")
        resetTimerToShowSettingOption()
    }
    
    func didSelectColor(_ sender: Any) {
        //show setting option view
        resetTimerToShowSettingOption()
        
        let button = sender as! UIButton
        let colorArray = Color.shared.colorList()
        let color:Color = colorArray[button.tag]
        
        switch keySettingType {
        case .BG_COLOR:
            kKeyboardBGColor = color.color
            inputView?.backgroundColor = kKeyboardBGColor
            //log("pattern color:::\(kKeyboardBGColor)")
            
            if color.colorType == .PATTERN {
                setObject(color.imageName, key: kKeyBgImageName)
            } else {
                UserDefaults.standard.keyboardBgColor = kKeyboardBGColor
            }
            
            keyboardView.backgroundColor = kKeyboardBGColor
            //showSettingView()
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
            //showSettingView()
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
        
        //show setting option view
        resetTimerToShowSettingOption()
        
        switch hintBarType {
        case .HINT_WORD:
            log("HINT_WORD...")
            if let button = sender as? UIButton, let _hint = button.titleLabel?.text {
                insertHintWord(_hint)
                context = ""
                HintBarManager.shared.refresh(scrollView: suggestionBarScrollView, dataArray: getHintWords(), selectedIndex: button.tag)
            }
            
        case .SETTING:
            log("hintBarType default")
            switch keySettingType {
            case .FONT:
                log("FONT")
                if let button = sender as? UIButton {
                    log("selected font tag::\(button.tag)")
                    fontName = button.titleLabel?.text?.trimmingCharacters(in:.whitespaces) ?? NORMAL
                    
                    setString(fontName, key: kSelectedFontName)
                    
                    dataSource = getAlphabetOf(langName,fontName,NORMAL)
                    log("kTextFontAlphabet ::\(dataSource)")
                    
                    let fontNameList = getFontNamesOf(langName)
                    let index = fontNameList.firstIndex(of: fontName) ?? 0
                    
                    HintBarManager.shared.refresh(scrollView: suggestionBarScrollView, dataArray: fontNameList,selectedIndex: index)
                    
                    //keySettingType    = .FONT //MARK:- TODO: try to remove this line
                    keyboardView.reloadFont(dataSource)
                    keyboardView.backgroundColor = kKeyboardBGColor
                    //showSettingView()
                }
            case .BG_COLOR:
                log("COLOR")
                
            case .TEXT_COLOR:
                log("TEXT_COLOR")
            case .LANGUAGE:
                log("LANGUAGE")
            }
            
        }
        
    }
    
    func didSelectLanguage(_ sender: Any) {
        log("didSelectLanguage")
        if let button = sender as? UIButton{
            
            keySettingType = .LANGUAGE
            keyMode = NORMAL
            
            langName = button.titleLabel?.text?.trimmingCharacters(in: .whitespaces) ?? English
            setString(langName , key: kSelectedLanguageName)
            print("langName::\(langName)")
            
            if langName == BanglaDruti{
                letterKeyType = .REPLACE
            }
            
            //MARK: - TODO: Do it dynamic
            //app setting::204
            if langName == JpHiragana || langName == JpKatakana { //"বাংলা"
                Bundle.setLanguage(lang: "ja") //bn, my, ja
            }else if langName == BanglaGoti{
                Bundle.setLanguage(lang: "bn") 
            }else if langName == BanglaDruti{
                Bundle.setLanguage(lang: "bn")
            }else if langName == Spanish{
                Bundle.setLanguage(lang: "es") //spanish
            }else if langName == Russian{
                Bundle.setLanguage(lang: "ru")
            }else if langName == Thai{
                Bundle.setLanguage(lang: "th")
            }else{
                Bundle.setLanguage(lang: "en")
            }
            
            let allFontNameArray = getFontNamesOf(langName)
            if !allFontNameArray.contains(fontName){
                fontName = NORMAL
            }
            
            //set hint string for key cap view
            setString(getHintString(), key: kSelectedHintString)
            dataSource = getAlphabetOf(langName,fontName,NORMAL)
            //log("kTextFontAlphabet ::\(dataSource)")
            
            let index = langNameArray.firstIndex(of: langName) ?? 0
            
            HintBarManager.shared.refreshLanguage(scrollView: suggestionBarScrollView, dataArray: langNameArray,selectedIndex: index)

            keyboardView.reloadFont(dataSource)
            keyboardView.backgroundColor = kKeyboardBGColor
            
            //update file from selected language
            refreshWordFile()
            //show setting option view
            resetTimerToShowSettingOption()
            
//            let paragraphStyle = NSMutableParagraphStyle()
//            if(true){
//                paragraphStyle.alignment = .justified
//                paragraphStyle.baseWritingDirection = .rightToLeft
//                
//            }else{
//                paragraphStyle.alignment = .justified
//                paragraphStyle.baseWritingDirection = .leftToRight
//            }
//            
//            inputView?.makeTextWritingDirectionRightToLeft(button)
            
        }
    }
}

//MARK:- CONVERT TO TEXT
extension KeyboardViewController:AudioManagerDelegate {
 
    @objc func recordTapped(){
        log("recordTapped.....")
        
        stopRecord()
        audioManager.recordTapped()
    }
    
    func stopRecord(){
        if audioManager.audioRecorder != nil {
            audioManager.audioRecorder.stop()
        }
    }
    
    func recordDidFinish(){
        log("convert start.....")
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
        log("speechModel.fileUrl::\(speechModel.fileUrl)")
       
        speechModel.doTranslate2({errors in
            if let _errors = errors,_errors == nil {
                log("error::\(_errors.message)")
            } else {
                self.textDocumentProxy.insertText(" \(speechModel.convertedText)")
                log("text::\(speechModel.convertedText)")
            }
        })
    }
}

//
//  HomeViewController.swift
//  KeyboardSwift
//
//  Created by Jamil on 22/2/21.
//

import UIKit
import DropDown
import AppTrackingTransparency
import AdSupport
import StoreKit
import Appodeal

import GoogleMobileAds
import UserMessagingPlatform
import SwiftyJSON

class HomeViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    private var isMobileAdsStartCalled = false
    private var rewardedInterstitialAd: GADRewardedInterstitialAd?
    //app setting:: 7
    //MARK: - TODO manually: "Bundle display name" of 'TargetName_info.plist' file replace to keyboardExtension "Display Name".
    //copy "Bundle identifier" from submit_info.txt file and paste the Bundle Identifier to keyboardExtension.
    //select group from  Siging & Capabilities both target app and keyboardExtension app.
    
    //app setting:: 8
    //MARK: - TODO manually: Target version and keyboardExtension will be same.
    
    //access token
    //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
    
    @IBOutlet weak var textView: UITextView!
//    let monthlySubID = "MyApp.sub.allaccess.monthly"
//    let yearlySubID = "MyApp.sub.allaccess.yearly"
    //app setting::12
    var fullVersionID: String {
        get {
            let langName = getString(SelectedLanguage)
            
            switch langName {
            case Bangla:
                return ""
            case BanglaGoti:
                return "com.vaticsoft.iap.BanglaKeyboardGotiFullVersion"
            case BanglaDruti:
                return "com.vaticsoft.iap.BanglaKeyboardDrutiNewFullVersion"
            case Thai:
                return "com.vaticsoft.keyboard.thai.iap"
                //return "com.vaticsoft.iap.ThaiKeyboardFullVersion"
            case Gujarati:
                return ""
            case Hindi:
                return ""
            case Kannada:
                return ""
            case Malayalam:
                return ""
            case Marathi:
                return ""
            case Nepali:
                return ""
            case Oriya:
                return ""
            case Punjabi:
                return ""
            case Sanskrit:
                return ""
            case Tamil:
                return ""
            case Telugu:
                return ""
            case Urdu:
                return ""
            case Indonesian:
                return ""
            case Russian:
                return "com.vaticsoft.iap.russianKeyboard"
            case Spanish:
                return "com.vaticsoft.iap.spanishKeyboard"
            case French:
                return ""
            case German:
                return ""
            case Italian:
                return ""
            case Korean:
                return ""
            case Turkish:
                return ""
            case Portuguese:
                return ""
            case Burmese:
                return "com.vaticsoft.iap.burmeseKeyboard"
            case JpHiragana:
                return "com.vaticsoft.iap.keyboard.japanese"
            case JpKatakana:
                return "com.vaticsoft.iap.JapaneseKeyboard"
            case SmartFonts:
                return "SmartFontRemoveAds"
            default://English
                return "SmartFontRemoveAds"
            }
        }
    }
    
    var productsArray: [SKProduct] = []
    
    var recordButton : UIButton!
    var languageButton : UIButton!
    let audioManager = AudioManager()
    //app setting:: 104
    //let actLanguages =  [English,Bangla,Gujarati,Hindi,Kannada,Malayalam,Marathi,Oriya,Punjabi,Tamil,Telugu] //activeLanguages.filter({$0.1}).map({$0.0})
    
    //let actLanguages = [English,Russian]
    let actLanguages = activeLanguages.filter({$0.1}).map({$0.0})//MARK: - make it ordered array
    
    let dropDown = DropDown()
    let isPurchased = getObject(kIsPurchaed) as? Bool ?? false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        isAppActive = true
        //requestConsentInfoUpdate()
        
        AdAppodeal.shared.initializeAppodealSDK()
        
        if !isPurchased {//not paid user
            loadAd()
            if isAppUsed{ //app already used
                perform(#selector(checkAdLoadRequesting), with: nil, afterDelay: 5)
                perform(#selector(showAdmobInterstitial), with: nil, afterDelay: AD_MIN_TIME)
            }
        }
        
        let restore = UIBarButtonItem(title: "Restore", style: .plain, target: self, action: #selector(restoreButtonPressed))
        let buy = UIBarButtonItem(title: "Buy", style: .plain, target: self, action: #selector(buyButtonPressed))
        let adButton = UIBarButtonItem(title: " ", style: .plain, target: self, action: #selector(rewardedAdButtonPressed))
        let done = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonPressed))
        
        self.navigationItem.leftBarButtonItems = [restore,buy]
        self.navigationItem.rightBarButtonItems = [adButton,done]
        
        self.textView.frame.origin.y = SizeConfig.navBarHeight
        
        IAPHandler.shared.isLogEnabled = true
        IAPHandler.shared.setProductIds(ids: [fullVersionID])
        IAPHandler.shared.fetchAvailableProducts { [weak self](products)   in
           guard let sSelf = self else {return}
           sSelf.productsArray = products
           //sSelf.tableView.reloadData() //reload you table or collection view
        }

        //app setting:: 105
        var selectedIndex = 1
        if actLanguages.count > 2 {
            selectedIndex = 1
            dropDown.dataSource = actLanguages
            dropDown.selectRow(at: selectedIndex)
            dropDown.dismissMode = .onTap
        }
        
        setObject(selectedIndex, key: SelectedLanguage)
        
        /*
        textView.text =
            "𝕥𝕙𝕖𝕣𝕖 𝕒𝕣𝕖 𝕞𝕒𝕟𝕪 𝕗𝕠𝕟𝕥𝕤 𝕚 𝕔𝕒𝕟 𝕦𝕤𝕖\n" +
            //"ᴛʜᴇʀᴇ ᴀʀᴇ ᴍᴀɴʏ ғᴏɴᴛs ɪ ᴄᴀɴ ᴜsᴇ\n" +
            //"tᕼᗴᖇᗴ ᗩᖇᗴ ᗰᗩᑎy ᖴoᑎyᔕ i ᑕᗩᑎ ᑌᔕᗴ\n" +
            "ⓜ︎ⓐⓝⓨ ⓕⓞⓝⓣⓢ\n"  +
            //"t̆̈h̆̈ĕ̈r̆̈ĕ̈ ă̈r̆̈ĕ̈ m̆̈ă̈n̆̈y̆̈ f̆̈ŏ̈n̆̈t̆̈s̆̈ ĭ̈ c̆̈ă̈n̆̈ ŭ̈s̆̈ĕ̈\n" +
            "t̾h̾e̾r̾e̾ a̾r̾e̾ m̾a̾n̾y̾ f̾o̾n̾t̾s̾ i̾ c̾a̾n̾ u̾s̾e̾\n" +
            "t̥ͦh̥ͦe̥ͦr̥ͦe̥ͦ ḁͦr̥ͦe̥ͦ m̥ͦḁͦn̥ͦy̥ͦ f̥ͦo̥ͦn̥ͦt̥ͦs̥ͦ i̥ͦ c̥ͦḁͦn̥ͦ u̥ͦs̥ͦe̥ͦ\n" +
            //"t͟h͟e͟r͟e͟ a͟r͟e͟  m͟a͟n͟y f͟o͟n͟t͟s͟ i͟ c͟a͟n͟ u͟s͟e͟\n" +
            "m҉a҉n҉y҉ f҉o҉n҉t҉s҉ \n"
            //"t̸h̸e̸r̸e̸ a̸r̸e̸ m̸a̸n̸y̸ f̸o̸n̸t̸s̸ i̸ c̸n̸ u̸s̸e̸\n"
        */
        
        if let _ = textView{
            textView.delegate = self
            textView.layer.borderWidth  = 1.0
            textView.layer.cornerRadius = 8.0
            textView.layer.borderColor  = UIColor.lightGray.cgColor
            textView.becomeFirstResponder()
        }
        
        //textView.text = "saya bisa menulis bahasa indonesia dengan berbicara"
        //showLoading(view: textView)
        
        //record audio
        audioManager.initAudio()
        audioManager.delegate = self
        //MARK: - Enable speek button
//        addLanguageButtonUI()
//        addSpeakButtonUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @objc func checkAdLoadRequesting(){
        print("adLoadingStatus::\(adLoadingStatus)")
        switch adLoadingStatus{
        case .REQUESTED:
            adLoadingStatus = .LOADING
            perform(#selector(checkAdLoadRequesting), with: nil, afterDelay: 10)
            break
        default:
            break
        }
    }
    
    func showAdmobAdFromHelperApp(){
        //appThaiSetting()
        //appJpSetting()
        
        log("isAppUsed:::\(isAppUsed)")
        log("isAppActive:::\(isAppActive)")
        log("adLoadingStatus:::\(adLoadingStatus)")
        
        isAppActive = true
        
        if isAppUsed { //app already used
            if adLoadingStatus == .LOADED{
                AdmobController.shared.showRewardedInterstitial(self)
            }else{
                AdmobController.shared.showAdmobInterstitial(self)
            }
        }
    }
    
    @objc func loadAdmob(){
        //AdManager.shared.loadAdMobAdsOnParrent(self)
        AdmobController.shared.loadRewardedInterstitial(self)
    }
    
    func requestConsentInfoUpdate(){
        // Create a UMPRequestParameters object.
        let parameters = UMPRequestParameters()
        // Set tag for under age of consent. false means users are not under age
        // of consent.
        let debugSettings = UMPDebugSettings()
        parameters.tagForUnderAgeOfConsent = false
        //app setting::205
//        debugSettings.testDeviceIdentifiers = [ GADSimulatorID ]
//        debugSettings.geography = .EEA
        parameters.debugSettings = debugSettings
        
        // Request an update for the consent information.
        UMPConsentInformation.sharedInstance.requestConsentInfoUpdate(with: parameters) {
            [weak self] requestConsentError in
            guard let self else { return }
            
            if let consentError = requestConsentError {
                // Consent gathering failed.
                return print("Error: \(consentError.localizedDescription)")
            }
            
            self.showForm()
        }
        
        // Check if you can initialize the Google Mobile Ads SDK in parallel
        // while checking for new consent information. Consent obtained in
        // the previous session can be used to request ads.
        //        if UMPConsentInformation.sharedInstance.canRequestAds {
        //            startGoogleMobileAdsSDK()
        //        }
    }
    
    func showForm(){
        UMPConsentForm.load(completionHandler: { form, loadError in
            if loadError != nil {
                // Handle the error.
                print("loadError::\(loadError)")
            } else {
                // Present the form. You can also hold on to the reference to present
                // later.
                if UMPConsentInformation.sharedInstance.consentStatus == UMPConsentStatus.required {
                    form?.present(
                        from: self,
                        completionHandler: { dismissError in
                            if UMPConsentInformation.sharedInstance.consentStatus == UMPConsentStatus.obtained {
                                // App can start requesting ads.
                            }
                            // Handle dismissal by reloading form.
                        })
                } else {
                    // Keep the form available for changes to user consent.
                    
                }
            }
        })
    }
    
    private func startGoogleMobileAdsSDK() {
        DispatchQueue.main.async {
            guard !self.isMobileAdsStartCalled else { return }
            
            self.isMobileAdsStartCalled = true
            
            // Initialize the Google Mobile Ads SDK.
            GADMobileAds.sharedInstance().start()
            //GADMobileAds.sharedInstance().applicationVolume = 0.0
            // TODO: Request an ad.
            // GADInterstitialAd.load(...)
        }
    }
    
    @objc func restoreButtonPressed(){
        print("restoreButtonPressed")
        //setObject(0, key: kIsPurchaed)
        IAPHandler.shared.restorePurchase()
    }
    
    @objc func buyButtonPressed(){
        print("buyButtonPressed::\(self.productsArray[0])")
        //setObject(1, key: kIsPurchaed)
        
        IAPHandler.shared.purchase(product: self.productsArray[0]) { (alert, product, transaction) in
            if let tran = transaction, let prod = product {
                //use transaction details and purchased product as you want
                setObject(1, key: kIsPurchaed)
            }
            //Globals.shared.showWarnigMessage(alert.message)
        }
    }
    
    @objc func doneButtonPressed(){
        print("doneButtonPressed")
        view.endEditing(true)
    }
    
    @objc func rewardedAdButtonPressed(){
        AdManager.shared.showAppodealNonSkippableAdsOn(self)
    }
    
    func showLoading(view:UIView){
        textView.text = "this is hossain jamil jam ja ahs ajk ahsja   hsajkhs akjh sajk hasjkhs jakhsk hajks haksj test"
        
        if let caret = textView.caret {
            
            let loading = UIActivityIndicatorView(frame: CGRect(x: caret.origin.x, y: caret.origin.y + 5, width: 17, height: 17))
            loading.hidesWhenStopped = true
            loading.style = UIActivityIndicatorView.Style.gray
            loading.startAnimating()
            view.addSubview(loading)
            
            print("caret::\(caret)")
        }
        
    }
    
    func addSpeakButtonUI(){
        recordButton = UIButton(frame: CGRect(x: textView.frame.size.width - 75, y: textView.frame.size.height - 44, width: 70, height: 40))
        recordButton.setTitle("Speak", for: .normal)
        recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
        recordButton.backgroundColor = .gray
        recordButton.layer.cornerRadius = 7
        restartSpeech(sec:5)
        textView.addSubview(recordButton)
    }
    
    func addLanguageButtonUI(){
        /*
        let actLanguages = activeLanguages.filter({$0.1}).map({$0.0})
        let countryCode1 = countryCodes[actLanguages.first ?? ""] ?? ""
        let countryCode2 = countryCodes[actLanguages.last ?? ""] ?? ""
        
        print("countryCode1::\(countryCode1)")
        print("countryCode2::\(countryCode2)")
        
        var codeBd = flag(from: "bd")//bd
        var codeEn = flag(from: "us") //us
        
        if countryCode1 == "us"{
            codeEn = flag(from: countryCode1)
            codeBd = flag(from: countryCode2)
        }else{
            codeEn = flag(from: countryCode2)
            codeBd = flag(from: countryCode1)
        }
        
        print("codeBd::\(codeBd)")
        print("codeEn::\(codeEn)")
        */
        print("actLanguages::\(actLanguages)")
        
        languageButton = UIButton(frame: CGRect(x: textView.frame.size.width - 122, y: textView.frame.size.height - 44, width: 40, height: 40))
        
        languageButton.layer.borderWidth  = 1.0
        languageButton.layer.cornerRadius = 20.0
        languageButton.layer.borderColor  = UIColor.lightGray.cgColor
        
        languageButton.titleLabel?.font   = UIFont(name: "Arial", size: 25)
        //languageButton.setTitle(countryFlag, for: .normal)
        
//        playButton.setTitle("\(codeBd)", for: .normal)
//        playButton.setTitle("\(codeEn)", for: .selected)
        languageButton.setTitleColor(.black, for: .normal)
        languageButton.setTitleColor(.black, for: .selected)
        
        languageButton.addTarget(self, action: #selector(playButtonTapped(sender:)), for: .touchUpInside)
        textView.addSubview(languageButton)
        languageButton.backgroundColor = .clear
        
        if actLanguages.count > 2{
            let index:Int   = getObject(SelectedLanguage) as? Int ?? 0
            let countryName = self.actLanguages[index]
            let countryCode:[String] = countryCodes.filter({$0.0 == countryName}).map({$0.1})
            let _countryCode:String = countryCode.first ?? ""
            let countryFlag = flag(from: _countryCode)
            languageButton.setTitle(countryFlag, for: .normal)
            
        }else{
            let actLanguages = activeLanguages.filter({$0.1}).map({$0.0})
            print("actLanguages::\(actLanguages)")
            
            let countryCode1 = countryCodes[actLanguages.first ?? ""] ?? ""
            let countryCode2 = countryCodes[actLanguages.last ?? ""] ?? ""
            
            print("countryCode1::\(countryCode1)")
            print("countryCode2::\(countryCode2)")
            
            var codeBd = flag(from: "bd")//bd //MARK: -  initally selected language
            var codeEn = flag(from: "us") //us
            
            if countryCode1 == "us"{
                codeEn = flag(from: countryCode1)
                codeBd = flag(from: countryCode2)
            }else{
                codeEn = flag(from: countryCode2)
                codeBd = flag(from: countryCode1)
            }
            
            print("codeBd::\(codeBd)")
            print("codeEn::\(codeEn)")
            languageButton.setTitle("\(codeBd)", for: .normal)
            languageButton.setTitle("\(codeEn)", for: .selected)
        }
    }
    
    @objc func recordTapped(){
        stopRecord()
        
        audioManager.recordTapped()
        recordButton.isSelected = !recordButton.isSelected
        recordButton.setTitle("Record", for: .normal)
        recordButton.setTitle("Stop", for: .selected)
        recordButton.backgroundColor = recordButton.isSelected ? .red: .gray
    }
    
    func stopRecord(){
        if audioManager.audioRecorder != nil {
            audioManager.audioRecorder.stop()
        }
    }
    
    @objc func playButtonTapped(sender:UIButton){
        log("playButtonTapped::\(actLanguages)")
        
        if actLanguages.count > 2{
            let button = UIButton()
            var mFrame = sender.frame
            mFrame.origin.y = 0
            button.frame = mFrame
            
            dropDown.anchorView = button
            dropDown.direction = .any
            //dropDown.bottomOffset = CGPoint(x: 0, y: 0)
            dropDown.show()
            
            dropDown.selectionAction = { [] (index, item) in
                
                setObject(index, key: SelectedLanguage)
                
                let countryCode:[String] = countryCodes.filter({$0.0 == item}).map({$0.1})
                let _countryCode:String = countryCode.first ?? ""
                //log("countryCode :: \(_countryCode)")
                
                if _countryCode.count > 0 {
                    let countryFlag = flag(from: _countryCode)
                    //log("countryFlag :: \(countryFlag)")
                    self.languageButton.setTitle(countryFlag , for: .normal)
                }else{
                    let langCode:[String] = languageCodes.filter({$0.0 == item}).map({$0.1})
                    let _langCode:String = langCode.first ?? ""
                    //log("selected value :: \(_langCode)")
                    self.languageButton.setTitle(_langCode.capitalized , for: .normal)
                    
                }
            }
        }else{
            let _non_english = actLanguages.filter({$0 != English}).first ?? ""
            let countryEn:[String] = countryCodes.filter({$0.0 == English}).map({$0.1})
            let countryBd:[String] = countryCodes.filter({$0.0 == _non_english}).map({$0.1})
            
            let _countryEn:String = countryEn.first ?? ""
            let _countryBd:String = countryBd.last ?? ""
            
            let flagEn = flag(from: _countryEn)
            let flagBd = flag(from: _countryBd)
            self.languageButton.setTitle(flagEn, for: .selected)
            self.languageButton.setTitle(flagBd, for: .normal)
            self.languageButton.isSelected = !sender.isSelected
        }
    }
    
    func convertToText2(lang:String){
        let audioManager = AudioManager()
        audioManager.delegate = self
        let speechModel  = SpeechModel()
        speechModel.convertedLanguage = lang
        speechModel.fileUrl = audioManager.getDocumentsDirectory().appendingPathComponent("recording.flac")
        
        //loading(view: self.textView, stop: false)
        speechModel.doTranslate2({errors in
            
            if let _errors = errors,_errors.message?.count ?? 0 > 0 {
                log("error::\(_errors.message)")
                showAlertOkay(message: "Error found!", completion: { _ in})
            } else {
                self.textView.text += " \(speechModel.convertedText)"
                log("text::\(speechModel.convertedText)")
            }
        })
    }
    
    func testSimpleAPI(){
        let url = BASE_URL + API_TEST
        APIRequest(url).params([:], method:.GET, header: "", completion: {(response,errors) in
            if errors == nil {
                //print("response:\(response.json)\n")
                if let _response = response?.json {
                    if let name = _response["test"] as? String {
                        log(name)
                    }
                }
                
            } else {
                log("error:\(errors?.message)")
            }
        })
    }
    
    func appThaiSetting(){
        let url = "https://jamilhossain65.github.io/app-setting.json"
        APIRequest(url).params([:], method:.GET, header: "", completion: {(response,errors) in
            if errors == nil {
                //print("response:\(response?.json)\n")
                if let _response = response?.json {
                    if let thaiSetting = _response["thai_keyboard"]{
                        let isForceUpdate:Bool = JSON(thaiSetting)["is_force_update"].boolValue
                        let appLink:String = JSON(thaiSetting)["app_link"].stringValue
                        let alertTitle:String = JSON(thaiSetting)["alert_title"].string ?? "Update App"
                        let alertMessage:String = JSON(thaiSetting)["alert_message"].string ?? ""
                        let okButton:String = JSON(thaiSetting)["ok_button"].string ?? "Update"
                        
                        if isForceUpdate {
                            weak var _self = self
                            DispatchQueue.main.async(execute: {
                                showAlertOkay(_self, title:alertTitle, message: alertMessage, ok: okButton, completion:{ isOkay in
                                    //log("appLink::\(appLink)")
                                    let appName = "VaticSoftThaiKeyboard" //VaticSoftThaiKeyboardOld
                                    if isAppInstalled(appName){
                                        log("ThaiKeyboard already installed")
                                        let appScheme = "\(appName)://app"
                                        if let url = URL(string: appScheme) {
                                            DispatchQueue.main.async(execute: {
                                                UIApplication.shared.open(url)
                                            })
                                        }
                                    }else{
                                        log("app not install.")
                                        if let url = URL(string: appLink) {
                                            DispatchQueue.main.async(execute: {
                                                UIApplication.shared.open(url)
                                            })
                                        }
                                    }
                                })
                            })
                        }else{
                            self.showAdmobInterstitial()
                        }
                    }
                }
            } else {
                log("error:\(String(describing: errors?.message))")
            }
        })
    }
    
    func appJpSetting(){
        let url = "https://jamilhossain65.github.io/app-setting.json"
        APIRequest(url).params([:], method:.GET, header: "", completion: {(response,errors) in
            if errors == nil {
                //print("response:\(response?.json)\n")
                if let _response = response?.json {
                    if let thaiSetting = _response["japanese_keyboard"]{
                        let isForceUpdate:Bool = JSON(thaiSetting)["is_force_update"].boolValue
                        let appLink:String = JSON(thaiSetting)["app_link"].stringValue
                        let alertTitle:String = JSON(thaiSetting)["alert_title"].stringValue
                        let okButton:String = JSON(thaiSetting)["ok_button"].stringValue
                        
                        if isForceUpdate {
                            weak var _self = self
                            DispatchQueue.main.async(execute: {
                                showAlertOkay(_self, title:alertTitle, ok: okButton, completion:{ isOkay in
                                    //log("appLink::\(appLink)")
                                    let appName = "VaticSoftJapaneseKeyboardOld" //VaticSoftJapaneseKeyboard
                                    if isAppInstalled(appName){
                                        log("VaticSoftJapaneseKeyboard already installed")
                                        let appScheme = "\(appName)://app"
                                        if let url = URL(string: appScheme) {
                                            DispatchQueue.main.async(execute: {
                                                UIApplication.shared.open(url)
                                            })
                                        }
                                    }else{
                                        log("app not install.")
                                        if let url = URL(string: appLink) {
                                            DispatchQueue.main.async(execute: {
                                                UIApplication.shared.open(url)
                                            })
                                        }
                                    }
                                })
                            })
                        }else{
                            self.showAdmobInterstitial()
                        }
                    }
                }
            } else {
                log("error:\(String(describing: errors?.message))")
            }
        })
    }
}

extension HomeViewController:UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView){
        //if #available(iOS 15.0, *) { }
        //app setting::114
        if !isAppUsed && textView.text.count > 0 { //MARK:- todo enable this keyboard
            let isPurchased = getObject(kIsPurchaed) as? Bool ?? false
            if !isPurchased{
                setObject(1, key: kIsAppUsed)
                showAdmobInterstitial()
                loadAd()
            }
        }
    }
    
    @objc func showRewardedAd(){
        log("showAd...")
        perform(#selector(showRewardedAd), with: nil, afterDelay: AD_MIN_TIME)
        AdmobController.shared.showRewardedInterstitial(self)
    }
    
    @objc func loadAd(){
        perform(#selector(loadAd), with: nil, afterDelay: AD_MIN_TIME*0.7)
        AdmobController.shared.loadRewardedInterstitial(self)
    }
    
    @objc func showAdmobInterstitial(){
        log("showAdmobInterstitial...")
        perform(#selector(showAdmobInterstitial), with: nil, afterDelay: AD_MIN_TIME)
        AdmobController.shared.showAdmobInterstitial(self)
    }
    
    @objc func showFbMetaAd(){
       perform(#selector(showFbMetaAd), with: nil, afterDelay: AD_MIN_TIME)
       let adManager = AdManager()
       adManager.showFbMetaAdsOnParrent(self)
    }
    
    @objc func showAppodealRewardedAd(){
        AdManager.shared.showAppodealNonSkippableAdsOn(self)
    }
}

extension HomeViewController:AudioManagerDelegate {
    func recordDidFinish(){
        print("convert start.....")
        /*
        let actLanguages = activeLanguages.filter({$0.1}).map({$0.0})
        let countryCode1 = languageCodes[actLanguages.first ?? ""] ?? ""
        let countryCode2 = languageCodes[actLanguages.last ?? ""] ?? ""
        
        print("Code1::\(countryCode1)")
        print("Code2::\(countryCode2)")
        
        
        var codeBd = "bn"
        var codeEn = "en"
        
        if countryCode1 == "en"{
            codeEn = countryCode1
            codeBd = countryCode2
        }else{
            codeEn = countryCode2
            codeBd = countryCode1
        }
        
        
        let language = playButton.isSelected ? codeEn:codeBd //id,bn
        convertToText2(lang: language)
 */
        let index:Int   = getObject(SelectedLanguage) as? Int ?? 0
        let countryName = self.actLanguages[index]
        let countryCode:[String] = countryCodes.filter({$0.0 == countryName}).map({$0.1})
        let _countryCode:String = countryCode.first ?? ""
        convertToText2(lang: _countryCode)
    }
    
    func restartSpeech(sec:Double){
        self.perform(#selector(resetSpeech), with: nil, afterDelay: sec)
    }
    
    @objc func resetSpeech(){
        //recordTapped() //enable this line for aumatic recording when app launch
        //restartSpeech(sec:5)
    }
}


extension String {
    func getRect(withConstrainedWidth width: CGFloat, font: UIFont) -> CGRect {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox
    }
}

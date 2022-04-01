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

class HomeViewController: UIViewController,UNUserNotificationCenterDelegate {

    //access token
    //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
    
    @IBOutlet weak var textView: UITextView!
    var recordButton : UIButton!
    var languageButton : UIButton!
    let audioManager = AudioManager()
    //app setting:: 4
    //let actLanguages =  [English,Bangla,Gujarati,Hindi,Kannada,Malayalam,Marathi,Oriya,Punjabi,Tamil,Telugu] //activeLanguages.filter({$0.1}).map({$0.0})
    
    //let actLanguages = [English,Russian]
    let actLanguages = activeLanguages.filter({$0.1}).map({$0.0})//MARK: - make it ordered array
    
    let dropDown = DropDown()
    var IS_LAUNCHING_AD = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IS_LAUNCHING_AD = true
        
        //app setting:: 5
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
        addLanguageButtonUI()
        addSpeakButtonUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func showLoading(view:UIView){
        textView.text = "mas h this is hoss ajsmil jam ja ahs ajk ahsja   hsajkhs akjh sajk hasjkhs jakhsk hajks haksj test"
        
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
}

extension HomeViewController:UITextViewDelegate {
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool{
        if #available(iOS 15.0, *) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                    if (self.IS_LAUNCHING_AD){
                        self.perform(#selector(self.showAd), with: nil, afterDelay: 10)
                        self.IS_LAUNCHING_AD = false
                    }
                })
            }
        }else{
            if (self.IS_LAUNCHING_AD){
                self.perform(#selector(self.showAd), with: nil, afterDelay: 10)
                self.IS_LAUNCHING_AD = false
            }
        }
        
        return true
    }
    
     @objc func showAd(){
        perform(#selector(showAd), with: nil, afterDelay: AD_MIN_TIME)
        let adManager = AdManager()
        adManager.showAdMobAdsOnParrent(self)
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

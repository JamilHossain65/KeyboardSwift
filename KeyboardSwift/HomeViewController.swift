//
//  HomeViewController.swift
//  KeyboardSwift
//
//  Created by Jamil on 22/2/21.
//

import UIKit

class HomeViewController: UIViewController {

    //access token
    //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
    
    @IBOutlet weak var textView: UITextView!
    var recordButton : UIButton!
    var playButton : UIButton!
    let audioManager = AudioManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        textView.layer.borderWidth  = 1.0
        textView.layer.cornerRadius = 8.0
        textView.layer.borderColor  = UIColor.lightGray.cgColor
        textView.becomeFirstResponder()
        //textView.text = "saya bisa menulis bahasa indonesia dengan berbicara"
        //showLoading(view: textView)
        
        //record audio
        audioManager.initAudio()
        audioManager.delegate = self
        loadRecordingUI()
        playSoundUI()
        
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
    
    func loadRecordingUI(){
        recordButton = UIButton(frame: CGRect(x: textView.frame.size.width - 75, y: textView.frame.size.height - 44, width: 70, height: 40))
        recordButton.setTitle("Speak", for: .normal)
        recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
        recordButton.backgroundColor = .gray
        recordButton.layer.cornerRadius = 7
        restartSpeech(sec:5)
        textView.addSubview(recordButton)
    }
    
    func playSoundUI(){
        
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
        
        playButton = UIButton(frame: CGRect(x: textView.frame.size.width - 122, y: textView.frame.size.height - 44, width: 40, height: 40))
        
        playButton.layer.borderWidth  = 1.0
        playButton.layer.cornerRadius = 20.0
        playButton.layer.borderColor  = UIColor.lightGray.cgColor
        
        playButton.titleLabel?.font   = UIFont(name: "Arial", size: 25)
        
        playButton.setTitle("\(codeBd)", for: .normal)
        playButton.setTitle("\(codeEn)", for: .selected)
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        textView.addSubview(playButton)
        playButton.backgroundColor = .clear
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
    
    @objc func playButtonTapped(){
        playButton.isSelected = !playButton.isSelected
        //testSimpleAPI()
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
                print("error::\(_errors.message)")
                showAlertOkay(message: "Error found!", completion: { _ in})
            } else {
                self.textView.text += " \(speechModel.convertedText)"
                print("text::\(speechModel.convertedText)")
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
                        print(name)
                    }
                }
                
            } else {
                print("error:\(errors?.message)")
            }
        })
    }
}

extension HomeViewController:AudioManagerDelegate {
    func recordDidFinish(){
        print("convert start.....")
        
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

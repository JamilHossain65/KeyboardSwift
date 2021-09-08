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
        
        textView.text =
            "𝕥𝕙𝕖𝕣𝕖 𝕒𝕣𝕖 𝕞𝕒𝕟𝕪 𝕗𝕠𝕟𝕥𝕤 𝕚 𝕔𝕒𝕟 𝕦𝕤𝕖\n\n" +
            //"ᴛʜᴇʀᴇ ᴀʀᴇ ᴍᴀɴʏ ғᴏɴᴛs ɪ ᴄᴀɴ ᴜsᴇ\n" +
            "tᕼᗴᖇᗴ ᗩᖇᗴ ᗰᗩᑎy ᖴoᑎyᔕ i ᑕᗩᑎ ᑌᔕᗴ\n\n" +
            "ⓣⓗⓔⓡⓔ ⓐⓡⓔ ⓜ︎ⓐⓝⓨ ⓕⓞⓝⓣⓢ ⓘ ⓒⓐⓝ ⓤⓢⓔ\n"  +
            //"t̆̈h̆̈ĕ̈r̆̈ĕ̈ ă̈r̆̈ĕ̈ m̆̈ă̈n̆̈y̆̈ f̆̈ŏ̈n̆̈t̆̈s̆̈ ĭ̈ c̆̈ă̈n̆̈ ŭ̈s̆̈ĕ̈\n" +
            "t̾h̾e̾r̾e̾ a̾r̾e̾ m̾a̾n̾y̾ f̾o̾n̾t̾s̾ i̾ c̾a̾n̾ u̾s̾e̾\n" +
            "t̥ͦh̥ͦe̥ͦr̥ͦe̥ͦ ḁͦr̥ͦe̥ͦ m̥ͦḁͦn̥ͦy̥ͦ f̥ͦo̥ͦn̥ͦt̥ͦs̥ͦ i̥ͦ c̥ͦḁͦn̥ͦ u̥ͦs̥ͦe̥ͦ\n\n" +
            //"t͟h͟e͟r͟e͟ a͟r͟e͟  m͟a͟n͟y f͟o͟n͟t͟s͟ i͟ c͟a͟n͟ u͟s͟e͟\n" +
            "t҉h҉e҉r҉e҉ a҉r҉e҉ m҉a҉n҉y҉ f҉o҉n҉t҉s҉ i҉ c҉a҉n҉ u҉s҉e҉\n"  +
            "t̸h̸e̸r̸e̸ a̸r̸e̸ m̸a̸n̸y̸ f̸o̸n̸t̸s̸ i̸ c̸n̸ u̸s̸e̸\n"
        
        textView.text = ""
        
        textView.layer.borderWidth  = 1.0
        textView.layer.cornerRadius = 8.0
        textView.layer.borderColor  = UIColor.lightGray.cgColor
        
        textView.becomeFirstResponder()
        
        //record audio
        audioManager.initAudio()
        audioManager.delegate = self
        loadRecordingUI()
        playSoundUI()
    }
    
    func loadRecordingUI(){
        recordButton = UIButton(frame: CGRect(x: 25, y: 220, width: 120, height: 40))
        recordButton.setTitle("Start Record", for: .normal)
        recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
        recordButton.backgroundColor = .gray
        restartSpeech(sec:5)
        view.addSubview(recordButton)
    }
    
    func playSoundUI(){
        playButton = UIButton(frame: CGRect(x: 170, y: 220, width: 120, height: 40))
        playButton.setTitle("Play", for: .normal)
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        view.addSubview(playButton)
        playButton.backgroundColor = .gray
    }
    
    @objc func recordTapped(){
        stopRecord()
        
        audioManager.recordTapped()
        recordButton.isSelected = !recordButton.isSelected
        recordButton.setTitle("Start Record", for: .normal)
        recordButton.setTitle("Stop Record", for: .selected)
        recordButton.backgroundColor = recordButton.isSelected ? .red: .gray
    }
    
    func stopRecord(){
        if audioManager.audioRecorder != nil {
            audioManager.audioRecorder.stop()
        }
    }
    
    @objc func playButtonTapped(){
        //        audioManager.playSound()
        //        playButton.setTitle("Stop", for: .normal)
        
        convertToText2()
        
        //testSimpleAPI()
        
    }
    
    func convertToText2(){
        let audioManager = AudioManager()
        audioManager.delegate = self
        let speechModel  = SpeechModel()
        speechModel.fileUrl = audioManager.getDocumentsDirectory().appendingPathComponent("recording.flac")
        
        //view.showProgressHUD()
//        speechModel.doTranslateRequest2(completion: {(success,errorModel) in
//            //self.view.hideProgressHUD()
//            self.textView.text += " \(speechModel.convertedText)"
//            print("text::\(speechModel.convertedText)")
//        })
        
        speechModel.doTranslate2({errors in
            if let _errors = errors {
                print("error::\(_errors.message)")
            } else {
                self.textView.text += " \(speechModel.convertedText)"
                print("text::\(speechModel.convertedText)")
            }
        })
    }
    
    func convertToText(){
        let audioManager = AudioManager()
        audioManager.delegate = self
        let speechModel  = SpeechModel()
        speechModel.fileUrl = audioManager.getDocumentsDirectory().appendingPathComponent("recording.flac")
        
        //view.showProgressHUD()
        speechModel.doTranslateRequest(completion: {(success,errorModel) in
            //self.view.hideProgressHUD()
            self.textView.text += " \(speechModel.convertedText)"
            print("text::\(speechModel.convertedText)")
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
        convertToText2()
    }
    
    func restartSpeech(sec:Double){
        self.perform(#selector(resetSpeech), with: nil, afterDelay: sec)
    }
    
    @objc func resetSpeech(){
        //recordTapped() //enable this line for aumatic recording when app launch
        //restartSpeech(sec:5)
    }
}

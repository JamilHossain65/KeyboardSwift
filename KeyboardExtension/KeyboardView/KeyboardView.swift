//
//  KeyboardView.swift
//  KeyboardSwift
//
//  Created by Jamil on 22/2/21.
//

import UIKit
import AudioToolbox

protocol KeyboardViewDelegate: class {
    func insertCharacter   (_ newCharacter: String)
    func deleteCharacter   (_ newCharacter: String)
    func gotoNextKeyboard  (_ nextButton  : UIButton)
    func voiceButtonTapped (_ voiceButton : UIButton)
    func shiftButtonPressed(_ shiftButton : UIButton)
    func shiftButtonDoubleTap(_ shiftButton : UIButton)
    func spaceButtonDoubleTap(_ spaceButton : UIButton)
    func altButtonPressed  (_ altButton   : UIButton)
    func didReleaseLong    (_ button      : UIButton)
    func didTapLongPressed()
}

class KeyboardView: UIView,UIInputViewAudioFeedback,UIGestureRecognizerDelegate { //[[UIDevice currentDevice] playInputClick];
    // constants
    var paddingX:Double = 3 //left and right padding
    var paddingY:Double = 3 //top and bottom padding
    
    var gapX:Double = 3 //gap between button in a row
    var gapY:Double = 4 //gap between button in a col
    
    var totalRow:Double = 5 //todo
    
    
    //var textView:UITextDocumentProxy?
    var nextButton   = KeyboardButton()
    var altButton    = KeyboardButton()
    var returnButton = KeyboardButton()
    var shiftButton  = KeyboardButton()
    var deleteButton = KeyboardButton()
    var voiceButton  = KeyboardButton()
    var spaceButton  = KeyboardButton()
    
    var shiftButtonIndex  = -1
    var deleteButtonIndex = -1
    var altButtonIndex    = -1
    var nextButtonIndex   = -1
    var spaceButtonIndex  = -1
    var returnButtonIndex = -1
    var voiceButtonIndex  = -1

    //set index for each button
    var currentButtonIndex = 0
    //var currentFontLetters:[String] =  []
    
    //long pressed delete
    var currentDeleteCount = 0
    var isDeleteEnd = false
    
    //delete
    weak var delegate: KeyboardViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //log("frame::\(frame)")
        
        //clear old view
        for view in subviews{
            view.removeFromSuperview()
        }
        
        //draw
        //self.configure5Line()
        currentFontLetters = dataSource  //kUnicodeFontArray[0]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSpecialButtonColor(){
        //set color
        backgroundColor = .clear //kKeyboardBGColor //#d1d4db, rgb(209,212,219)
        nextButton.defaultBackgroundColor   = kAltButtonColor //rgb(172, 176, 188) //#acb0bc
        altButton.defaultBackgroundColor    = kAltButtonColor
        altButton.highlightBackgroundColor  = kAltButtonColor
        
        returnButton.defaultBackgroundColor  = kAltButtonColor
        deleteButton.defaultBackgroundColor  = kAltButtonColor
        
        if altButton.isSelected{
            shiftButton.highlightBackgroundColor = kAltButtonColor
            shiftButton.defaultBackgroundColor   = kAltButtonColor
        }else{
            if shiftButton.isSelected {
                shiftButton.highlightBackgroundColor = .white
                shiftButton.defaultBackgroundColor   = .white
            } else {
                shiftButton.highlightBackgroundColor = kAltButtonColor
                shiftButton.defaultBackgroundColor   = kAltButtonColor
            }
            
        }
        
        //
        //spaceButton.defaultBackgroundColor = .white
        //voiceButton.defaultBackgroundColor = .white
    }
    
    func refreshKeyboard(){
        //clear old view
        for view in subviews {
            view.removeFromSuperview()
        }
        
        configure4Line()
        setSpecialButtonColor()
    }
}

//MARK:- configure keyboard button
extension KeyboardView{
    func configure4Line() {
        
        //set total rows in keyboard
        paddingX = 3 //left and right padding
        paddingY = 3 //top and bottom padding
        
        gapX = 5.5  //gap between button in a row
        gapY = 18 //gap between button in a col
        
        totalRow = 4
        
        //set spetial button index
        let _currentLetters = currentFontLetters.filter({$0 != kNL})
        shiftButtonIndex  = getIndex(kSHIFT, _currentLetters)
        deleteButtonIndex = getIndex(kDELETE,_currentLetters)
        altButtonIndex    = getIndex(kALTER, _currentLetters)
        nextButtonIndex   = getIndex(kGLOBE, _currentLetters)
        voiceButtonIndex  = getIndex(kVOICE, _currentLetters)
        spaceButtonIndex  = getIndex(kSPACE, _currentLetters)
        returnButtonIndex = getIndex(kRETURN,_currentLetters)
        currentButtonIndex = 0
        
        for view in subviews {
            //log("view tag::\(view.tag)")
            if !self.isSpecialButton(view) {
                view.removeFromSuperview()
            }
        }
        
        let keyArray = currentFontLetters.split(whereSeparator: {$0.contains(kNL)})
        
        //draw Keyboard
        for (index,letters) in keyArray.enumerated(){
            drawLineFor(row:index,totalCol:letters.count, info:getInfo(index),const:getConst(index))
        }
        
        //draw button in a row
//        drawLineFor(row:0,totalCol:getKeys(0,fontLetters), info:getInfo(0),const:getConst(0))
//        drawLineFor(row:1,totalCol:getKeys(1,fontLetters), info:getInfo(1),const:getConst(1))
//        drawLineFor(row:2,totalCol:getKeys(2,fontLetters), info:getInfo(2),const:getConst(2))
//        drawLineFor(row:3,totalCol:getKeys(3,fontLetters), info:getInfo(3),const:getConst(3))
    }
    
    func configure5Line(){
        //set spetial button index
        shiftButtonIndex  = 31
        deleteButtonIndex = 40
        altButtonIndex    = 41
        nextButtonIndex   = 42
        spaceButtonIndex  = 43
        returnButtonIndex = 44
        voiceButtonIndex  = -1
        
        //draw button in a row
        drawLineFor(row: 0, totalCol: 11)
        drawLineFor(row: 1, totalCol: 11)
        drawLineFor(row: 2, totalCol:  9)
        drawLineFor(row: 3, totalCol: 10, info: [0:40,9:40])
        drawLineFor(row: 4, totalCol:  4, info: [0:40,1:30,3:80])
    }
    
    func drawLineFor(row:Int, totalCol:Int, info:[Int:Int]? = [:], const:[Int:Int]? = [:]){
        
        var preX = paddingX
        var preWidth:Double = 0
        
        for i in 0...totalCol-1 {
        
            //calculate width
            let btnWidth = self.getButtonWidth(totalCol,colIndex:i,info: info,const: const)
            //calculate height
            let btnHeight = self.getButtonHeight()
            let colY:Double = paddingY + Double(row)*(gapY + btnHeight)
            
            preX += self.getExtraSpace(colIndex: i, const: const)
            
            let colX:Double = self.getColX(index:i, btnWidth:preWidth, preX:preX)
            
            preX = colX
            preWidth = btnWidth
            
            let bFrame = CGRect(x: colX, y: colY, width: btnWidth, height: btnHeight)
            var title = ""
            
//            if currentFontLetters.count > 0 {
//                title = currentFontLetters[currentButtonIndex % currentFontLetters.count]
//                title = title.trimmingCharacters(in: .whitespaces)
//            }
            
            
            let keyArray = currentFontLetters.split(whereSeparator: {$0.contains(kNL)})
            let rowLetters = Array(keyArray[row])
            title = rowLetters[i]
            //title = title.trimmingCharacters(in: .whitespaces)
            
            let keyboardButton = KeyboardButton(frame: bFrame)
            
            //recognize button pressed
            keyboardButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
            
            //recognize long pressed on button
            if currentButtonIndex == deleteButtonIndex {
                let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressDelete(_:)))
                keyboardButton.addGestureRecognizer(longGesture)
            }
            
            //recognize Double Tap on button
            if currentButtonIndex == shiftButtonIndex ||
                currentButtonIndex == spaceButtonIndex {
                let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTappedOn(_:)))
                    tap.numberOfTapsRequired = 2
                keyboardButton.addGestureRecognizer(tap)
            }
            
            keyboardButton.setTitle(title.trimmingCharacters(in: .whitespaces), for: .normal)
            keyboardButton.setTitleColor(kKeyboardTextColor, for: .normal)
            //keyboardButton.setTitleShadowColor(kTextShadowColor, for: .normal)

            keyboardButton.tag = currentButtonIndex
            
            if isSpecialButton(keyboardButton) {
                addSubview(keyboardButton)
            }
            
            //set keyboard special button index
            self.setButtonIndex(keyboardButton)
            
            currentButtonIndex += 1
        }
    }
    
    //calculate button width in a row
    func getButtonWidth(_ totalCol:Int,colIndex:Int,info:[Int:Int]? = [:],const:[Int:Int]? = [:]) -> Double{
        
        let paddingLR:Double = 2 * paddingX //padding left and right
        let totalGapX:Double = gapX * Double(totalCol-1)
        
        var btnWidth:Double  = (Double(frame.size.width) - paddingLR - totalGapX) / Double(totalCol)
        //log("btnWidth::\(btnWidth)")
        
        //override width
        if let _info = info, _info.keys.count > 0 {
            
            var sum :Double = 0  //sum of override button width
            var avg :Double = 0  //avg of override button width
            var diff:Double = 0 //total difference of all override button width
            
            for index in _info.keys{
                //log("info[\(index)] ::\(String(describing: _info[index]))")
                sum += Double(_info[index] ?? 0)
            }
            
            avg = sum / Double(_info.keys.count)
            diff = btnWidth - avg
            
            if _info.keys.contains(colIndex){
                btnWidth = Double(_info[colIndex] ?? 0) //replace override width
                
            } else{
                let diffWidth:Double = diff * Double(_info.keys.count) / Double(totalCol - _info.keys.count)
                btnWidth += diffWidth
            }
            
//            log("\navg::\(avg)")
//            log("sum  ::\(sum)")
//            log("diff ::\(diff)")
//            log("new btnWidth::\(btnWidth)")
        }
        
        //override constant value
        if let _const = const, _const.keys.count > 0 {
            
            var sum :Double = 0 //sum of override button width
            var avg :Double = 0 //avg of override button width
            
            for index in _const.keys{
                sum += Double(_const[index] ?? 0)
            }
            avg  = sum / Double(_const.keys.count)
             
            let diffWidth:Double = avg * Double(_const.keys.count) / Double(totalCol)
            btnWidth -= diffWidth
        }
        
        return btnWidth
    }
    
    //calculate button height in a col
    func getColX(index:Int,btnWidth:Double,preX:Double) -> Double{
        
        var originColX:Double = preX
        if index > 0 {
            originColX = originColX + gapX + btnWidth
        }
        
        return originColX
    }
    
    func getConst(_ row:Int) -> [Int:Int]{
        
        switch row {
        case 0:
            switch langName {
            case Russian:
                break
            default:
                break
            }
            
            break
        case 1:
            switch langName {
            case Russian,Bangla:
                break
            default:
                return [0:15, 9:15]
            }
            break
        case 2:
            switch langName {
            case Russian:
                break
            default:
                return [1:7, 8:7]
            }
            break
        case 3:
            switch langName {
            case Russian:
                break
            default:
                break
            }
            break
        default:
            switch langName {
            case Russian:
                break
            default:
                break
            }
            break
        }
        
        
        return [:]
    }
    
    func getInfo(_ row:Int)-> [Int:Int]{
        
        switch row {
        case 0:
            switch langName {
            case Russian:
                break
            default:
                break
            }
            
            break
        case 1:
            switch langName {
            case Russian:
                break
            default:
                break
            }
            break
        case 2:
            switch langName {
            case Russian:
                return [0:30, 10:30]
            default:
                return [0:40, 8:40]
            }
            //break
        case 3:
            switch langName {
            
            default:
                return [0:40, 1:30,2:30,4:80]
            }
            //break
        default:
            switch langName {
            case Russian:
                break
            default:
                break
            }
            break
        }
        
        return [:]
    }
    
    func getExtraSpace(colIndex:Int,const:[Int:Int]? = [:]) -> Double{
        if let _const = const, _const.keys.count > 0 {
            if _const.keys.contains(colIndex){
                return Double(_const[colIndex] ?? 0)
                
            }/*else if _const.keys.contains(kPADDING_RIGHT){
                if colIndex == 8{//todo, do it dynamic
                    return Double(_const[kPADDING_RIGHT] ?? 0)
                }
            }*/
        }
        return 0.0
    }
    
    //calculate button height in a col
    func getButtonHeight() -> Double {
        //calculate height
        let totalPaddingY:Double = 2 * paddingY
        let totalGapY:Double     = gapY * (totalRow-1)
        let btnHeight:Double = (216 - totalPaddingY - totalGapY) / (totalRow) //todo, 216 = keyboard height
        return btnHeight
    }
    
    func isSpecialButton(_ view:UIView) -> Bool{
        if(view.tag == shiftButtonIndex   ||
            view.tag == deleteButtonIndex ||
            view.tag == altButtonIndex    ||
            view.tag == nextButtonIndex   ||
            view.tag == spaceButtonIndex  ||
            view.tag == returnButtonIndex ||
            view.tag == voiceButtonIndex) {
            return true
        }
        return false
    }
    
    func setButtonIndex(_ keyboardButton:KeyboardButton){
        //log("button tag::\(keyboardButton.tag)")
        //set keyboard button
        switch currentButtonIndex {
        case nextButtonIndex:
            self.nextButton = keyboardButton
            keyboardButton.setTitle("", for: .normal)
            keyboardButton.setImage(UIImage(named: "globe.png"), for: .normal)
            break
        case altButtonIndex:
            keyboardButton.setTitle(k123String, for: .normal)
            keyboardButton.setTitle(kAbcString, for: .selected)
            keyboardButton.isSelected = altButton.isSelected
            altButton = keyboardButton
            break
        case returnButtonIndex:
            self.returnButton = keyboardButton
            keyboardButton.setTitle(kReturnString, for: .normal)
            break
        case shiftButtonIndex:
            if altButton.isSelected{
                keyboardButton.setTitle(kSymbolString, for: .normal)
                keyboardButton.setTitle(k123String, for: .selected)
            }else{
                var imName = ""
                switch keyMode {
                case DOUBLE_TAP:
                    imName = "shift_double.png"
                case SHIFT:
                    imName = "shift.png"
                default:
                    imName = "unshift.png"
                }
                
                keyboardButton.setImage(UIImage(named: imName), for: .normal)
                keyboardButton.setImage(UIImage(named: imName), for: .selected)
                keyboardButton.setImage(UIImage(named: imName), for: .highlighted)
                
                keyboardButton.setTitle("", for: .normal)
                keyboardButton.setTitle("", for: .selected)
            }
            
            keyboardButton.isSelected = shiftButton.isSelected
            shiftButton = keyboardButton
            break
        case deleteButtonIndex:
            self.deleteButton = keyboardButton
            keyboardButton.setTitle("", for: .normal)
            keyboardButton.setImage(UIImage(named: "delete.png"), for: .normal)
            break
        case spaceButtonIndex:
            self.spaceButton = keyboardButton
            keyboardButton.setTitle(kSpaceString, for: .normal)
            keyboardButton.highlightBackgroundColor = kAltButtonColor
            break
        case voiceButtonIndex:
            self.voiceButton = keyboardButton
            keyboardButton.setTitle("", for: .normal)
            keyboardButton.setImage(UIImage(named: "record_on.png"), for: .normal)
            keyboardButton.setImage(UIImage(named: "record_off.png"), for: .selected)
            keyboardButton.highlightBackgroundColor = kHighlightColor
            break
            
        default:
            keyPopupOn(keyboardButton)
            break
        }
    }
    
    func reloadFont(_ dataSource:[String]?) {
        //currentFontLetters = getLetters(keyLetterMode)
        if let _dataSource = dataSource{
            currentFontLetters = _dataSource
        }
        log("refresh font:\(currentFontLetters)")
        refreshKeyboard()
    }
    
    func reloadTextColor(_ fontIndex:Int) {
        log("reload:\(fontIndex)")
        refreshKeyboard()
    }
}

//MARK:- keycap view show
extension KeyboardView {
    func keyPopupOn(_ keyButton:UIButton) {
        //if currentFontLetters.count <= 0 { return }
        
        //var title = currentFontLetters[currentButtonIndex % currentFontLetters.count]
        var title = keyButton.titleLabel?.text
        title = title?.trimmingCharacters(in: .whitespacesAndNewlines)
        if langName == Bangla {
            let jhKey   = JHKeyPopup(frame: keyButton.frame)
            //jhKey.frame = keyButton.frame
            jhKey.tag   = keyButton.tag
            jhKey.delegate2 = self
            jhKey.backgroundColor = .white
            jhKey.setTitle(title, for: .normal)
            jhKey.setTitleColor(kKeyboardTextColor, for: .normal)
            jhKey.setTitleShadowColor(kTextShadowColor, for: .normal)
            jhKey.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
            addSubview(jhKey)
            jhKey.clipsToBounds = true
            jhKey.layer.cornerRadius = 5.0
            
        }else{
            let jhKey   = JHkey(type: .custom)
            jhKey.frame = keyButton.frame
            jhKey.tag   = keyButton.tag
            jhKey.delegate = self
            jhKey.backgroundColor = .white
            jhKey.setTitle(title, for: .normal)
            jhKey.setTitleColor(kKeyboardTextColor, for: .normal)
            jhKey.setTitleShadowColor(kTextShadowColor, for: .normal)
            jhKey.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
            addSubview(jhKey)
            jhKey.clipsToBounds = true
            jhKey.layer.cornerRadius = 5.0
        }
        

    }
}

//MARK:- keyboard button presed
extension KeyboardView:JHkeyDelegate {
    func didSelectHintButton(_ sender: UIButton!) {
        if let _title = sender.titleLabel?.text {
            UIDevice.current.playInputClick()
            AudioServicesPlaySystemSound(1104);
            delegate?.insertCharacter(_title)
        }
    }
    
    func didReleaseLong(on sender: UIButton!) {
        delegate?.didReleaseLong(sender)
    }
    
    func didTapLong(on sender: UIButton!){
        delegate?.didTapLongPressed()
        
        if let _title = sender.titleLabel?.text {
            log("_title ::: \(_title)")
            delegate?.insertCharacter(_title)
        }else{
            if(sender.tag == shiftButtonIndex) {
                
            }
            log("tag ::: \(sender.tag)")
        }
    }
}

extension KeyboardView:JHKeyPopupDelegate{
    func didSelectHintButtonSwift(_ sender: UIButton) {
        if let _title = sender.titleLabel?.text {
            UIDevice.current.playInputClick()
            AudioServicesPlaySystemSound(1104);
            delegate?.insertCharacter(_title)
        }
    }

    func didTapLongOnButtonSwift(_ sender: UIButton) {
        delegate?.didTapLongPressed()
        
        if let _title = sender.titleLabel?.text {
            print("_title ::: \(_title)")
            delegate?.insertCharacter(_title)
        }else{
            if(sender.tag == shiftButtonIndex) {
                
            }
            print("tag ::: \(sender.tag)")
        }
    }

    func didReleaseLongOnSwift(_ sender: UIButton) {
        delegate?.didReleaseLong(sender)
    }
}

extension KeyboardView {
    @objc func buttonPressed(sender:KeyboardButton){
        
        if(sender.tag == shiftButtonIndex) {

            sender.isSelected = !sender.isSelected
            shiftButton = sender
            delegate?.shiftButtonPressed(sender)
            
        }else if(sender.tag == voiceButtonIndex) {
            sender.setImage(UIImage(named: "record_off.png"), for: .normal)
            sender.setImage(UIImage(named: "record_on.png"),  for: .selected)
            
            sender.isSelected = !sender.isSelected
            voiceButton = sender
            
            if voiceButton.isSelected {
                sender.defaultBackgroundColor = kAltButtonColor
            } else {
                sender.defaultBackgroundColor = .white
            }
            
            delegate?.voiceButtonTapped(sender)
        }else if(sender.tag == deleteButtonIndex) {
            delegate?.deleteCharacter("")
        } else if(sender.tag == nextButtonIndex) {
            delegate?.gotoNextKeyboard(sender)
        } else if(sender.tag == altButtonIndex) {
            sender.isSelected = !sender.isSelected
            altButton = sender
            delegate?.altButtonPressed(altButton)
            
            refreshKeyboard()
            
        } else {
            if let _title = sender.titleLabel?.text{
                
                switch _title {
                case kSpaceString:
                    delegate?.insertCharacter(" ")
                case kReturnString:
                    delegate?.insertCharacter("\n")
                
                default:
                    delegate?.insertCharacter(_title)
                }
            }
        }
    }

    
    @objc func doubleTappedOn(_ sender:UITapGestureRecognizer) {
        // do something here
        let button = sender.view as! UIButton
        log("multipleTap:\(button.titleLabel?.text)")
        
        if button.titleLabel?.text == kSpaceString{
            delegate?.spaceButtonDoubleTap(spaceButton)
        }else{
            shiftButton.setImage(UIImage(named: "unshift.png"), for: .normal)
            shiftButton.setImage(UIImage(named: "shift_double.png"), for: .selected)
            
            delegate?.shiftButtonDoubleTap(shiftButton)
        }
    }
    
    @objc func handleLongPressDelete(_ gestureRecognizer: UILongPressGestureRecognizer) {
        
        if gestureRecognizer.state == UIGestureRecognizer.State.ended {
            log("end")
            isDeleteEnd = true
          return
        }
        log("long press")
        isDeleteEnd = false
        
        perform(#selector(deleteLetter), with: false, afterDelay: 0.1)
    }
    
    @objc func deleteLetter(){
        log("delete letter")
        
        if !isDeleteEnd {
            perform(#selector(deleteLetter), with: nil, afterDelay: 0.1)
        }
        self.delegate?.deleteCharacter("")
    }
    
}

extension UIInputView : UIInputViewAudioFeedback {

    public var enableInputClicksWhenVisible: Bool {
        return true
    }
}

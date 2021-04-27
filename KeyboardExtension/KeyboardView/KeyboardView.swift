//
//  KeyboardView.swift
//  KeyboardSwift
//
//  Created by Jamil on 22/2/21.
//

import UIKit

class KeyboardView: UIView,UIInputViewAudioFeedback { //[[UIDevice currentDevice] playInputClick];
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
    
    var shiftButtonIndex  = 0
    var deleteButtonIndex = 0
    var altButtonIndex    = 0
    var nextButtonIndex   = 0
    var spaceButtonIndex  = 0
    var returnButtonIndex = 0
    var voiceButtonIndex  = 0

    //set index for each button
    var currentButtonIndex = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //print("frame::\(frame)")
        
        //clear old view
        for view in subviews{
            view.removeFromSuperview()
        }
        
        //draw
        //self.configure5Line()
        self.configure4Line()
        
        //set color
        backgroundColor = kKeyboardBGColor //#d1d4db, rgb(209,212,219)
        nextButton.defaultBackgroundColor   = kAltButtonColor //rgb(172, 176, 188) //#acb0bc
        altButton.defaultBackgroundColor    = kAltButtonColor
        returnButton.defaultBackgroundColor = kAltButtonColor
        shiftButton.defaultBackgroundColor  = kAltButtonColor
        deleteButton.defaultBackgroundColor = kAltButtonColor
        //
        //spaceButton.defaultBackgroundColor = .white
        //voiceButton.defaultBackgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        shiftButtonIndex  = 19
        deleteButtonIndex = 27
        altButtonIndex    = 28
        nextButtonIndex   = 29
        spaceButtonIndex  = 30
        returnButtonIndex = 31
        voiceButtonIndex  = -1
        currentButtonIndex = 0
        
        for view in subviews {
            print("view tag::\(view.tag)")
            if !self.isSpecialButton(view) {
                view.removeFromSuperview()
            }
        }
        
        //draw button in a row
        drawLineFor(row: 0, totalCol: kRowKeys[0]/*10*/)
        drawLineFor(row: 1, totalCol: kRowKeys[1]/*9*/, const: [0:15, 9:15])
        drawLineFor(row: 2, totalCol: kRowKeys[2]/*9*/,  info: [0:40, 8:40], const: [1:7, 8:7])
        drawLineFor(row: 3, totalCol: kRowKeys[3]/*4*/,  info: [0:40, 1:30, 3:80])
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
        //print("frame::\(frame)")
        
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
            let tempLetter = kLetters[currentButtonIndex % kLetters.count]
            let letter = shiftButton.isSelected ? tempLetter : tempLetter.lowercased()
            
            let keyboardButton = KeyboardButton(frame: bFrame)
            keyboardButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
            
            //keyboardButton.addTarget(self, action: #selector(multipleTap(_:event:)), for: .touchDownRepeat)
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
                tap.numberOfTapsRequired = 2
            keyboardButton.addGestureRecognizer(tap)
            
            keyboardButton.setTitle(letter, for: .normal); //"\(Int(btnWidth))
            keyboardButton.tag = currentButtonIndex
            addSubview(keyboardButton)
            
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
        //print("btnWidth::\(btnWidth)")
        
        //override width
        if let _info = info, _info.keys.count > 0 {
            
            var sum :Double = 0  //sum of override button width
            var avg :Double = 0  //avg of override button width
            var diff:Double = 0 //total difference of all override button width
            
            for index in _info.keys{
                //print("info[\(index)] ::\(String(describing: _info[index]))")
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
            
//            print("\navg::\(avg)")
//            print("sum  ::\(sum)")
//            print("diff ::\(diff)")
//            print("new btnWidth::\(btnWidth)")
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
        //print("button tag::\(keyboardButton.tag)")
        //set keyboard button
        switch currentButtonIndex {
        case nextButtonIndex:
            self.nextButton = keyboardButton
            keyboardButton.setTitle("", for: .normal)
            keyboardButton.setImage(UIImage(named: "globe.png"), for: .normal)
            break
        case altButtonIndex:
            self.altButton = keyboardButton
            keyboardButton.setTitle(kAltString, for: .normal)
            break
        case returnButtonIndex:
            self.returnButton = keyboardButton
            keyboardButton.setTitle(kReturnString, for: .normal)
            break
        case shiftButtonIndex:
            self.shiftButton = keyboardButton
            keyboardButton.setImage(UIImage(named: "unshift.png"), for: .normal)
            keyboardButton.setImage(UIImage(named: "shift.png"), for: .selected)
            keyboardButton.setTitle("", for: .normal)
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
            break
            
        default:
            keyPopupOn(keyboardButton)
            break
        }
    }
}

//MARK:- keycap view show
extension KeyboardView {
    func keyPopupOn(_ keyButton:UIButton){
        let title   = kLetters[keyButton.tag].lowercased()
        let jhKey   = JHkey(type: .custom)
        jhKey.frame = keyButton.frame
        jhKey.tag   = keyButton.tag
        jhKey.setTitle(title, for: .normal)
        jhKey.setTitleColor(UIColor.black, for: .normal)
        jhKey.backgroundColor = .clear
        addSubview(jhKey)
    }
}

//MARK:- keyboard button presed
extension KeyboardView {
    @objc func buttonPressed(sender:KeyboardButton){
        UIDevice.current.playInputClick()
        if(sender.tag == shiftButtonIndex) {
            print("sender.isSelected::\(sender.isSelected)")
            sender.isSelected = !sender.isSelected
            shiftButton = sender
            
            for view in subviews {
               let button = view as! UIButton
                if !self.isSpecialButton(view) {
                    let _newTitle = sender.isSelected ? button.titleLabel?.text?.capitalized : button.titleLabel?.text?.lowercased()
                    button.setTitle(_newTitle, for: .normal)
                }
            }
            
            sender.setImage(UIImage(named: "unshift.png"), for: .normal)
            sender.setImage(UIImage(named: "shift.png"), for: .selected)
            
            if sender.isSelected {
                sender.defaultBackgroundColor = .white
            }else{
                sender.defaultBackgroundColor = kAltButtonColor
            }
            
        } else {
            
        }
    }

    @objc func doubleTapped() {
        // do something here
        print("multipleTap")
        shiftButton.isSelected = !shiftButton.isSelected
        
        for view in subviews{
           let button = view as! UIButton
            if !self.isSpecialButton(view) {
                let _newTitle = shiftButton.isSelected ? button.titleLabel?.text?.capitalized : button.titleLabel?.text?.lowercased()
                button.setTitle(_newTitle, for: .normal)
            }
        }
        
        shiftButton.setImage(UIImage(named: "unshift.png"), for: .normal)
        shiftButton.setImage(UIImage(named: "shift_double.png"), for: .selected)
        
        if shiftButton.isSelected {
            shiftButton.defaultBackgroundColor = .white
        }else{
            shiftButton.defaultBackgroundColor = kAltButtonColor
        }
    }
}

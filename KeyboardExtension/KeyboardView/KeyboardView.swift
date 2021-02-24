//
//  KeyboardView.swift
//  KeyboardSwift
//
//  Created by Jamil on 22/2/21.
//

import UIKit

class KeyboardView: UIView,UIInputViewAudioFeedback { //[[UIDevice currentDevice] playInputClick];
    // constants
    let paddingX:Double = 3 //left and right padding
    let paddingY:Double = 3 //top and bottom padding
    
    let gapX:Double = 3 //gap between button in a row
    let gapY:Double = 4 //gap between button in a col
    
    let totalRow:Double = 5 //todo
    
    
    //var textView:UITextDocumentProxy?
//    #define kAltLabel @"১২৩"
//    #define kReturnLabel @"Return"
//    #define kSpaceLabel @"Space"
    var nextButton   = KeyboardButton()
    var altButton    = KeyboardButton()
    var returnButton = KeyboardButton()
    var shiftButton  = KeyboardButton()
    var deleteButton = KeyboardButton()
    var voiceButton  = KeyboardButton()
    var spaceButton  = KeyboardButton()
    
    var shiftButtonIndex  = 33
    var deleteButtonIndex = 40
    var altButtonIndex    = 41
    var nextButtonIndex   = 42
    var returnButtonIndex = 44
    
    var spaceButtonIndex  = 43
    var voiceButtonIndex  = 0
    
    var currentButtonIndex = 0;
    
    let altButtonColor  = UIColor.init(red: 172/255, green: 176/255, blue: 188/255, alpha: 1)
    let keyboardBGColor = UIColor.init(red: 209/255, green: 212/255, blue: 219/255, alpha: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //print("frame::\(frame)")
        
        //clear old view
        for view in subviews{
            view.removeFromSuperview()
        }
        
        //draw
        showLine()
        backgroundColor = keyboardBGColor //#d1d4db, rgb(209,212,219)
        nextButton.defaultBackgroundColor   = altButtonColor //rgb(172, 176, 188) //#acb0bc
        altButton.defaultBackgroundColor    = altButtonColor
        returnButton.defaultBackgroundColor = altButtonColor
        shiftButton.defaultBackgroundColor  = altButtonColor
        deleteButton.defaultBackgroundColor = altButtonColor
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
    func showLine(){
        showLine(row: 0, totalCol: 11)
        showLine(row: 1, totalCol: 11)
        showLine(row: 2, totalCol: 11)
        showLine(row: 3, totalCol: 8,info: [0:40,7:40])
        showLine(row: 4, totalCol: 4,info: [0:40,1:30,3:80])
    }
    
    func showLine(row:Int,totalCol:Int,info:[Int:Int]? = [:]){
        print("frame::\(frame)")
        
        var preX = paddingX
        var preWidth:Double = 0
        
        for i in 0...totalCol-1 {
        
            //calculate width
            let btnWidth = self.getButtonWidth(totalCol,colIndex:i,info: info)
            //calculate height
            let btnHeight = self.getButtonHeight()
            let colY:Double = paddingY + Double(row)*(gapY + btnHeight)
            let colX:Double = self.getColX(index:i, btnWidth:preWidth, preX:preX)
            
            preX = colX
            preWidth = btnWidth
            
            let bFrame = CGRect(x: colX, y: colY, width: btnWidth, height: btnHeight)
            let keyboardButton = KeyboardButton(frame: bFrame)
            keyboardButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .allTouchEvents)
            keyboardButton.setTitle("\(Int(btnWidth))", for: .normal);
            keyboardButton.tag = currentButtonIndex
            addSubview(keyboardButton)
            
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
                keyboardButton.setTitle("123", for: .normal)
                break
            case returnButtonIndex:
                self.returnButton = keyboardButton
                keyboardButton.setTitle("return", for: .normal)
                break
            case shiftButtonIndex:
                self.shiftButton = keyboardButton
                keyboardButton.setImage(UIImage(named: "unshift.png"), for: .normal)
                keyboardButton.setTitle("", for: .normal)
                break
            case deleteButtonIndex:
                self.deleteButton = keyboardButton
                keyboardButton.setTitle("", for: .normal)
                keyboardButton.setImage(UIImage(named: "delete.png"), for: .normal)
                break
            case spaceButtonIndex:
                self.spaceButton = keyboardButton
                keyboardButton.setTitle("space", for: .normal)
                break
            case voiceButtonIndex:
                self.voiceButton = keyboardButton
                break
                
            default:
                break
            }
            
            currentButtonIndex += 1
        }
    }
    
    //calculate button width in a row
    func getButtonWidth(_ totalCol:Int,colIndex:Int,info:[Int:Int]? = [:]) -> Double{
        
        let paddingLR:Double = 2 * paddingX //padding left and right
        let totalGapX:Double = gapX * Double(totalCol-1)
        
        var btnWidth:Double  = (Double(frame.size.width) - paddingLR - totalGapX) / Double(totalCol)
        //print("btnWidth::\(btnWidth)")
        
        //override width
        if let _info = info, _info.keys.count > 0 {
            
            //todo, check mismatch of floating point value
            var sum: Double = 0  //sum of override button width
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
                
            } else{//todo, need calculate
                let diffWidth:Double = diff * Double(_info.keys.count) / Double(totalCol - _info.keys.count)
                btnWidth += diffWidth
            }
            
//            print("\navg::\(avg)")
//            print("sum  ::\(sum)")
//            print("diff ::\(diff)")
//            print("new btnWidth::\(btnWidth)")
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
    
    //calculate button height in a col
    func getButtonHeight() -> Double{
        //calculate height
        let totalPaddingY:Double = 2 * paddingY
        let totalGapY:Double     = gapY * (totalRow-1)
        let btnHeight:Double = (216 - totalPaddingY - totalGapY) / (totalRow) //todo, 216 = keyboard height
        return btnHeight
    }
    
    @objc func buttonPressed(sender:UIButton){
        UIDevice.current.playInputClick()
    }
}

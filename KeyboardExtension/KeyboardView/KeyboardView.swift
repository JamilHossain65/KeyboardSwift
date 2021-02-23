//
//  KeyboardView.swift
//  KeyboardSwift
//
//  Created by Jamil on 22/2/21.
//

import UIKit

class KeyboardView: UIView,UIInputViewAudioFeedback { //[[UIDevice currentDevice] playInputClick];
    // constants
    let paddingX:Double = 2 //left and right padding
    let paddingY:Double = 3 //top and bottom padding
    
    let gapX:Double = 3 //gap between button in a row
    let gapY:Double = 4 //gap between button in a col
    
    let totalRow:Double = 5 //todo
    
    
    //var textView:UITextDocumentProxy?
    var nextKeyboardButton:KeyboardButton!
    
    var currentButtonIndex = 0;
    var nextKeyboardButtonIndex = 41;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //print("frame::\(frame)")
        
        //clear old view
        for view in subviews{
            view.removeFromSuperview()
        }
        
        //draw
        showLine()
        //backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK:- configure keyboard button
extension KeyboardView{
    func showLine(){
        showLine(row: 0, totalCol: 11,info: [0:20,10:20])
        showLine(row: 1, totalCol: 11)
        showLine(row: 2, totalCol: 11)
        showLine(row: 3, totalCol: 8)
        showLine(row: 4, totalCol: 3)
    }
    
    func showLine(row:Int,totalCol:Int,info:[Int:Int]? = [:]){
        print("frame::\(frame)")
        
        if let _info = info {
            print("test info::\(_info)")
        }
        
        
        //calculate width
        let btnWidth = self.getButtonWidth(totalCol: totalCol)
        
        //calculate height
        let btnHeight = self.getButtonHeight()
        
        let colY:Double = paddingY + Double(row)*(gapY + btnHeight)
        
        for i in 0...totalCol-1 {
            
            let bFrame = CGRect(x: paddingX + Double(i)*(gapX + btnWidth), y: colY, width: btnWidth, height: btnHeight)
            let keyboardButton = KeyboardButton(frame: bFrame)
            keyboardButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .allTouchEvents)
            keyboardButton.setTitle("\(Int(btnWidth))", for: .normal);
            keyboardButton.tag = currentButtonIndex
            addSubview(keyboardButton)
            
            print("button tag::\(keyboardButton.tag)")
            
            //set next keyboard button
            if (currentButtonIndex == nextKeyboardButtonIndex){
                nextKeyboardButton = keyboardButton
                keyboardButton.setTitle("Next", for: .normal);
            }
            currentButtonIndex += 1
        }
    }
    
    //calculate button width in a row
    func getButtonWidth(totalCol:Int,info:[Int:Int]? = [:]) -> Double{
        
        let paddingLR:Double = 2 * paddingX //padding left and right
        let totalGapX:Double = gapX * Double(totalCol-1)
        
        let btnWidth:Double  = (Double(frame.size.width) - paddingLR - totalGapX) / Double(totalCol)
        
        //override width
        if let _info = info {
            print("info::\(_info)")
            for index in _info.keys{
                print("info[\(index)] ::\(String(describing: _info[index]))")
            }
        }
        
        return btnWidth
    }
    
    //calculate button height in a col
    func getButtonHeight() -> Double{
        //calculate height
        let totalPaddingY:Double = 2 * paddingY
        let totalGapY:Double     = gapY * (totalRow-1)
        let btnHeight:Double = (216 - totalPaddingY - totalGapY) / (totalRow)//todo, 216 = keyboard height
        return btnHeight
    }
    
    @objc func buttonPressed(sender:UIButton){
        //[[UIDevice currentDevice] playInputClick];
        UIDevice.current.playInputClick()
    }
}

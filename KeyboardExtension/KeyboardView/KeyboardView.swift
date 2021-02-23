//
//  KeyboardView.swift
//  KeyboardSwift
//
//  Created by Jamil on 22/2/21.
//

import UIKit

class KeyboardView: UIView,UIInputViewAudioFeedback { //[[UIDevice currentDevice] playInputClick];
    // constants
    let paddingX:CGFloat = 2
    let paddingY:CGFloat = 5
    
    let gapX:CGFloat = 4
    let gapY:CGFloat = 10
    
    
    //var textView:UITextDocumentProxy?
    var nextKeyboardButton:KeyboardButton!
    
    var currentButtonIndex = 0;
    var nextKeyboardButtonIndex = 28;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //print("frame::\(frame)")
        
        //clear old view
        for view in subviews{
            view.removeFromSuperview()
        }
        
        //draw
        showLine(totalRow: 4)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK:- configure keyboard button
extension KeyboardView{
    func showLine(totalRow:Int){
        showLine(row: 0, total: 10)
        showLine(row: 1, total: 10)
        showLine(row: 2, total: 8)
        showLine(row: 3, total: 3)
    }
    
    func showLine(row:Int,total:Int){
        print("frame::\(frame)")
        
        //calculate width
        let padding = 2 * CGFloat(paddingX)
        let totalGapX = CGFloat(gapX * CGFloat(total-1))
        
        let btnWidth:CGFloat  = (frame.size.width - padding - totalGapX) / CGFloat(total)
        
        //calculate height
        let totalCol = 4 //todo
        let totalPaddingY = 2 * CGFloat(paddingY)
        let totalGapY     = CGFloat(gapY * CGFloat(totalCol-1))
        let btnHeight:CGFloat = (216 - totalPaddingY - totalGapY) / CGFloat(totalCol)//todo, 216 = keyboard height
        
        for i in 0...total-1 {
            
            let colY:CGFloat = CGFloat(paddingY + CGFloat(row)*(gapY + btnHeight))
            
            let bFrame = CGRect(x: paddingX + CGFloat(i)*(gapX + btnWidth), y:colY , width:btnWidth, height: btnHeight)
            let keyboardButton = KeyboardButton(frame: bFrame)
            keyboardButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .allTouchEvents)
            keyboardButton.setTitle("a", for: .normal);
            keyboardButton.tag = currentButtonIndex
            addSubview(keyboardButton)
            
            print("button tag::\(keyboardButton.tag)")
            
            if (currentButtonIndex == nextKeyboardButtonIndex){
                nextKeyboardButton = keyboardButton
                keyboardButton.setTitle("Next", for: .normal);
            }
            currentButtonIndex += 1
            
        }
        
    }
    
    @objc func buttonPressed(sender:UIButton){
        //[[UIDevice currentDevice] playInputClick];
        UIDevice.current.playInputClick()
    }
}

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
    var nextKeyboardButton:KeyboardButton!
    
    var currentButtonIndex = 0;
    var nextKeyboardButtonIndex = 39;
    
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
        showLine(row: 0, totalCol: 11)
        showLine(row: 1, totalCol: 10)
        showLine(row: 2, totalCol: 10)
        showLine(row: 3, totalCol: 8,info: [0:40,7:40])
        showLine(row: 4, totalCol: 5,info: [0:50,1:26,2:170,3:26])
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
            
            //set next keyboard button
            if (currentButtonIndex == nextKeyboardButtonIndex){
                nextKeyboardButton = keyboardButton
                keyboardButton.setTitle("Next", for: .normal);
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

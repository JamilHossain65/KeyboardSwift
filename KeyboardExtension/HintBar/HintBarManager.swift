//
//  HintBarManager.swift
//  KeyboardExtension
//
//  Created by Jamil on 27/4/21.
//

import UIKit

protocol HintBarDelegate: class {
    func didSelectHint (_ sender: Any)
    func didSelectColor(_ sender: Any)
    func didSartScroll (_ scrollView: UIScrollView)
    func didEndScroll  (_ scrollView: UIScrollView)
}

var wordArray:[String] = [String]()

var suggestionBarScrollView:UIScrollView = UIScrollView();

let MAX_WORD = 10

class HintBarManager: NSObject {
    public static let shared = HintBarManager()
    weak var delegate: HintBarDelegate?
    
    func addSuggestionBar(parentView:UIView,txtView:UITextDocumentProxy) {
        parentView.addSubview(suggestionBarScrollView)
        suggestionBarScrollView.layer.zPosition = -10
        suggestionBarScrollView.delegate = self
        
        switch keySettingType {
        case .FONT:
            refresh(scrollView: suggestionBarScrollView, dataArray: kUnicodeFontNameArray)
            break
            
        case .COLOR:
            let colorArray = Color.shared.colorList()
            let colorList:[UIColor] = colorArray.map({ $0.colorSmall})
            refreshColor(scrollView: suggestionBarScrollView, colorArray: colorList)
            break
            
        default:
            break
        }
    }
    
    func refresh(scrollView:UIScrollView, dataArray:[String], selectedIndex:Int? = 0){
        if dataArray.count <= 0 {return}
        
        for view in suggestionBarScrollView.subviews{
            view.removeFromSuperview()
        }
        
        //Add suggestion bar
        let border:CGFloat = 1
        let screenWidth  = UIScreen.main.bounds.size.width - 2*border
        let buttonWidth  = screenWidth/3
        
        //Keyboard bar
        scrollView.frame = CGRect(x:0, y:0, width: Int(UIScreen.main.bounds.size.width), height:Int(hintBarHeight))
        scrollView.backgroundColor  = .clear
        scrollView.bounces = false
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: CGFloat(CGFloat((dataArray.count))*(buttonWidth + border)), height: scrollView.contentSize.height)
        
        for index in 0...dataArray.count - 1  {
            let sgButton = UIButton.init(type: .custom)
            sgButton.tag = index
            sgButton.backgroundColor = .clear 
            sgButton.setTitle(" \(dataArray[index]) ", for: .normal)
            sgButton.titleLabel?.adjustsFontSizeToFitWidth = true
            sgButton.setTitleColor(.black, for: .normal)
            sgButton.frame = CGRect(x: index*Int((buttonWidth+border)) ,y: 0, width: Int(buttonWidth), height: Int(hintBarHeight))
            sgButton.addTarget(self, action: #selector(suggestionButtonDidClick(button:)), for: .touchUpInside)
            sgButton.setTitleColor(kKeyboardTextColor, for: .normal)
            
            if sgButton.tag == selectedIndex {
                sgButton.titleLabel?.adjustsFontSizeToFitWidth = true
                sgButton.titleLabel?.layer.masksToBounds = true;
                sgButton.titleLabel?.layer.borderWidth = 1.0
                
                sgButton.titleLabel?.layer.cornerRadius = 5.0
                sgButton.titleLabel?.backgroundColor = kOffWhiteColor
            }
            
            scrollView.addSubview(sgButton)
            //add vertical seperator
            let sepLbl = UILabel()
            sepLbl.backgroundColor = .white
            sepLbl.frame = CGRect(x: CGFloat(index)*(buttonWidth+border), y: 0.0, width: 0.7, height: hintBarHeight*0.5)
            sepLbl.center = CGPoint(x: sepLbl.center.x, y: sgButton.center.y)
            scrollView.addSubview(sepLbl)
        }
    }
    
    func refreshColor(scrollView:UIScrollView, colorArray:[UIColor]){
        if colorArray.count <= 0 {return}
        
        for view in suggestionBarScrollView.subviews{
            view.removeFromSuperview()
        }
        
        //Add suggestion bar
        let border:CGFloat = 1
        let screenWidth  = UIScreen.main.bounds.size.width - 2*border
        let buttonWidth  = hintBarHeight //screenWidth/3
        
        
        //Keyboard bar
        scrollView.frame = CGRect(x:0, y:0, width: Int(UIScreen.main.bounds.size.width), height:Int(hintBarHeight))
        scrollView.backgroundColor  = .clear //[UIColor colorWithRed:211/255.0 green:213/255.0 blue:219/255.0 alpha:1.0];
        scrollView.bounces = false
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: CGFloat(CGFloat((colorArray.count))*(buttonWidth + border)), height: scrollView.contentSize.height)
        
        for index in 0...colorArray.count - 1  {
            let sgButton = UIButton.init(type: .custom)
            sgButton.tag = index
            sgButton.layer.cornerRadius = buttonWidth/2
            let size = CGSize(width: 70, height: 70*0.667)
            let image = colorArray[index].image(size)
            sgButton.backgroundColor = UIColor(patternImage: image)
            sgButton.titleLabel?.adjustsFontSizeToFitWidth = true
            sgButton.frame = CGRect(x: index*Int((buttonWidth+border)) ,y: 0, width: Int(buttonWidth), height: Int(hintBarHeight))
            sgButton.addTarget(self, action: #selector(colorButtonDidClick(button:)), for: .touchUpInside)
            sgButton.layer.borderWidth = 0.5
            scrollView.addSubview(sgButton)
        }
    }
    
    @objc func suggestionButtonDidClick(button:UIButton){
        print("hint:\(String(describing: button.titleLabel?.text))")
        if let _delegate = delegate {
            _delegate.didSelectHint(button)
            refresh(scrollView: suggestionBarScrollView, dataArray: kUnicodeFontNameArray,selectedIndex: button.tag)
        }
    }
    
    @objc func colorButtonDidClick(button:UIButton) {
        print("color btn tag: \(String(describing: button.tag))")
        if let _delegate = delegate {
            _delegate.didSelectColor(button)
        }
    }
}

//MARK:- SCROLLVIEW DELEGATE METHODS
extension HintBarManager:UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if let _delegate = delegate {
            _delegate.didSartScroll(scrollView)
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let _delegate = delegate {
            _delegate.didEndScroll(scrollView)
        }
    }
}

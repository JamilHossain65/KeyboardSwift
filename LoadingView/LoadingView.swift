//
//  LoadingView.swift
//  SmartKeyboard
//
//  Created by Jamil Hossain on 12/5/17.
//  Copyright © 2017 Jamil Hossain. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    public static let shared = LoadingView()
    
    var mainView = UIView()
    
    var datString:String?
    
    let popoverView:UIView = UIView()
    let    fadeView:UIView = UIView()
    
    var activityIndicator:UIActivityIndicatorView!
    
    
    static let DEFAULT_CORNER_RADIOUS = CGFloat(6.0)
    static let DEFAULT_BORDER_WIDTH   = CGFloat(2.0)
    
    static let DEFAULT_ARROW_WIDTH  = 30
    static let DEFAULT_ARROW_HEIGHT = 20
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        let frame = UIScreen.main.bounds;
        let center:CGPoint =  CGPoint(x: frame.size.width/2,y :frame.size.height/2)
        self.setupView(frame: frame, showAtPoint: center, data: "Loading...")
        
    }
    init(data:String){
        super.init(frame: UIScreen.main.bounds)
        
    }
    
    init(frame:CGRect, showAtPoint:CGPoint, data:String) {
        super.init(frame: UIScreen.main.bounds)
        
      self.setupView(frame: frame, showAtPoint: showAtPoint, data: data)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func setupView(frame:CGRect, showAtPoint:CGPoint, data:String){
        //self.datString = data as? String
        self.datString = data
        
        //set transperency in parent view
        self.backgroundColor = UIColor.clear
        let keyWindow = UIApplication.shared.keyWindow
        //add a fade view
        fadeView.backgroundColor = UIColor.black
        fadeView.frame = self.frame
        fadeView.alpha = 0.33
        fadeView.tag   = 1011
        keyWindow!.addSubview(fadeView)
        //self.addSubview(fadeView)
        
        //add popover view
        
        //print("frame:\(frame) point:\(showAtPoint)")
        //Reset fame where to show popover view
        var nFrame         = frame
        nFrame.origin.x    = 0
        nFrame.origin.y    = 0
        nFrame.size.height = frame.size.height + LoadingView.DEFAULT_CORNER_RADIOUS
        
        popoverView.frame              = nFrame
        
        //Calculate frame of left-right position of x-axis
        var distance:CGFloat = self.frame.size.width - showAtPoint.x
        let rightBound = distance - popoverView.center.x
        let leftBound = showAtPoint.x - popoverView.center.x
        
        distance = showAtPoint.x
        
        //check right bound
        if  rightBound < 0.0 {
            distance = showAtPoint.x - abs(self.frame.size.width - showAtPoint.x - popoverView.center.x)
        }else if  leftBound < 0.0 {//check left bound
            distance = popoverView.center.x
        }
        
        //print("distance:",distance)
        
        //Calculate X-Axis value
        var xAxis = 0.5*(popoverView.frame.size.width-CGFloat(LoadingView.DEFAULT_ARROW_WIDTH))
        //check by right bound
        if  rightBound < 0.0{
            xAxis = popoverView.frame.size.width - (self.frame.size.width - showAtPoint.x) - 0.5*CGFloat(LoadingView.DEFAULT_ARROW_WIDTH)
        }else if  leftBound < 0.0{//check by left bound
            xAxis = showAtPoint.x - 0.5*CGFloat(LoadingView.DEFAULT_ARROW_WIDTH)
        }
        
        //print("xAxis:",xAxis)
        
        
        
        popoverView.center             = CGPoint(x: distance, y: showAtPoint.y)
        //popoverView.layer.borderWidth  = PopoverView.DEFAULT_BORDER_WIDTH
        //popoverView.layer.borderColor  = UIColor.darkGray.cgColor
        //popoverView.layer.cornerRadius = LoadingView.DEFAULT_CORNER_RADIOUS
        popoverView.backgroundColor    = UIColorFromRGB(rgbValue: 0x92A770)// 6192A6
            //UIColor.init(colorLiteralRed: 0.0, green: 170.0/255, blue: 110.0/255, alpha: 1.0)
        self.addSubview(popoverView)
        
        
        //add a text view
        let textLabel:UILabel     = UILabel()
        textLabel.numberOfLines   = 0
        textLabel.textColor       = UIColor.white
        textLabel.backgroundColor = UIColor.clear;
        textLabel.textAlignment   = NSTextAlignment.center
        textLabel.font            = UIFont(name: "HelveticaNeue-Light", size: 22)
        textLabel.text            = self.datString == nil ? "No Data Found": self.datString
        
        textLabel.frame = CGRect(x: CGFloat(LoadingView.DEFAULT_BORDER_WIDTH),
                                 y: CGFloat(LoadingView.DEFAULT_BORDER_WIDTH),
                                 width: popoverView.frame.size.width-2*LoadingView.DEFAULT_BORDER_WIDTH,
                                 height: popoverView.frame.size.height-2*LoadingView.DEFAULT_BORDER_WIDTH)
        
        popoverView.addSubview(textLabel)
        
        /*
         //add arrow  sign view on poover view
         let triangleView:Triangle = Triangle(frame:CGRect(x:Int(xAxis),
         y: -1*LoadingView.DEFAULT_ARROW_HEIGHT,
         width: LoadingView.DEFAULT_ARROW_WIDTH,
         height: LoadingView.DEFAULT_ARROW_HEIGHT))
         
         //triangleView.layer.borderWidth  = LoadingView.DEFAULT_BORDER_WIDTH
         triangleView.backgroundColor    = UIColor.init(colorLiteralRed: 0.0, green: 170.0/255, blue: 110.0/255, alpha: 1.0)
         popoverView.bringSubview(toFront: triangleView)
         popoverView.addSubview(triangleView)
         */
        self.busyView();
        
        //add tap guesture in fadeview
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapOnFadeView(_:)))
        fadeView.addGestureRecognizer(tapGesture)
    }
    
    func busyView(){
        //left view
        let leftView:UIView = UIView()
        leftView.frame = CGRect(x: 0, y: 0, width: 80, height: popoverView.frame.size.height)
        leftView.backgroundColor = UIColorFromRGB(rgbValue: 0x6192A6)//0x 92A770
        popoverView.addSubview(leftView)
        
        //Create Activity Indicator
        activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        activityIndicator.frame = CGRect(x: 10, y: 10, width: activityIndicator.frame.size.width, height: activityIndicator.frame.size.height)
        // Position Activity Indicator in the center of the main view
        //activityIndicator.center = CGPoint(x: 10, y: 0)
        
        // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
        activityIndicator.hidesWhenStopped = false
        
        // Start Activity Indicator
        activityIndicator.startAnimating()
        
        // Call stopAnimating() when need to stop activity indicator
        //myActivityIndicator.stopAnimating()
        
        leftView.addSubview(activityIndicator)
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    //when tap on fade view the popover view will dismish
    @objc func tapOnFadeView(_ sender: UITapGestureRecognizer) {
        //self.dismishPopover()
    }
    
    var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc func showLoading(view:UIView){
        //remove existing loading view
        //dismish()
        
        let loadingView:LoadingView = LoadingView(frame: CGRect(x: 0, y: 0, width: 300, height: 50), showAtPoint: view.center, data: "Please Wait...")
        view.addSubview(loadingView)
        mainView = loadingView
        loadingView.tag = 123456
        self.showStatus(windowLavel: UIWindow.Level.statusBar)
        self.perform(#selector(self.dismish), with: nil, afterDelay: 10)
    }
    
    @objc func dismish(){
        print("dismiah called.......")
        DispatchQueue.main.async {
            self.mainView.removeFromSuperview()
            let keyWindow = UIApplication.shared.keyWindow
            let view = keyWindow?.viewWithTag(1011)
            view?.removeFromSuperview()
            LoadingView.shared.mainView.removeFromSuperview()
        }
        
        /*
        DispatchQueue.main.async {
            LoadingView.shared.removeFromSuperview()
            
            if(self.activityIndicator != nil){
                self.activityIndicator.stopAnimating()
                self.activityIndicator = nil;
            }
            
            let adsManager:AdManager = AdManager.shared
            let application:UIApplication = adsManager.application
    
            for  s in (application.keyWindow?.subviews as [UIView]?)!{
                let view:UIView = s
                if view.tag == 123456{
                    view.removeFromSuperview()
                }
            }//end
            
            //show status bar
            self.showStatus(windowLavel: UIWindow.Level.normal);
        }
         */
    }
    
    func showStatus(windowLavel:UIWindow.Level){
//        let adsManager:AdsManager = AdsManager.sharedInstance() as! AdsManager
//        let application:UIApplication = adsManager.application
//        application.keyWindow?.windowLevel = windowLavel
    }
}

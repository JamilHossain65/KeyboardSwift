//
//  JHKeyPopup.swift
//  KeyboardExtension
//
//  Created by Jamil on 03/2/22.
//

import UIKit

protocol JHKeyPopupDelegate: class {
    func didSelectHintButtonSwift(_ sender : UIButton)
    func didTapLongOnButtonSwift (_ sender : UIButton)
    func didReleaseLongOnSwift   (_ sender : UIButton)
}

enum ACHintPosition:Int {
    case ACHintPositionFarLeft
    case ACHintPositionLeft
    case ACHintPositionRight
    case ACHintPositionFarRight
}

enum appearance:Int {
    case ACKeyAppearanceDark
    case ACKeyAppearanceLight
}

var isLongPressing = false
var kTOP_IMAGE:UIImage? = nil

/** The position for long-tap hint - for "a" ACHintPositionFarLeft
 */
var hintPosition:ACHintPosition = .ACHintPositionLeft
var _appearance:appearance = .ACKeyAppearanceLight

let ACKEY_OVERLAY_KEY = -12

let kNotificationHideButtonPopup = "kNotificationHideButtonPopup"

let ACKEY_POPUP_VIEV_TAG  = -13 //todo

let kKeyPopapAppearDuration  = 0.00

let kKeyPopapStayAliveInterval  = 0.00


let __FAR_SHIFT   = (12 * UIScreen.main.scale)
let __UPPER_WIDTH = (55.0 * UIScreen.main.scale)
var __LOWER_WIDTH = CGFloat(51.174603) //self.frame.size.width * UIScreen.main.scale //todo
let __PAN_UPPER_RADIUS  = (10.0 * UIScreen.main.scale)
let __PAN_LOWER_RADIUS  = (5.0 * UIScreen.main.scale)
let __PAN_UPPDER_WIDTH  = (__UPPER_WIDTH-__PAN_UPPER_RADIUS*2)
let __PAN_UPPER_HEIGHT  = (56.0 * UIScreen.main.scale)
let __PAN_LOWER_WIDTH   = (__LOWER_WIDTH - __PAN_LOWER_RADIUS*2)
let __PAN_LOWER_HEIGHT  = (47.0 * UIScreen.main.scale)
let __PAN_UL_WIDTH      = ((__UPPER_WIDTH-__LOWER_WIDTH)/2)
let __PAN_MIDDLE_HEIGHT = (2.0 * UIScreen.main.scale)
let __PAN_CURVE_SIZE    = (10.0 * UIScreen.main.scale)
let __PADDING_X = (15 * UIScreen.main.scale)
let __PADDING_Y = (10 * UIScreen.main.scale)
let __WIDTH     = (__UPPER_WIDTH + __PADDING_X*2)
let __HEIGHT    = (__PAN_UPPER_HEIGHT + __PAN_MIDDLE_HEIGHT + __PAN_LOWER_HEIGHT + __PADDING_Y*2)
let __OFFSET_X = (-25 * UIScreen.main.scale)
let __OFFSET_Y = (59 * UIScreen.main.scale)
let __GAP_X    = (3 * UIScreen.main.scale)

class JHKeyPopup: UIButton {
    
    var hintSymbolsList:[String]?
    var hidePopupTimer:Timer?
    var showHintTimer:Timer?
    var hintView:UIView?
    var hintButtons:[UIButton]?
    var hintAdditionalWidth:CGFloat = 0.0
    weak var delegate2: JHKeyPopupDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        __LOWER_WIDTH = frame.size.width * UIScreen.main.scale
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func checkHintPosition(keyButton:UIButton){
        let rowKeys = getLettersInRows() //[10,9,9,5]
        print("rowKeys::\(rowKeys)")
        var value = 0
        var index = 0
        let tagValue = keyButton.tag + 1
        while (index < rowKeys.count) {
            let rowValue:Int = rowKeys[index]
            value += rowValue
            if (value >= tagValue){
                let halfvalue = rowValue/2
                let pos = value - halfvalue
                if(pos >= tagValue){
                    switch (tagValue) {
                    case 1:
                        hintPosition = .ACHintPositionFarLeft
                        break
                    default:
                        hintPosition = .ACHintPositionLeft
                        break
                    }
                }else{
                    switch (tagValue) {
                        case 10:
                            hintPosition = .ACHintPositionFarRight
                            break
                            
                        default:
                            hintPosition = .ACHintPositionRight
                            break
                    }
                }
                return
            }
            index += 1
        }
    }
  
    func trim(_ text:String)-> String{
        let mText = text.trimmingCharacters(in: .whitespaces)
        return mText
    }
    
    func addPopupToButton(button:UIButton) {
        hidePopup()
        checkHintPosition(keyButton: button)
        let defaults = UserDefaults.standard
        let hintString:String = defaults.value(forKey: "kSelectedHintString") as! String
        let title = button.titleLabel?.text
        let array = hintString.components(separatedBy: ",")
        
        for text in array{
            let letters = trim(text).components(separatedBy: " ")
            if letters.first == trim(title!){
                self.hintSymbolsList = letters
                var newArray:[String] = []
                
                for txt in self.hintSymbolsList ?? []{
                    newArray.append(trim(txt))
                }
                self.hintSymbolsList = newArray
                break
            }
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNotificationHideButtonPopup), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(hidePopup), name: NSNotification.Name(rawValue: kNotificationHideButtonPopup), object: nil)
        
        
        //if true{
            var keyPop:UIImageView? = nil
//            if false{
//                
//            }else{
                let image:UIImage = keytopImage()
                keyPop = UIImageView.init(image: image)
                keyPop?.frame = CGRect(x: (self.frame.size.width - image.size.width) / 2, y: -71, width: keyPop!.frame.size.width, height: keyPop!.frame.size.height)
                var shift:CGFloat = 0.0
                var amount:CGFloat = self.frame.size.width/3
                if (hintPosition == .ACHintPositionFarLeft) {
                    shift = amount
                }else if (hintPosition == .ACHintPositionFarRight) {
                    shift = -amount
                }
                let text = UILabel.init(frame: CGRect(x: shift, y: 10, width: keyPop!.frame.size.width, height: 60))
                
                text.font = UIFont.systemFont(ofSize: 35)
                text.text = button.titleLabel?.text
                text.textAlignment = .center
                text.backgroundColor = .clear
                text.adjustsFontSizeToFitWidth = true
                text.textColor = button.titleLabel?.textColor
                
                keyPop?.layer.shadowColor = UIColor.init(white: 0.1, alpha: 1.0).cgColor
                keyPop?.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
                keyPop?.layer.shadowOpacity = 0.30
                keyPop?.layer.shadowRadius = 3.0
                keyPop?.clipsToBounds = false
                keyPop?.addSubview(text)
                
            //}
            
            keyPop?.tag = ACKEY_POPUP_VIEV_TAG
            keyPop?.alpha = 1.0
            button.addSubview(keyPop!)
            
            UIView.animate(withDuration: kKeyPopapAppearDuration, animations: {
                keyPop?.alpha = 1.0
            })
            
            print("tap tag::\(button.tag)")
            startShowHintTimer()
        //}//
        
    }
    
    @objc func showKeyCapView(){
        print("showKeyCapView...")

        if ((self.hintSymbolsList == nil) || (self.hintSymbolsList!.count == 0)) {
            print("tap tag::\(self.tag)")
            return
        }
        
        isLongPressing = true
        
        if let _delegate = self.delegate2{
            _delegate.didTapLongOnButtonSwift(self)
        }
        
        self.isHighlighted = false
        self.isSelected = false
        updateState()
        hidePopup()
        
        let image:UIImage = hintImage()
        self.hintView = UIImageView.init(image: image)
        let isRightHint:Bool = hintPosition == .ACHintPositionFarRight || hintPosition == .ACHintPositionRight
        var xPos:CGFloat
        if (isRightHint) {
            xPos = (self.frame.size.width - (image.size.width + self.hintAdditionalWidth/2))/2
        } else { //ACHintPositionLeft & ACHintPositionFarLeft
            xPos = -27
        }
        
        self.hintView?.frame = CGRect(x: xPos, y: -71, width: self.hintView!.frame.size.width, height: self.hintView!.frame.size.height)
        self.hintView?.layer.shadowColor = UIColor.init(white: 0.1, alpha: 1.0).cgColor
        self.hintView?.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.hintView?.layer.shadowOpacity = 0.30
        self.hintView?.layer.shadowRadius = 3.0
        self.hintView?.clipsToBounds = false
        self.hintView?.backgroundColor = .clear
        
        var button:UIButton?
        var hint: String
        
        var hintStrings:[String] = []
        if isRightHint {
            var newArray:[String] = []
            for revHint in self.hintSymbolsList ?? []{
                newArray.insert(revHint, at: 0)
            }
            hintStrings = newArray
            
        }else{
            hintStrings = self.hintSymbolsList!
        }
        
        var mArray:[UIButton] = []
        var i = 0
        for _ in hintSymbolsList ?? [] {
            if hintStrings.count > 0{
                hint = hintStrings[i]
            }else{
                hint = button?.titleLabel?.text ?? "" //MARK:- TODO: check logic
            }
            
            button  = UIButton.init(type: .custom)
            
            let xx:CGFloat = __PAN_UL_WIDTH + CGFloat(i)*(self.frame.size.width + __GAP_X) + (isRightHint ? 0 : __GAP_X - 1)
            button!.frame = CGRect(x:xx ,
                                  y: 20, width: self.frame.size.width, height: self.frame.size.height)
            
            button?.setTitle(hint, for: .normal)
            button?.setTitle(hint, for: .selected)
            
            button?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
            
            button?.setTitleColor(.white, for: .highlighted)
            button?.setTitleColor(.black, for: .normal)
            
            let blueColor = UIColor.init(red:3/255.0 , green: 122/255.0, blue: 1.0, alpha: 1.0)
            let imageBlue:UIImage  = imageWithColor(color: blueColor)
            let imageWhite:UIImage = imageWithColor(color: .white)
            //[button setBackgroundImage:imageBlue  forState:UIControlStateHighlighted]
            button?.setBackgroundImage(imageBlue, for: .highlighted)
            button?.setBackgroundImage(imageWhite,for: .normal)
            
            button?.layer.masksToBounds = true
            button?.layer.cornerRadius  = 5.0
            
            self.hintView!.addSubview(button!)
            mArray.append(button!)
            
            i = i+1
        }
        
        if (isRightHint) {
            mArray.last?.isHighlighted = true
        } else {
            mArray.first?.isHighlighted = true
        }
        
        self.hintButtons = mArray

        //self.hintView.layer.shadowColor =
        self.hintView!.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.hintView!.layer.shadowOpacity = 0.40
        self.hintView!.layer.shadowRadius = 3.0
        self.hintView!.clipsToBounds = false
        self.addSubview(hintView!)
    }
    
    func getIsRightHint() -> Bool{
        let isRightHint:Bool = hintPosition == .ACHintPositionFarRight || hintPosition == .ACHintPositionRight
        var xPos:CGFloat
        if (isRightHint) {
            xPos = (self.frame.size.width - (hintImage().size.width + self.hintAdditionalWidth/2))/2
        } else { //ACHintPositionLeft & ACHintPositionFarLeft
            xPos = -27
        }
        return isRightHint
    }
    
    // scheme
    /*

        1       2
        _______>  3
    13 /        \
       |        |
    12 |        | 4
       \        /
    11  \      /  5
       10|    |
         |    | 6
       9 \<---/ 7
          8
     
         1       2
          _______>_______  3
      13 /               \
         |               |
      12 |               | 4
         \   5.2  _______/5.1
      11  \      /  5.3
         10|    |
           |    | 6
         9 \<---/ 7
           8
     
     */
    
    func keytopImage()-> UIImage {
        
        if let _image = kTOP_IMAGE {
            log("already image exist")
            //return _image
        }
        
        /*
            1       2
            _______>  3
        13 /        \
           |        |
        12 |        | 4
           \        /
        11  \      /  5
           10|    |
             |    | 6
           9 \<---/ 7
              8
        */
        
        let path:CGMutablePath = CGMutablePath()
        var p = CGPoint(x: __PADDING_X, y: __PADDING_Y)
        var p1 = CGPoint(x: 0, y: 0)
        var p2 = CGPoint(x: 0, y: 0)
        
        //1
        p.x += __PAN_UPPER_RADIUS
        path.move(to: p)
        
        //2
        p.x += __PAN_UPPDER_WIDTH
        path.addLine(to: p)
        //3
        p.y += __PAN_UPPER_RADIUS
        path.addArc(center: CGPoint(x: p.x, y: p.y), radius: __PAN_UPPER_RADIUS, startAngle: CGFloat(3.0*Double.pi/2.0), endAngle: CGFloat(4.0*Double.pi/2.0), clockwise: false)
        
        //4
        p.x += __PAN_UPPER_RADIUS
        p.y += __PAN_UPPER_HEIGHT - __PAN_UPPER_RADIUS - __PAN_CURVE_SIZE
        path.addLine(to: p)
        //5
        p1 = CGPoint(x:p.x, y:p.y + __PAN_CURVE_SIZE)
        
        switch (hintPosition) {
        case .ACHintPositionFarRight:
            p.x -= __PAN_UL_WIDTH*2
            break
        case .ACHintPositionLeft:
            p.x -= __PAN_UL_WIDTH
            break
        case .ACHintPositionRight:
            p.x -= __PAN_UL_WIDTH
            break
        case .ACHintPositionFarLeft:
            break
        
        }
        
        p.y += __PAN_MIDDLE_HEIGHT + __PAN_CURVE_SIZE*2
        p2 = CGPoint(x:p.x, y:p.y - __PAN_CURVE_SIZE)
        path.addCurve(to: p, control1: p1, control2: p2)
        //6
        p.y += __PAN_LOWER_HEIGHT - __PAN_CURVE_SIZE - __PAN_LOWER_RADIUS
        path.addLine(to: p)
        //7
        p.x -= __PAN_LOWER_RADIUS
        path.addArc(center: p, radius: __PAN_LOWER_RADIUS, startAngle: CGFloat(4.0*Double.pi/2.0), endAngle: CGFloat(1.0*Double.pi/2.0), clockwise: false)
        //8
        p.x -= __PAN_LOWER_WIDTH
        p.y += __PAN_LOWER_RADIUS
        path.addLine(to: p)
        //9
        p.y -= __PAN_LOWER_RADIUS
        path.addArc(center: p, radius: __PAN_LOWER_RADIUS, startAngle: CGFloat(1.0*Double.pi/2.0), endAngle: CGFloat(2.0*Double.pi/2.0), clockwise: false)
        //10
        p.x -= __PAN_LOWER_RADIUS
        p.y -= __PAN_LOWER_HEIGHT - __PAN_LOWER_RADIUS - __PAN_CURVE_SIZE
        path.addLine(to: p)
        //11
        p1 = CGPoint(x:p.x, y:p.y - __PAN_CURVE_SIZE)
        switch (hintPosition) {
        case .ACHintPositionFarRight:
                break
                
        case .ACHintPositionLeft:
            p.x -= __PAN_UL_WIDTH
            break
        case .ACHintPositionRight:
                p.x -= __PAN_UL_WIDTH
                break
                
        case .ACHintPositionFarLeft:
                p.x -= __PAN_UL_WIDTH*2
                break
        }
        p.y -= __PAN_MIDDLE_HEIGHT + __PAN_CURVE_SIZE*2
        p2 = CGPoint(x:p.x, y:p.y + __PAN_CURVE_SIZE)
        path.addCurve(to:p, control1: p1, control2: p2)
        //12
        p.y -= __PAN_UPPER_HEIGHT - __PAN_UPPER_RADIUS - __PAN_CURVE_SIZE
        path.addLine(to: p)
        //13
        p.x += __PAN_UPPER_RADIUS
        path.addArc(center: p, radius: __PAN_UPPER_RADIUS, startAngle: CGFloat(2.0*Double.pi/2.0), endAngle: CGFloat(3.0*Double.pi/2.0), clockwise: false)
        
        var context:CGContext?
        UIGraphicsBeginImageContext(CGSize(width: __WIDTH,
                                           height: __HEIGHT))
        context = UIGraphicsGetCurrentContext()
        switch (hintPosition) {
        case .ACHintPositionFarRight:
            context!.translateBy(x: __FAR_SHIFT, y: __HEIGHT)
                break
                
        case .ACHintPositionLeft:
            context!.translateBy(x: 0.0, y: __HEIGHT)
            break
        case .ACHintPositionRight:
            context!.translateBy(x: 0.0, y: __HEIGHT)
            break
                
        case .ACHintPositionFarLeft:
            context!.translateBy(x: (-1)*__FAR_SHIFT, y: __HEIGHT)
                break
        }
        
        context!.scaleBy(x: 1.0, y: -1.0)
        
        context!.addPath(path)
        context?.clip()
        
        let frame:CGRect = path.boundingBox
        let backColor:CGColor = UIColor.white.cgColor
        
        context!.setFillColor(backColor)
        context!.fill(frame)
        let imageRef:CGImage = context!.makeImage()! //context!.bitmapInfo as! CGImage
        let image = UIImage.init(cgImage: imageRef, scale: UIScreen.main.scale, orientation: .down)
        context!.endPage()
        
        kTOP_IMAGE = image
     return image
    }
    
    
    func hintImage()-> UIImage{
        let path:CGMutablePath = CGMutablePath()
        var p = CGPoint(x: __PADDING_X, y: __PADDING_Y)
        var p1 = CGPoint(x: 0, y: 0)
        var p2 = CGPoint(x: 0, y: 0)
        
        //1
        p.x += __PAN_UPPER_RADIUS
        path.move(to: p)
        
        let hintCount:UInt = UInt(self.hintSymbolsList!.count)
        //!!!:magic numbers
        let newWidth:CGFloat = CGFloat(2*(hintCount - 1))
        hintAdditionalWidth = newWidth*(self.frame.size.width + __GAP_X)
        
        //2
        p.x += __PAN_UPPDER_WIDTH + self.hintAdditionalWidth
        //!!!:+hintCount*(__PAN_LOWER_WIDTH+__GAP_X)
        path.addLine(to: p)
        //3
        p.y += __PAN_UPPER_RADIUS
        path.addArc(center: p, radius: __PAN_UPPER_RADIUS, startAngle: CGFloat(3.0*Double.pi/2.0), endAngle: CGFloat(4.0*Double.pi/2.0), clockwise: false)
        p.x += __PAN_UPPER_RADIUS
        //4
        p.y += __PAN_UPPER_HEIGHT - __PAN_UPPER_RADIUS
        if hintPosition == .ACHintPositionFarRight ||
                hintPosition == .ACHintPositionRight {
            p.y += -(2*__PAN_UPPER_RADIUS) + __PAN_CURVE_SIZE + __PAN_MIDDLE_HEIGHT
        } else { //ACHintPositionLeft & ACHintPositionFarLeft
            p.y -= __PAN_CURVE_SIZE
        }
        path.addLine(to: p)

        if hintPosition == .ACHintPositionFarRight ||
                hintPosition == .ACHintPositionRight {
            //5.1
            p.x -= __PAN_UPPER_RADIUS
            path.addArc(center: p, radius: __PAN_UPPER_RADIUS, startAngle: CGFloat(4.0*Double.pi/2.0), endAngle: CGFloat(1.0*Double.pi/2.0), clockwise: false)
            
            p.y += __PAN_UPPER_RADIUS
            
            //5.2
            p.x -= self.hintAdditionalWidth + __PAN_UL_WIDTH-2*__PAN_UPPER_RADIUS
            path.addLine(to: p)
            
            //5.3
            p.y += __PAN_UPPER_RADIUS
            path.addArc(center: p, radius: __PAN_UPPER_RADIUS, startAngle: CGFloat(3.0*Double.pi/2.0), endAngle: CGFloat(2.0*Double.pi/2.0), clockwise: true)
            
            p.x -= __PAN_UPPER_RADIUS
        } else { //ACHintPositionLeft & ACHintPositionFarLeft
            //5
            p1 = CGPoint(x:p.x, y:p.y + __PAN_CURVE_SIZE)
            p.x -= __PAN_UL_WIDTH
            p.y += __PAN_MIDDLE_HEIGHT + __PAN_CURVE_SIZE*2
            p2 = CGPoint(x:p.x, y:p.y - __PAN_CURVE_SIZE)
            path.addCurve(to: p, control1: p1, control2: p2)
        
        }

        //6
        p.y += __PAN_LOWER_HEIGHT - __PAN_CURVE_SIZE - __PAN_LOWER_RADIUS
        path.addLine(to: p)
        
        //7
        p.x -= __PAN_LOWER_RADIUS
        path.addArc(center: p, radius: __PAN_LOWER_RADIUS, startAngle: CGFloat(4.0*Double.pi/2.0), endAngle: CGFloat(1.0*Double.pi/2.0), clockwise: false)
        //8
        p.x -= __PAN_LOWER_WIDTH
        p.y += __PAN_LOWER_RADIUS
        path.addLine(to: p)
        
        //9
        p.y -= __PAN_LOWER_RADIUS
        
        path.addArc(center: p, radius: __PAN_LOWER_RADIUS, startAngle: CGFloat(1.0*Double.pi/2.0), endAngle: CGFloat(2.0*Double.pi/2.0), clockwise: false)
        
        //10
        p.x -= __PAN_LOWER_RADIUS
        p.y -= __PAN_LOWER_HEIGHT - __PAN_LOWER_RADIUS - __PAN_CURVE_SIZE
        
        path.addLine(to: p)
        
        if hintPosition == .ACHintPositionFarRight ||
            hintPosition == .ACHintPositionRight {
            //11
            p1 = CGPoint(x:p.x, y:p.y - __PAN_CURVE_SIZE)
            p.x -= __PAN_UL_WIDTH
            p.y -= __PAN_MIDDLE_HEIGHT + __PAN_CURVE_SIZE*2
            p2 = CGPoint(x:p.x, y:p.y + __PAN_CURVE_SIZE)
            path.addCurve(to: p, control1: p1, control2: p2)
            
        } else { //ACHintPositionLeft & ACHintPositionFarLeft
            
            //11.1
            p.x -= __PAN_UPPER_RADIUS
            path.addArc(center: p, radius: __PAN_UPPER_RADIUS, startAngle: CGFloat(4.0*Double.pi/2.0), endAngle: CGFloat(3.0*Double.pi/2.0), clockwise: true)
            
            p.y -= __PAN_UPPER_RADIUS
            
            //11.2
            p.x -= self.hintAdditionalWidth + __PAN_UL_WIDTH-2*__PAN_UPPER_RADIUS
            //CGPathAddLineToPoint(path, NULL, p.x, p.y)
            path.addLine(to: p)
            
            //11.3
            p.y -= __PAN_UPPER_RADIUS
            path.addArc(center: p, radius: __PAN_UPPER_RADIUS, startAngle: CGFloat(1.0*Double.pi/2.0), endAngle: CGFloat(2.0*Double.pi/2.0), clockwise: false)
            
            p.x -= __PAN_UPPER_RADIUS
        }
        
        //12
        p.y -= __PAN_UPPER_HEIGHT - __PAN_UPPER_RADIUS
        if (hintPosition == .ACHintPositionFarRight ||
                hintPosition == .ACHintPositionRight) {
            p.y += __PAN_CURVE_SIZE
        } else {
            p.y -= -(2*__PAN_UPPER_RADIUS) + __PAN_CURVE_SIZE + __PAN_MIDDLE_HEIGHT
        }
        
        path.addLine(to: p)
            
        //13
        p.x += __PAN_UPPER_RADIUS
        
        path.addArc(center: p, radius: __PAN_UPPER_RADIUS, startAngle: CGFloat(2.0*Double.pi/2.0), endAngle: CGFloat(3.0*Double.pi/2.0), clockwise: false)
        
        /*
        //----
        CGContextRef context
        UIGraphicsBeginImageContext(CGSizeMake(__WIDTH+self.hintAdditionalWidth,
                                               __HEIGHT))
        context = UIGraphicsGetCurrentContext()
        
        CGContextTranslateCTM(context, 0.0, __HEIGHT)
        
        CGContextScaleCTM(context, 1.0, -1.0)
        
        CGContextAddPath(context, path)
        CGContextClip(context)
        */
        
        var context:CGContext?
        UIGraphicsBeginImageContext(CGSize(width: __WIDTH + hintAdditionalWidth,
                                           height: __HEIGHT))
        context = UIGraphicsGetCurrentContext()
        context!.translateBy(x: 0.0, y: __HEIGHT)
        context!.scaleBy(x: 1.0, y: -1.0)
        
        context!.addPath(path)
        context?.clip()
        
        /*
        //----
        CGRect frame = CGPathGetBoundingBox(path)
        CGColorRef backColor = [UIColor whiteColor].CGColor //todo enable code
    //    switch (self.appearance) {
    //        case ACKeyAppearanceDark:
    //            backColor = [ACDarkAppearance lightKeyColor].CGColor
    //            break
    //
    //        case ACKeyAppearanceLight:
    //            backColor = [ACLightAppearance lightKeyColor].CGColor
    //            break
    //
    //        default:
    //            break
    //    }
        
        CGContextSetFillColorWithColor(context, backColor)
        CGContextFillRect(context, frame)
        
        CGImageRef imageRef = CGBitmapContextCreateImage(context)
        
        UIImage * image = [UIImage imageWithCGImage:imageRef scale:[[UIScreen mainScreen] scale] orientation:UIImageOrientationDown]
        CGImageRelease(imageRef)
        
        UIGraphicsEndImageContext()
        
        CFRelease(path)
        
        return image
         
         
        */
        
        let frame:CGRect = path.boundingBox
        let backColor:CGColor = UIColor.white.cgColor
        
        
        context!.setFillColor(backColor)
        context!.fill(frame)
        let imageRef:CGImage = context!.makeImage()! //context!.bitmapInfo as! CGImage
        let image = UIImage.init(cgImage: imageRef, scale: UIScreen.main.scale, orientation: .down)
        context!.endPage()
        
     return image
    }
    
    func startShowHintTimer(){
        stopShowHintTimer()
        self.showHintTimer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(showKeyCapView), userInfo: nil, repeats: false)
    }
    
    func stopShowHintTimer(){
        showHintTimer?.invalidate()
    }
    
    @objc func hidePopup(){

        stopShowHintTimer()
        stopHideTimerPopup()
        self.viewWithTag(ACKEY_POPUP_VIEV_TAG)?.removeFromSuperview()
        for view in superview?.subviews ?? []{
            guard let keyModify:JHKeyPopup = view as? JHKeyPopup else {return}
            keyModify.hintView?.removeFromSuperview()
        }
    }
    
    func startHideTimerPopup(){
        stopHideTimerPopup()
        hidePopup()
    }
    
    func stopHideTimerPopup(){
        hidePopupTimer?.invalidate()
    }
    
    func updateState(){
        
    }
    
    func hideHintView(){
        hintView?.removeFromSuperview()
    }

    func imageWithColor(color:UIColor) -> UIImage {
        let rect = CGRect(x:0.0, y:0.0, width:1.0, height: 1.0)
        
        var context:CGContext?
        
        UIGraphicsBeginImageContext(rect.size)
        context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let imageRef:CGImage = context!.makeImage()!
        let image = UIImage.init(cgImage: imageRef, scale: UIScreen.main.scale, orientation: .up)
                context!.endPage()
        return image
    }
    
    //MARK:- Touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.clipsToBounds = false
        addPopupToButton(button: self)
        self.updateState()
        let time = Date().timeIntervalSince1970 * 1000.0  //([[NSDate date] timeIntervalSince1970] * 1000.0)
        print("time::\(time)")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
        super.touchesMoved(touches, with: event)
        guard let _hintButtons = self.hintButtons else{ return }
        
        let firstTouch:UITouch = touches.first!//MARK:- todo: check logic
        let leftHand:Bool = hintPosition == .ACHintPositionLeft || hintPosition == .ACHintPositionFarLeft
        
        let touchX:CGFloat = firstTouch.location(in: self.superview).x + (leftHand ? self.frame.size.width - self.frame.origin.x :self.hintView!.frame.size.width - self.frame.origin.x-2*self.frame.size.width)
        
        var rightButton:UIButton = _hintButtons.last!
        var leftButton :UIButton = _hintButtons.first!
        var array:[UIButton] = (self.hintButtons?.filter({$0.center.x < touchX}))!

        if array.count > 0{
            leftButton = array.last!
        }
        
        array = (self.hintButtons?.filter({$0.center.x > touchX}))!
        
        if array.count > 0{
            rightButton = array.first!
        }
        
        for button in self.hintButtons ?? []{
            button.isHighlighted = false
        }
        
        if touchX - leftButton.center.x < rightButton.center.x - touchX {
            leftButton.isHighlighted = true
        }else{
            rightButton.isHighlighted = true
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.clipsToBounds = true
        
        if let _hintButtons = hintButtons,_hintButtons.count > 0 {
            self.isHighlighted = false
            let array = self.hintButtons?.filter({$0.isHighlighted})
            
            for btn in _hintButtons {
                print("btn title:\(btn.isHighlighted)::\(btn.titleLabel!.text)")
            }
            
            if let _array = array, _array.count > 0 {
                let highlightedButton:UIButton = _array.first!
                if let _delegate = self.delegate2{
                    _delegate.didSelectHintButtonSwift(highlightedButton)
                    print("highlightedButton tap::\(highlightedButton.titleLabel!.text)")
                    //hideHintView()
                    isLongPressing = false
                }
                
                //Reset Hint Highlighted
                for btn in _hintButtons {
                    if highlightedButton.titleLabel!.text == btn.titleLabel!.text{
                        //[btn setHighlighted:NO]
                        btn.isHighlighted = false
                        break
                    }
                }
                
                //Set First Hint Highlighted
                if getIsRightHint() {
                    _hintButtons.last?.isHighlighted = true
                } else {
                    _hintButtons.first?.isHighlighted = true
                }
                
                //}
            }
            
            hideHintView()
     
        }else{
            print("button title::\(self.titleLabel!.text)")
        }

        startHideTimerPopup()
        updateState()
        
        let time = Date().timeIntervalSince1970 * 1000.0
        print("T end::\(time)")
        
        print("release long on::\(self.titleLabel!.text)")
        if let _delegate = self.delegate2{
            _delegate.didReleaseLongOnSwift(self)
        }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        startShowHintTimer()
        updateState()
        print("T cancel")
    }
}

//MARK:- keycap view show
/*
extension KeyboardView {
    func keyPopupOn(_ keyButton:UIButton) {
        if currentFontLetters.count <= 0 { return }
        
        let title = currentFontLetters[currentButtonIndex % currentFontLetters.count]
        if title == "C"{
            let jhKey = JHkey(type: .custom)
            jhKey.frame = keyButton.frame
            jhKey.tag   = keyButton.tag
            //jhKey.delegate2 = self
            jhKey.backgroundColor = .white
            jhKey.setTitle(title, for: .normal)
            jhKey.setTitleColor(kKeyboardTextColor, for: .normal)
            jhKey.setTitleShadowColor(kTextShadowColor, for: .normal)
            jhKey.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
            addSubview(jhKey)
            jhKey.clipsToBounds = true
            jhKey.layer.cornerRadius = 5.0
        }else{
            let jhKey = JHKeyPopup(frame: keyButton.frame)
            jhKey.frame = keyButton.frame
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
        }
    }
}

*/



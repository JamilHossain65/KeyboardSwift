//
//  KeyboardButton.swift
//  KeyboardExtension
//
//  Created by Jamil on 21/12/21.
//

import UIKit

class KeyboardButton: UIButton {
    
    var defaultBackgroundColor  : UIColor = kKeyButtonColor //.white
    var highlightBackgroundColor: UIColor = kHighlightColor //.white
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = isHighlighted ? highlightBackgroundColor : defaultBackgroundColor
    }
}


// MARK: - Private Methods
private extension KeyboardButton {
    func commonInit() {
        layer.cornerRadius = 5.0
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 0.0
        layer.shadowOpacity = 0.35
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 14)
    }
}

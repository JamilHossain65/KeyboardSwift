//
//  KeyboardView.swift
//  KeyboardSwift
//
//  Created by Jamil on 22/2/21.
//

import UIKit

class KeyboardView: UIView,UIInputViewAudioFeedback {
    //@property (strong) id<UITextDocumentProxy> textView;
    var textView:UITextDocumentProxy?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        if (self) {
//            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PMCustomKeyboard" owner:self options:nil];
//            [[nib objectAtIndex:0] setFrame:frame];
//            self = [nib objectAtIndex:0];
//        }
        
        Bundle.main.loadNibNamed("KeyboardView", owner: self, options: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

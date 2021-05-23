//
//  HomeViewController.swift
//  KeyboardSwift
//
//  Created by Jamil on 22/2/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = ""
        
        textView.layer.borderWidth  = 1.0
        textView.layer.cornerRadius = 8.0
        textView.layer.borderColor  = UIColor.lightGray.cgColor
        
        textView.becomeFirstResponder()
    }
}


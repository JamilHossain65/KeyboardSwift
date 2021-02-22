//
//  HomeViewController.swift
//  KeyboardSwift
//
//  Created by Jamil on 22/2/21.
//

import UIKit

class HomeViewController: UIViewController {

    //var IBOutlet textView:UITextView!;
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let keyboardView = KeyboardView()
        //keyboardView.delegate = self
        textView.becomeFirstResponder()
        view.addSubview(keyboardView)
    }
}


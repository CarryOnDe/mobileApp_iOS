//
//  HelpRequestDetailViewController.swift
//  Carry On
//
//  Created by Jonas on 21.03.20.
//  Copyright © 2020 Jonas. All rights reserved.
//

import UIKit

class HelpRequestDetailViewController: ViewController {
    
    
    @IBOutlet var testLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    var task: HelpRequestModel!

    
    override func viewDidLoad() {
        testLabel.text = task.title
        descriptionTextView.text = task.description
        descriptionTextView.textContainerInset = .zero
        descriptionTextView.textContainer.lineFragmentPadding = 0
        
        let backButton: UIBarButtonItem!
        
        if #available(iOS 13.0, *) {
            backButton = UIBarButtonItem(
                barButtonSystemItem: .close,
                target: self,
                action: #selector(dismissController)
            )
        } else {
            backButton = UIBarButtonItem(
                title: "Schließen",
                style: .plain,
                target: self,
                action: #selector(dismissController)
            )
        }
        

        
        navigationItem.rightBarButtonItem = backButton
        
    }
    
    @objc func dismissController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func adjustUITextViewHeight(arg : UITextView)
    {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }
    
}

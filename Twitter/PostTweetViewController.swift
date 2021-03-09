//
//  PostTweetViewController.swift
//  Twitter
//
//  Created by Nicholas Palermo on 3/2/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit
import RSKPlaceholderTextView

class PostTweetViewController: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextField.becomeFirstResponder()
        tweetTextField.placeholder = "What's happening?"

        tweetTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var tweetTextField: RSKPlaceholderTextView!
    
    
    
    @IBAction func cancelTweet(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Tweet(_ sender: Any) {
        if (!tweetTextField.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextField.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error: Tweet cannot be posted!")
                self.dismiss(animated: true, completion: nil)
            })
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

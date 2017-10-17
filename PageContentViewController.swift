//
//  PageContentViewController.swift
//  UIPageViewControllerDemo
//
//  Created by Murat Erkam Yalçın on 29.08.2017.
//  Copyright © 2017 Murat Erkam Yalçın. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {

    
    @IBOutlet weak var arabiaText: UITextView!
    @IBOutlet weak var contentText: UITextView!
    @IBOutlet weak var pageNumberLabel: UILabel!
    
    var pageIndex: Int = 0
    var strTitle: String!
    var strContent: String!
    var backgroundcolor: UIColor!
    var endPageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.view.backgroundColor = backgroundcolor
        arabiaText.text = strTitle
        contentText.text = strContent
        pageNumberLabel.text = "\(String(pageIndex+1)) / \(endPageIndex)"
       
        
       
    }

    

   

}

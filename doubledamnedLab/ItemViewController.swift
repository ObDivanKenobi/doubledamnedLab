//
//  ItemViewController.swift
//  doubledamnedLab
//
//  Created by Надежда on 25.01.17.
//  Copyright © 2017 swiftlab. All rights reserved.
//

import Foundation
import UIKit

class ItemViewController: UIViewController{
    
    @IBOutlet weak var back: UIBarButtonItem!
    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageTitle: String!;
    var image: UIImage!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        caption.text = imageTitle
        imageView.image = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

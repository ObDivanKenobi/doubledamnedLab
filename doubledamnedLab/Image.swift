//
//  Image.swift
//  doubledamnedLab
//
//  Created by Надежда on 24.01.17.
//  Copyright © 2017 swiftlab. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit


class RealmItem: Object {
    dynamic var ID : Int = -1
    dynamic var image : NSData! = nil
    dynamic var title : String = "Зачем! Зачем они заставляют нас открывать несуществующие объекты?"
}

class Item {
    var ID : Int
    var image : UIImage!
    var title : String
    
    init(id: Int, image: UIImage, title: String) {
        ID = id
        self.image = image
        self.title = title
    }
}

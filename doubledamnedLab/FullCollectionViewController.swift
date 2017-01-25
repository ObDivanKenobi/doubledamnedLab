//
//  ViewController.swift
//  lab
//
//  Created by Admin on 24.01.17.
//  Copyright © 2017 swiftlabs. All rights reserved.
//

import UIKit
import RealmSwift

class FullCollectionViewController: UIViewController, UICollectionViewDataSource {

    var data_source = try! Realm()
    var images : [Item] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var quit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        prepareData()
        images = getData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //so far we have just one section
        let count = images.count
        guard count == 0 else {
            return count
        }
        
        let messageEmpty : UILabel = UILabel(frame: collectionView.bounds)
        messageEmpty.text = "Писос."
        messageEmpty.textAlignment = NSTextAlignment.center
        messageEmpty.backgroundColor = collectionView.backgroundColor
        messageEmpty.textColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        messageEmpty.sizeToFit()
        
        collectionView.backgroundView = messageEmpty
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tmp = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath as IndexPath)
        let cell = tmp as! CustomCollectionViewCell
        let info = images[indexPath.row]
        cell.imageView.image = info.image//#imageLiteral(resourceName: "Le deBug")
        cell.title.text = info.title
        
        return cell
    }
    
    
    func prepareData() {
        try! data_source.write {
            data_source.deleteAll()
            
            for i in 1...30{
                let item = RealmItem()
                item.ID = i
                item.image = UIImagePNGRepresentation(#imageLiteral(resourceName: "Le deBug")) as NSData!
                item.title = "Image\(i)"
                
                data_source.add(item)
            }
        }
        
    }
    
    func getData() -> [Item] {
        var items: [Item] = []
        let dataset = data_source.objects(RealmItem.self)
        
        for item in dataset {
            let tmp_image = UIImage(data: item.image as! Data)
            
            let tmp = Item(id: item.ID, image: tmp_image!, title: item.title)
            items.append(tmp)
        }
        
        return items
    }
    
    @IBAction func quit(_ sender: Any) {
        exit(0)
    }

}


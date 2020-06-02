//
//  DetailVC.swift
//  UICollectionView
//
//  Created by yurik on 5/25/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var imageOutletDVC: UIImageView!
    @IBOutlet weak var labelOutletDVC: UILabel!
    
    var trackName = "" //свойство в которое передается название файла
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageOutletDVC.image = UIImage(named: trackName) //инициализируем аутлет новым свойством
        labelOutletDVC.text = trackName // инициализируем лабел новым свойством
        labelOutletDVC.numberOfLines = 0 // возможность переносить название на новую строку

    }
    


}

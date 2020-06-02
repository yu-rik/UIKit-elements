//
//  DetailVC.swift
//  ArtCover
//
//  Created by yurik on 5/24/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    // новое свойство в которое передается название файла
    var trackTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageOutlet.image = UIImage(named: trackTitle)
        titleLabel.text = trackTitle
        //возможность переноса на следующую строку
        titleLabel.numberOfLines = 0
    }
     
}

//
//  CollectionController.swift
//  UICollectionView
//
//  Created by yurik on 5/25/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Jacheyka" //идентификатор ячейки

class CollectionController: UICollectionViewController {
    //массив песен
    let arraySingers = ["Alberto Ruiz - 7 Elements (Original Mix)",
    "Dave Wincent - Red Eye (Original Mix)",
    "E-Spectro - End Station (Original Mix)",
    "Edna Ann - Phasma (Konstantin Yoodza Remix)",
    "Ilija Djokovic - Delusion (Original Mix)",
    "John Baptiste - Mycelium (Original Mix)",
    "Lane 8 - Fingerprint (Original Mix)",
    "Mac Vaughn - Pink Is My Favorite Color (Alex Stein Remix)",
    "Metodi Hristov, Gallya - Badmash (Original Mix)",
    "Veerus, Maxie Devine - Nightmare (Original Mix)"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

    //collectionView.indexPathsForSelectedItems

    // MARK: UICollectionViewDataSource

  


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arraySingers.count //возвращаем количество элементов массива
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Jacheyka", for: indexPath) as! JacheykaClass //приводим к классу JacheykaClass
        cell.imageOutlet.image = UIImage(named: arraySingers[indexPath.item])
    
        return cell
    }

    
    //передача данных с одного вида другому
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueDetail"{
           if let indexPath = self.collectionView.indexPathsForSelectedItems {
                let detailsVC = segue.destination as! DetailVC
          
            let index = indexPath[0] as IndexPath // приведение типа [IndexPath] к типу IndexPath
            detailsVC.trackName = arraySingers[index.row]
            
            }
       }
    }
}

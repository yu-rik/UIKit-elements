//
//  TableDetailController.swift
//  UIContainerView
//
//  Created by yurik on 5/26/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class TableDetailController: UITableViewController {
    
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

      

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arraySingers.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
        //присваивания изображений массиву
       cell.imageView?.image = UIImage(named: arraySingers[indexPath.row]) //так же названия графических элементов
       cell.textLabel?.text = arraySingers[indexPath.row]
       cell.textLabel?.numberOfLines = 0 // разрешаем переносить слова на строки

        return cell
    }
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //выравнивание высоты ячейки к 60
         return 60
     }
   
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //метод фиксирует выделенную строчку
//        //передача данных в родительский контроллер
//        //обращаемся к родительскому контейнеру
//        if let viewController = parent as? ViewController{ //извлекаем опционал
//
//            let trackTitle = arraySingers[0] //присваиваем константе значение текста из массива
//            viewController.labelOutlet.text = trackTitle// присваиваем trackTitle
//            viewController.imageOutlet.image = UIImage(named: trackTitle)        //присваиваем изображение по наименованию трека
//
//        }
//    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let viewController = parent as? ViewController {
            let trackTitle = arraySingers[indexPath.row]
            viewController.labelOutlet.text = trackTitle
            viewController.imageOutlet.image = UIImage(named: trackTitle)
        }
        
    }
   
}

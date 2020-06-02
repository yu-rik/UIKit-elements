//
//  TrackList.swift
//  ArtCover
//
//  Created by yurik on 5/24/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class TrackList: UITableViewController {
    
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

    // MARK: - Table view data source

    //метод возвращает количество секций используемых во ВьюКонтроллере
   /* override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

    //возвращает количество строк, которые будут использоваться в приложении
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
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow{ // константе присваеваем индекс выбранной строки
                let detailsVC = segue.destination as! DetailVC //экземпляр класса DetailVC
                detailsVC.trackTitle = arraySingers[indexPath.row] // свойству trackTitle класса DetailVC присваеваем название композиции(элемент массива arraySingers[indexPath.row]
                }
        }
    }
    

}

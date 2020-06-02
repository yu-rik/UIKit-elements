//
//  ViewController.swift
//  UIButtonAndUILabel
//
//  Created by yurik on 5/18/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//   var flag: Int = 0  // флаг для переключения значений одной кнопкой
    
    @IBOutlet weak var label: UILabel!   //outlet Label для доступа к свойствам label
    @IBOutlet weak var buttonOutlet: UIButton! //outlet Button для доступа к свойствам Button
    @IBOutlet var actionButtons: [UIButton]! //один outlet два двух кнопок (массив)
    
    override func viewDidLoad() { //метод viewDidLoad срабатывает при загрузке вида(экрана)
           super.viewDidLoad()
           label.isHidden = true // свойство которое скрывает label
           label.font = label.font.withSize(35) // свойство изменения высоты шифта label
           //label.textColor = UIColor.purple
           
           buttonOutlet.isHidden = true // свойство которое скрывает Button
        
           for button in actionButtons{  //цикл для назначения цвета двум кнопкам
               button.setTitleColor(.green, for: .normal)
               button.backgroundColor = .red
           }
           
        buttonOutlet.setTitle("Clear", for: UIControl.State.normal)  // свойство меняет название кнопки в обычном положении кнопки
           buttonOutlet.setTitleColor(.white, for: .normal) // свойство задает цвет текста названия кнопки в обычном положении
           buttonOutlet.backgroundColor = .red //свойство заливки кнопки
       }
    
    @IBAction func buttonAction(_ sender: UIButton) { //action Button для выполнения действий (здесь для всех кнопок один action)
        
       // label.isHidden = false //при нажатии на кнопку label появляется
       //********************************************  меняем label одной кнопкой
//        if flag == 0{
//        label.text = "Hello World"
//        flag = 1
//        }else if  flag == 1{
//            label.text = "World Hello"
//         flag = 0
//        }
        
        //***************************************** скрываем и отображаем label одной кнопкой, также меняем цвет и название кнопки
//        if label.isHidden{
//            label.isHidden = false
//            label.text = "Hello, world!!!"
//
//            buttonOutlet.setTitle("Clear", for: UIControl.State.normal)
//            buttonOutlet.setTitleColor(.red, for: .normal)
//            buttonOutlet.backgroundColor = .green
//        } else {
//            label.isHidden = true
//            buttonOutlet.setTitle("Кнопка", for: UIControl.State.normal)
//            buttonOutlet.setTitleColor(.green, for: .normal)
//            buttonOutlet.backgroundColor = .red
//        }
        label.isHidden = false // отображение label
        buttonOutlet.isHidden = false // отображение Button
        
        if sender.titleLabel?.text == "Action 1"{ // доступ к кнопке через название(title)
            label.text = "Hello, lion"  //задаем текст label
            label.textColor = UIColor.darkGray //задаем цвет label
        } else if sender.titleLabel?.text == "Action 2"{
            label.text = "Hello, tiger"
            label.textColor = UIColor.blue
        }else if sender.tag == 1{ // доступ к кнопке через tag (attributes inspector)
            label.isHidden = true
            buttonOutlet.isHidden = true
            //actionButtons[1].isHidden = true  //доступ к кнопке по индексу массива OutletLine
        }
        
    }
    
   


}


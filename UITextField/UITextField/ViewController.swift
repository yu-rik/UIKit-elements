//
//  ViewController.swift
//  UITextField
//
//  Created by yurik on 5/21/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var labelOutlet: UILabel!
    @IBOutlet weak var textfieldOutlet: UITextField!
    @IBOutlet weak var buttonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfieldOutlet.delegate = self
    }
   
//************************* блокировка клавиатуры на ввод цифр(варианты)
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if textField == textfieldOutlet{
//            let allowedCharcterSet = CharacterSet(charactersIn :"0123456789")
//            let charactrerSet = CharacterSet(charactersIn: string)
//            return allowedCharcterSet.isSuperset(of: charactrerSet)
//        }
//        return true
      //******------------------------------------------------------------
//        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
//
//
//          let components = string.components(separatedBy: inverseSet)
//
//
//          let filtered = components.joined(separator: "")
//          return string != filtered
     //****----------------------------------------------------------------
        
   // }
       // или return string != string.filter("0123456789".contains)}
   //*********************************************************************************
    
    
    @IBAction func buttonAction(_ sender: UIButton) {
        //проверка на заполненность текстовогополя
        guard textfieldOutlet.text?.isEmpty == false else {return}
        
        //проверка на введение цифр
        if Double(textfieldOutlet.text!) != nil { //преведение содержимого текстфилда к Double и задание условия
           
            //  создание окна уведомления
            let alert = UIAlertController(title: "Wrong format", message: "Enter your name", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OKK", style: .default, handler: nil)
           // let cancelAction = UIAlertAction(title: "cansel", style: .cancel, handler: nil)
            
            alert.addAction(okAction) // добавление кнопки к уведомлению
            //alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil) // метод вызывает предупреждение alert
            
            labelOutlet.text = "Name format is wrong"
            textfieldOutlet.text = nil
        }else {
            labelOutlet.text = textfieldOutlet.text
            textfieldOutlet.text = nil //очистка поля ввода
        }
       
    }
    
}


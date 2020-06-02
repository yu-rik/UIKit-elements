//
//  ViewController.swift
//  UITextView
//
//  Created by yurik on 5/23/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var constraintOutlet: NSLayoutConstraint!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textViewOutlet: UITextView!
    @IBOutlet weak var stepperOutlet: UIStepper!
    
    @IBOutlet weak var activityOutlet: UIActivityIndicatorView!

    @IBOutlet weak var progressOutlet: UIProgressView!
    //********************************************************************* didLoad Start*********************
    override func viewDidLoad() {
        super.viewDidLoad()
       //textViewOutlet.text = ""
        
        textViewOutlet.delegate = self
        
        textViewOutlet.isHidden = true // скрываем текст
        //textViewOutlet.alpha = 0 //устанавливаем прозрачность в "ноль"
        
        textViewOutlet.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)//меняем шрифт
        textViewOutlet.backgroundColor = self.view.backgroundColor // цвет фона текстВью - такой же как и самого Вью
        textViewOutlet.layer.cornerRadius = 10 // радиусы скгругления
       
    // значения и свойства степпера
        stepperOutlet.value = 17
        stepperOutlet.minimumValue = 10
        stepperOutlet.maximumValue = 25
        stepperOutlet.tintColor = .white
        stepperOutlet.backgroundColor = .gray
        
        //закругление рамок степпера
        stepperOutlet.layer.cornerRadius = 10
        
        //свойство АктивитиИндикатора
        activityOutlet.hidesWhenStopped = true //активатор активности исчезнет с экрана по завершению активности
        activityOutlet.color = #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1) //цвет
        activityOutlet.startAnimating() // запускаем активити, чтоб крутился
             //  UIApplication.shared.beginIgnoringInteractionEvents() //заморозка экрана
       
        progressOutlet.setProgress(0, animated: true)
        
        
       
        //наблюдает за оявлением клавиатуры
        NotificationCenter.default.addObserver(self,
        selector: #selector(updateTextView(notification:)),
        name: UIResponder.keyboardWillChangeFrameNotification,
        object: nil)
        //наблюдает за скрытие клавиатуры
          NotificationCenter.default.addObserver(self,
                                                     selector: #selector(updateTextView(notification:)),
                                                     name: UIResponder.keyboardWillHideNotification,
                                                     object: nil)
       
        //метод с которым появится текст и исчезнет АктивитиИндикатор
      /*  UIView.animate(withDuration: 0, delay: 10, options: .curveEaseIn,
                       animations: {self.textViewOutlet.alpha = 1},
                       completion: {(finished) in self.activityOutlet.stopAnimating()
            self.textViewOutlet.isHidden = false
          //  UIApplication.shared.endIgnoringInteractionEvents()  //остановка заморозки экрана
        })
        */
        //Таймер для увелечиния ПрогресВью
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
            if self.progressOutlet.progress != 1{
                self.progressOutlet.progress += 0.1
            }else {
                self.activityOutlet.stopAnimating()
                self.textViewOutlet.isHidden = false
                self.progressOutlet.isHidden = true
            }
        })
    }
//********************************************************************** didLoad End*********************
    
//метод скрытия клавиатуры
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
       // textViewOutlet.resignFirstResponder() // скрытие клавиатуры, вызванную для конкретного объекта
    }

    //поднятие текста над клавиатурой
    @objc func updateTextView(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: AnyObject],
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            else {return}
        if notification.name == UIResponder.keyboardWillHideNotification  {
            textViewOutlet.contentInset = UIEdgeInsets.zero
        } else {
            textViewOutlet.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height - constraintOutlet.constant, right: 0)
            textViewOutlet.scrollIndicatorInsets = textViewOutlet.contentInset
        }
        textViewOutlet.scrollRangeToVisible(textViewOutlet.selectedRange)
    }
    
    @IBAction func sizeFont(_ sender: UIStepper) {
        let font = textViewOutlet.font?.fontName //присваиваем значение теукщего шрифта
        let fontSize = CGFloat(sender.value)   //присваеваем размер шрифта равный значению степпера и приводим к типу CGFloat
        
        //присваивание шрифту новое значение
        textViewOutlet.font = UIFont(name: font!, size: fontSize)
    }
    
}
extension ViewController: UITextViewDelegate{ // срабатывает при тапе на ТекстВью
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = .white
        textView.textColor = .brown
         }
    
    func textViewDidEndEditing(_ textView: UITextView) { //срабатывает при окончании работы с ТекстВью
        textView.backgroundColor = self.view.backgroundColor
        textView.textColor = .black
    }
    
    //метод позволяетвводить определенное количество символов
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        countLabel.text = "\(textViewOutlet.text.count)"
        return textViewOutlet.text.count + (text.count - range.length)<=10
    }
}


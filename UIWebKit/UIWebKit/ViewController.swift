//
//  ViewController.swift
//  UIWebKit
//
//  Created by yurik on 5/26/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webOutlet: WKWebView!
    @IBOutlet weak var textFieldOutlet: UITextField!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    //------------------------------------------didLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldOutlet.delegate = self // назначение класса ViewController делегатом textFieldOutlet
        webOutlet.navigationDelegate = self // назначение класса ViewController делегатом webOutlet
        
        //домашняя страница для адресной строки
        let homePage = "https://www.google.com.ua"
        textFieldOutlet.text = homePage
        
        
        let urlAdres = URL(string: homePage) // константа адресса запроса(опционал)
        let request = URLRequest(url: urlAdres!) // URL запрос
        
        
        webOutlet.load(request) //метод который загружает URL запрос
        webOutlet.allowsBackForwardNavigationGestures = true
    }
//-----------------------------------------------------------
   
    @IBAction func forwardActionButton(_ sender: UIButton) {
        if webOutlet.canGoForward{ //если можно вернуться вперед
            webOutlet.goForward() // возвращаемся вперед
            
        }
    }
    @IBAction func backActionButton(_ sender: UIButton) {
        if webOutlet.canGoBack{//если можно вернуться назад
            webOutlet.goBack() //возвращаемся назад
        }
    }
    
}
extension ViewController : UITextFieldDelegate, WKNavigationDelegate{ //дополнительные протоколы
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { //возвращает данные из текстовой строки
        let urlUserEnter = textFieldOutlet.text! //переменная присваивания значения адресной строки
        let url = URL(string: urlUserEnter) //превращение значения в URL
        let request = URLRequest(url: url!) // передаем URL в запрос
        webOutlet.load(request) // метод аутлета выполняет запрос
        textFieldOutlet.resignFirstResponder() //при нажатии на return клавиатура скрывается
        
        return true
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        textFieldOutlet.text = webOutlet.url?.absoluteString //отображение адреса страницы в текстовом поле textFieldOutlet
        
        backButton.isEnabled = webOutlet.canGoBack //включение кнопок если canGoBack доступна
        forwardButton.isEnabled = webOutlet.canGoForward
    }
}

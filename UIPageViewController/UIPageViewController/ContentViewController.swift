//
//  ContentViewController.swift
//  UIPageViewController
//
//  Created by yurik on 5/26/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
   @IBOutlet weak var presentLabel: UILabel!
   @IBOutlet weak var emojiLabel: UILabel!
   @IBOutlet weak var pageControl: UIPageControl!
    //класс-шаблон для презентации, в классе не нужно присваивать значения аутлетам, это будет делать pageViewController, в зависимости на какой странице находимся(1,2,3)
    //для того чтоб можно было менять аутлеты в зависимости от положения страниц - нужно создать свойства
    var presentText = "" // передаем в нее текст презентации, в зависимости от того на какой странице находимся
    var emoji = ""
    var currentPage = 0 // номер текущей страницы
    var numbersOfPages = 0 //количество страниц
      
    override func viewDidLoad() {
        super.viewDidLoad()
        presentLabel.text = presentText
        emojiLabel.text = emoji
        pageControl.currentPage = currentPage
        pageControl.numberOfPages = numbersOfPages
        //pageController передает данные в переменные, а переменные присваиваем аутлетам
    }
    



}

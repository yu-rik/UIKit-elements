//
//  ViewController.swift
//  UISEgmControl
//
//  Created by yurik on 5/19/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var labelOutlet: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //labelOutlet.isHidden = true //скрываем label
        sliderOutlet.value = 1 // присваивание значения слайдеру
        labelOutlet.text = String(sliderOutlet.value) //label принимает значение бегунка
        
        
        labelOutlet.font = labelOutlet.font.withSize(25) //свойство label высота текста
        labelOutlet.textAlignment = .center //свойство label расположение текста
        labelOutlet.numberOfLines = 3 //свойство label количество строк  текста
        
        segmentedControl.insertSegment(withTitle: "Three", at: 2, animated: true) //свойство segmentControl дополнительная кнопка
        //настройка slider
        sliderOutlet.minimumValue = 0
        sliderOutlet.maximumValue = 1
        sliderOutlet.minimumTrackTintColor = .white
        sliderOutlet.maximumTrackTintColor = .red
        sliderOutlet.thumbTintColor = .blue
        
    }
    
    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        labelOutlet.isHidden = false //делаем видимым label
        
        switch segmentedControl.selectedSegmentIndex { //параметр для сравнения outlet segmentControla и есо свойство индекс
        case 0:
            labelOutlet.text = "The First segmented is selected" // задание текста labelу
            labelOutlet.textColor = .red //назначение label цвета
          case 1:
            labelOutlet.text = "The Second segmented is selected" // задание текста labelу
            labelOutlet.textColor = .darkGray
            case 2:
            labelOutlet.text = "The Third segmented is selected" // задание текста labelу
            labelOutlet.textColor = .blue
        default:
            print("Something wrong")
        }
       }
    
    @IBAction func sliderAction(_ sender: UISlider) {
       labelOutlet.text = String(sender.value) //label принимает значение бегунка при нажатии
        
        let backgroundColor = self.view.backgroundColor //константа принимает значение фона экрана
        self.view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(sender.value))// меняем цвет view и присваеваем значение с определенным свойством
    }
    

}


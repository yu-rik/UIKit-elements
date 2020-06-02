//
//  ViewController.swift
//  UIElements
//
//  Created by Debash on 07.05.2018.
//  Copyright © 2018 swiftbook.ru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var uiElements = ["UISegmentedControl",
                      "UILabel", "UISlider", "UITextField", "UIButton", "UIDatePicker", "LabelSwitch"]
    
    //свойство которому присваиваем выбранное значение ПикерВью
    var selectedElement: String?
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var datePickerOutlet: UIDatePicker!
    
    
    @IBOutlet weak var labelSwitch: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.value = 1
        
        label.text = String(slider.value)
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        
        choiceUIElement()
    }
    
    //метод который скрывает все элементы
    func hideAllElements(){
        segmentedControl.isHidden = true
        label.isHidden = true
        slider.isHidden = true
        datePickerOutlet.isHidden = true
        buttonOutlet.isHidden = true
    }
    
    //метод для вызова PickerView вместо клавиатуры
    func choiceUIElement(){
        let elementPicker = UIPickerView() //элемент класс ПикерВью
        elementPicker.delegate = self // назначение элементу делегата, для использования данных ПикерВью
        textField.inputView = elementPicker //  при нажатии на поле появится ПИкерВью
        
    }
    // кнопка для скрытия ПикерВью
    func createToolbar(){
        
    }
    
//описание для данных элементов смотри в других примерах
    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        
        label.isHidden = false
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            label.text = "The first segment is selected"
            label.textColor = .red
        case 1:
            label.text = "The second segment is selected"
            label.textColor = .blue
        case 2:
            label.text = "The third segment is selected"
            label.textColor = .yellow
        default:
            print("Sothing wrong!")
        }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        label.text = String(sender.value)
        
        let backgrandColor = self.view.backgroundColor
        self.view.backgroundColor = backgrandColor?.withAlphaComponent(CGFloat(sender.value))
    }
    
    
    @IBAction func donePressed(_ sender: UIButton) {
        
        guard textField.text?.isEmpty == false else { return }
        
        if let _ = Double(textField.text!) {
            
            let alert = UIAlertController(title: "Wrong format", message: "Please enter your name", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
            print("Name format is wrong")
            
        } else {
            
            label.text = textField.text
            textField.text = nil
        }
                
    }
    
    @IBAction func datePickerAction(_ sender: UIDatePicker) {
        // так не получиться label.text = String(sender.date) потому
        // создаем констату которая отображает формат даты и присваеваем ей экземпляр класса DateFormatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full //формат отображения даты
        dateFormatter.locale = Locale(identifier: "uk_UA")
        // присваеваем значение даты еще одной константе отформатированное в стринг-значение
        let dateValue = dateFormatter.string(from: sender.date)
        //так как dateValue теперь стринг его можно присвоить label
        label.text = dateValue
    }
    
    
    
    @IBAction func switchAction(_ sender: UISwitch) {
        // после перевода свича в положение ON все элемента интерфейса должны будут исчезнуть
        // обращаемся к outlet каждого элемента  и меняем его isHidden на противоположное
        segmentedControl.isHidden = !segmentedControl.isHidden
        label.isHidden = !label.isHidden
        slider.isHidden = !slider.isHidden
        textField.isHidden = !textField.isHidden
        datePickerOutlet.isHidden = !datePickerOutlet.isHidden
        buttonOutlet.isHidden = !buttonOutlet.isHidden
        if sender.isOn{
            labelSwitch.text = "Отобразить все элементы"
        }else {
            labelSwitch.text = "Скрыть все элементы"
        }
    }
    
}
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{ //подписывание класса ViewController на два протокола через расширение
    func numberOfComponents(in pickerView: UIPickerView) -> Int {// возвращаеи количество барабанов которые будут использоваться
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { // возвращает количество элементов которые будут доступны в ПикерВью, количество элементов массива
        return uiElements.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {// метод отображает в каждой строке ПикерВью определенное значение
        return uiElements[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) { // позволяет работать с выбранным элементом
        selectedElement = uiElements[row]
        textField.text = selectedElement
        
        switch row {
        case 0:
            hideAllElements()
            segmentedControl.isHidden = false
        case 1:
            hideAllElements()
            label.isHidden = false
        case 2:
            hideAllElements()
            slider.isHidden = false
        case 3:
            hideAllElements()
            textField.isHidden = false
        case 4:
            hideAllElements()
            buttonOutlet.isHidden = false
        case 5:
            hideAllElements()
            datePickerOutlet.isHidden = false
            
        default:
            hideAllElements()
        }
        
    }
    
    

}


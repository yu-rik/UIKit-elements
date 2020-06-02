//
//  PageViewController.swift
//  UIPageViewController
//
//  Created by yurik on 5/26/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
//массив для передачи текста каждой отдельной странице
    let presentArrayText = [
    "Первая страница чего-то там",
    "Вторая страница чего-то там",
    "Третья страница чего-то там",
    "Последняя страница чего-то там"
    ]
    
    //массив для передачи эмоджи каждой отдельной странице
    let emojiArray = ["👽", "🎃","💩","👁"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
dataSource = self
        if let contentViewController = showViewControllerAtIndex(0){
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    //метод который создает Вью(на основе шаблона) внутри PageControllera (отображаем его в методе didLoad)
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController?{
        guard index >= 0 else {return nil }
        guard index < presentArrayText.count else {return nil}
        guard let contentViewController = storyboard?.instantiateInitialViewController() as? ContentViewController else {return nil}
        contentViewController.presentText = presentArrayText[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numbersOfPages = presentArrayText.count
        
        return contentViewController
    }

}
extension PageViewController : UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber-=1
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber+=1
        return showViewControllerAtIndex(pageNumber)
    }
    
    
}

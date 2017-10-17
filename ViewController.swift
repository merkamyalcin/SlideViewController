//
//  ViewController.swift
//  UIPageViewControllerDemo
//
//  Created by Murat Erkam Yalçın on 29.08.2017.
//  Copyright © 2017 Murat Erkam Yalçın. All rights reserved.
//

import UIKit

var arrPageTitle: NSArray = NSArray()
var arrPageContent: NSArray = NSArray()



class ViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let pageContent: PageContentViewController = viewController as! PageContentViewController
        var index = pageContent.pageIndex
        
        if((index == 0) || (index == NSNotFound)){
            return nil
        }
        
        index -= 1
       
        return getViewControllerAtIndex(index: index)
        
    
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
       
        let pageContent: PageContentViewController = viewController as! PageContentViewController
        var index = pageContent.pageIndex
        
        if(index == NSNotFound){
            
            return nil
        }
        
        index += 1
        if(index==arrPageTitle.count){
           
            return nil
        }
        
        return getViewControllerAtIndex(index: index)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrPageTitle = ["1.Sayfa","2.Sayfa","3.Sayfa","4.Sayfa"]
        arrPageContent = ["Burası 1.Sayfa","Burası 2.Sayfa","Burası 3.Sayfa","Burası 4.Sayfa"]
        self.dataSource = self
        self.setViewControllers([getViewControllerAtIndex(index: 0)], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
       
    }

    func getViewControllerAtIndex(index: NSInteger) -> PageContentViewController{
        //Create a new view controller and pass suitable data.
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageContentViewController") as! PageContentViewController
        pageContentViewController.strContent = "\(arrPageContent[index])"
        pageContentViewController.strTitle = "\(arrPageTitle[index])"
        pageContentViewController.pageIndex = index
        pageContentViewController.backgroundcolor = getRandomColor()
        pageContentViewController.endPageIndex = arrPageContent.count
        return pageContentViewController

    }
    
    func getRandomColor() -> UIColor{
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
    }


}


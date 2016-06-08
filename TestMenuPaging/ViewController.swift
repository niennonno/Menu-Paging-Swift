//
//  ViewController.swift
//  TestMenuPaging
//
//  Created by Aditya Vikram Godawat on 08/06/16.
//  Copyright © 2016 Wow Labz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var sender = Int()
    
    var essayTitle = String()
    var essays = ["1. So Long Marianne!", "2. Eleanor"]
    var beforeEssay = String()
    var afterEssay = String()
    
    var pageNumber = CGFloat()
    var englishItems = [String]()
    var englishNotes = [String]()
    
    var mathItems = ["Math tips", "Math tips"]
    var mathNotes = [String]()
    
    var firstButton = UIButton()
    var secondButton = UIButton()
    
    var lineView = UIView()
    var tabView = UIView()
    
    var scrollView = UIScrollView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 45/255, green: 58/255, blue: 114/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.translucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.view.backgroundColor = UIColor.whiteColor()
        
        let aHeaderTitleSubtitleFrame: CGRect = CGRectMake(0, 0, 200, 44)
        let aHeaderTitleSubtitleView: UIView = UILabel(frame: aHeaderTitleSubtitleFrame)
        aHeaderTitleSubtitleView.backgroundColor = UIColor.clearColor()
        aHeaderTitleSubtitleView.autoresizesSubviews = false
        
        let aTitleFrame: CGRect = CGRectMake(-40, 10, 200, 24)
        let aTitleView: UILabel = UILabel(frame: aTitleFrame)
        aTitleView.backgroundColor = UIColor.clearColor()
        aTitleView.textAlignment = NSTextAlignment.Center
        aTitleView.textColor = UIColor.whiteColor()
        aTitleView.adjustsFontSizeToFitWidth = true
        aTitleView.text = "SAT Notes"
        aHeaderTitleSubtitleView.addSubview(aTitleView)
        self.navigationItem.titleView = aHeaderTitleSubtitleView
        
        // Setting up Custom Tab view on top of view
        
        tabView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 60))
        tabView.backgroundColor = UIColor(red: 45/255, green: 58/255, blue: 114/255, alpha: 1)
        self.view.addSubview(tabView)
        
        firstButton = UIButton(type: .Custom)
        firstButton.frame = CGRect(x: 0, y: 20, width: tabView.frame.size.width / 2, height: 30)
        firstButton.setTitle("ENGLISH", forState: .Normal)
        firstButton.setTitleColor(UIColor(red: 0/255, green: 191/255, blue: 165/255, alpha: 1.0), forState: .Normal)
        firstButton.addTarget(self, action: #selector(ViewController.firstButtonTapped), forControlEvents: .TouchUpInside)
        
        tabView.addSubview(firstButton)
        
        secondButton = UIButton(type: .Custom)
        secondButton.frame = CGRect(x: tabView.frame.size.width / 2, y: 20, width: tabView.frame.size.width / 2, height: 30)
        secondButton.setTitle("MATHEMATICS", forState: .Normal)
        secondButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        secondButton.addTarget(self, action: #selector(ViewController.secondButtonTapped), forControlEvents: .TouchUpInside)
        
        tabView.addSubview(secondButton)
        print("Y'all")
        // Setting Up Selected Line View for Buttons
        
        
        lineView = UIView()
        lineView.frame = CGRect(x: 0, y: CGRectGetMaxY(tabView.frame) - 3, width: tabView.frame.size.width / 2, height: 3)
        lineView.backgroundColor = UIColor(red: 0/255, green: 191/255, blue: 165/255, alpha: 1.0)
        
        tabView.addSubview(lineView)
        
        self.scrollView.frame = CGRectMake(0, CGRectGetMaxY(tabView.frame), self.view.frame.width, self.view.frame.height)
        self.scrollView.backgroundColor = UIColor.whiteColor()
        self.scrollView.delegate = self
        self.scrollView.pagingEnabled = true
        
        self.view.addSubview(self.scrollView)
        
        let aScrollViewWidth = self.scrollView.frame.width
        let aScrollViewHeight = self.scrollView.frame.height
        self.scrollView.contentSize = CGSizeMake(aScrollViewWidth * CGFloat(2), aScrollViewHeight)
        
        for anIndex in 0  ..< 2  {
            
            let anEssayTextView = UITextView(frame: CGRectMake(aScrollViewWidth * CGFloat(anIndex), 0, aScrollViewWidth, aScrollViewHeight))
            anEssayTextView.text = essays[anIndex]
            anEssayTextView.editable = false
            self.scrollView.addSubview(anEssayTextView)
            
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 45/255, green: 58/255, blue: 114/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.translucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        
        if (pageNumber == 0) {
            firstButtonTapped()
        } else {
            secondButtonTapped()
        }
        
    }
    func firstButtonTapped() {
        
        firstButton.setTitleColor(UIColor(red: 0/255, green: 191/255, blue: 165/255, alpha: 1.0), forState: .Normal)
        secondButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        if (self.lineView.frame.origin.x != 0) {
            
            UIView.animateWithDuration(0.25) {
                
                self.lineView.frame.origin.x -= self.tabView.frame.size.width / 2
                
            }
            
        }
        
        scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
        
        pageNumber = 0
        
    }
    
    
    func secondButtonTapped() {
        
        firstButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        secondButton.setTitleColor(UIColor(red: 0/255, green: 191/255, blue: 165/255, alpha: 1.0), forState: .Normal)
        
        if (self.lineView.frame.origin.x != self.tabView.frame.size.width / 2) {
            
            UIView.animateWithDuration(0.25) {
                
                self.lineView.frame.origin.x += self.tabView.frame.size.width / 2
                
            }
            
        }
        
        scrollView.setContentOffset(CGPointMake(self.scrollView.frame.size.width, 0), animated: true)
        
        pageNumber = 1
        
    }
    
}


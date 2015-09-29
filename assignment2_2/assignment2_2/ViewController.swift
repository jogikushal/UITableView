//
//  ViewController.swift
//  assignment2_2
//
//  Created by Kushal Jogi on 9/26/15.
//  Copyright (c) 2015 Kushal Jogi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var location = CGPoint(x: 0, y: 0)
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var swipeLabel: UILabel!
    @IBOutlet weak var myBase: UIImageView!
    var n : Int = 1
    var selectedView:UIView?
    var getBack = CGPoint(x:0, y:0)
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        var touch : UITouch! = touches.first as! UITouch
    //    selectedView = touches.first as? UIView
    //    var a: UIImageView! = touches.first as! UIImageView
        location = touch.locationInView(self.myView)
        for subUIView in myView.subviews as! [UIView] {
            if (subUIView.tag == n){
                subUIView.center = location
            }
            
        }
         
        
       // a.center = location
        
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        var touch : UITouch! = touches.first as! UITouch
        
        location = touch.locationInView(self.view)
        
        for subUIView in myView.subviews as! [UIView] {
            if (subUIView.tag == n){
                subUIView.center = location
            }
            
        }

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showCards(myView, currentView: myBase)
        
        
        var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        var rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        var upSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        var downSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        upSwipe.direction = .Up
        downSwipe.direction = .Down
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(upSwipe)
        view.addGestureRecognizer(downSwipe)
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Left) {
            swipeLabel.text = "Left"
            for subUIView in myView.subviews as! [UIView] {
                if (subUIView.tag == n){
                    n--
                    subUIView.removeFromSuperview()
                }
                
            }
        }
        if (sender.direction == .Right) {
            swipeLabel.text = "Right"
            for subUIView in myView.subviews as! [UIView] {
                if (subUIView.tag == n){
                    n--
                    subUIView.removeFromSuperview()
                }
                
            }

        }
        if (sender.direction == .Up) {
            swipeLabel.text = "Up"
            for subUIView in myView.subviews as! [UIView] {
                if (subUIView.tag == n){
                    subUIView.center = getBack
                }
                
            }
            
        }
        if (sender.direction == .Down) {
            swipeLabel.text = "Down"
            for subUIView in myView.subviews as! [UIView] {
                if (subUIView.tag == n){
                    subUIView.center = getBack
                }
                
            }
        }
    }
    
    func showCards(parentView : UIView, currentView :UIView){
        var xoffSet : CGFloat = 0
        var yoffSet : CGFloat = 0
        var currentStart = currentView.frame.size
       // xoffSet = CGFloat(15)
         xoffSet = 0
        //    yoffSet = CGFloat(25)
        var j = 0
        var width1 = currentStart.width
        var height1 = currentStart.height
        var x = currentView.frame.origin.x
        var y = currentView.frame.origin.y
        
        let helper = ViewControllerHelper()
        //if(addAllCards){
        currentView == myBase
        getBack = currentView.center
        for i in 2...4{
                
            let newCardView : UIView = helper.createCardSubView(x + (CGFloat(j++)*xoffSet) , y:y,width:width1,height:height1,imageName : "\(i)")
            parentView.addSubview(newCardView)
            n++
            newCardView.tag = n
            
            }
        
        }
    
}

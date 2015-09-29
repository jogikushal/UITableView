
//
//  subViewMaker.swift
//  assignment2_2
//
//  Created by Kushal Jogi on 9/26/15.
//  Copyright (c) 2015 Kushal Jogi. All rights reserved.
//

import UIKit
import AVFoundation


class ViewControllerHelper: UIView {
    
   

    
    func createCardSubView(x : CGFloat , y : CGFloat , width : CGFloat , height : CGFloat , imageName : String) -> UIView {
        let testFrame : CGRect = CGRectMake(x,y,width,height)
        var testView : UIView = UIView(frame: testFrame)
        var image = UIImage(named: imageName)
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
            image = imageWithImage(image!, scaledToSize: CGSize(width: 120 , height: 180))
        }
        let imageView = UIImageView(image: image)
        testView.addSubview(imageView)
        return testView
    }
    
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        var newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
}

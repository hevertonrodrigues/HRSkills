//
//  HRLoader.swift
//  HRSkills
//
//  Created by Heverton Rodrigues on 07/10/14.
//  Copyright (c) 2014 Heverton Rodrigues. All rights reserved.
//
import Foundation
import UIKit

/**
* HRLoader
*
* @package    HRSkills/Util
* @author     Heverton Rodrigues
* @since      2014-10-07
* @version    1.1
*/
class HRLoader: UIImageView
{
    /**
    * Override Constructor to insert loader
    *
    * @param frame :CGRect
    */
    override init(frame: CGRect) {
        
        let w :Float = Float( frame.size.width )
        let h :Float = Float( frame.size.height )
        
        let r :Float = Float( w / 5 )
        let left :Float = Float( ( w / 2 ) - ( r / 2 ) )
        let top :Float = Float( ( h / 2 ) - ( r / 2 ) )
        
        super.init(frame: CGRectMake( CGFloat(left), CGFloat(top), CGFloat(r), CGFloat(r) ) )
        
        self.image = UIImage(named: "loader")
        self.rotateImage()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
    * Function remove loader from center if to full screen
    *
    * @param nil
    * @return nil
    */
    func isMain()
    {
        self.frame = CGRectMake( self.frame.origin.x, self.frame.origin.y + 100, self.frame.size.width, self.frame.size.height )
    }
    
    /**
    * Function to animate image to loader
    *
    * @param nil
    * @return nil
    */
    func rotateImage()
    {
        var rotationAnimation :CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = M_PI * 2
        rotationAnimation.duration = 1
        rotationAnimation.cumulative = true
        rotationAnimation.repeatCount = MAXFLOAT
        self.layer.addAnimation( rotationAnimation, forKey: "rotationAnimation" )
    }

    
//    private func vectorLoader()
//    {
//        let ovalPath :UIBezierPath = UIBezierPath(ovalInRect: CGRectMake(0, 0, 100, 100))
//        UIColor.clearColor().setFill()
//        ovalPath.fill()
//        UIColor(rgba: "5DB949").setStroke()
//        ovalPath.lineWidth = 10
//        ovalPath.setLineDash([3,3,3,3], count: 4, phase: 0)
//        ovalPath.stroke()
//        
//        let shapeView :CAShapeLayer = CAShapeLayer()
//        shapeView.path = ovalPath.CGPath
//        loader.layer.addSublayer(shapeView)
//        self.addSubview(loader)
//    }
}
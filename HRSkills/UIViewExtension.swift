//
//  UIViewEtension.swift
//  HRSkills
//
//  Created by Heverton Rodrigues on 16/11/14.
//  Copyright (c) 2014 Heverton Rodrigues. All rights reserved.
//
import UIKit

/**
* String Extension
*
* @package    HRSkills/Extesions
* @author     Heverton Rodrigues
* @since      2014-09-16
* @version    1.0
*/
extension UIView
{  
    /**
    * Function to get only numbers
    *
    * @param decimal: Bool -> Default = false
    * @return only numbers STRING
    */
    func lock()
    {
        if let lockView = viewWithTag(1){} else
        {
            let lockView = UIView(frame: bounds)
            lockView.backgroundColor = UIColor(white: 0.0, alpha: 0.75)
            lockView.tag = 1
            lockView.alpha = 0.0
            let activity = UIActivityIndicatorView(activityIndicatorStyle: .White)
            activity.hidesWhenStopped = true
            activity.center = lockView.center
            lockView.addSubview(activity)
            activity.startAnimating()
            addSubview(lockView)

            UIView.animateWithDuration(0.2)
            {
                lockView.alpha = 1.0
            }
        }
    }

    func unlock()
    {
        if let lockView = self.viewWithTag(1)
        {
            UIView.animateWithDuration(0.2, animations:
                {
                    lockView.alpha = 0.0
                }){ finished in
                    lockView.removeFromSuperview()
                }
        }
    }

    class func viewFromNibName(name: String) -> UIView?
    {
        let views = NSBundle.mainBundle().loadNibNamed(name, owner: nil, options: nil)
        return views.first as? UIView
    }
}
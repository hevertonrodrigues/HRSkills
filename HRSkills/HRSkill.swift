//
//  HRSkill.swift
//  HRSkills
//
//  Created by Heverton Rodrigues on 20/09/14.
//  Copyright (c) 2014 Heverton Rodrigues. All rights reserved.
//
import SystemConfiguration
import Foundation

/**
* HRSkill
*
* @package    HRSkills/Util
* @author     Heverton Rodrigues
* @since      2014-09-20
* @version    1.0
*/
class HRSkill
{
    
    /**
    * Static Function to check if iOS is 8
    *
    * @param nil
    * @return Bool
    */
    class func ios8() -> Bool
    {
        if ( NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1 )
        {
            return false
        } else {
            return true
        }
    }
    
    /**
    * Static Function to check if has network
    *
    * @param nil
    * @return Bool
    */
    class func hasNetwork() -> Bool
    {
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0)).takeRetainedValue()
        }
        
        var flags: SCNetworkReachabilityFlags = 0
        if SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) == 0
        {
            return false
        }
        
        let isReachable = (flags & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        
        return (isReachable && !needsConnection) ? true : false
    }
    
}
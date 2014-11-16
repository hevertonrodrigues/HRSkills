//
//  StringExtension.swift
//  HRSkills
//
//  Created by Heverton Rodrigues on 16/09/14.
//  Copyright (c) 2014 Heverton Rodrigues. All rights reserved.
//
import Foundation

/**
* String Extension
*
* @package    HRSkills/Extesions
* @author     Heverton Rodrigues
* @since      2014-09-16
* @version    1.0
*/
extension String
{
    // #MARK: Variables
    
    var isNumeric :Bool {
        return (self as NSString).rangeOfCharacterFromSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet).location == NSNotFound
    }
    
    var isEmail :Bool {
        // #TODO: Check if email
        return true
    }
    
    var length :Int {
        return countElements( self )
    }

    
    // #MARK: Functions
    
    /**
    * Function to get only numbers
    *
    * @param decimal: Bool -> Default = false
    * @return only numbers STRING
    */
    func numbers( decimal :Bool = false ) -> String
    {
        var result :String = String()
        var accepted  :String = "1234567890"
        
        if decimal
        {
            accepted += "."
        }
        
        for n in self
        {
            if let accept = accepted.rangeOfString( String( n ) )?.startIndex
            {
                result += String(n)
            }
        }
        return result
    }

    
    /**
    * Function to remoce unknown chars
    *
    * @param nil
    * @return clean STRING
    */
    func removeUnknownChars() -> String
    {
        var result :String = String()

        let accepted  :String = "abcdefghijklmnopqrstuvxywzABCDEFHGIJKLMNOPQRSTUVCYWZ1234567890ÄÅÁÂÀÃäáâàãÉÊËÈéêëèÍÎÏÌíîïìÖÓÔÒÕöóôòõÜÚÛüúûùÇçÑñ "
        
        for letter in self
        {
            if let accept = accepted.rangeOfString( String( letter ) )?.startIndex
            {
                result += String(letter)
            }
        }
        return result
    }

    
    /**
    * Functin to create SLUG by String
    *
    * @param replace: String -> Default = "-"
    * @return clean STRING
    */
    func slugfy( replace :String = "-" ) -> String
    {
        var result :String = String()

        let accents   :String = "ÄÅÁÂÀÃäáâàãÉÊËÈéêëèÍÎÏÌíîïìÖÓÔÒÕöóôòõÜÚÛüúûùÇçÑñ"
        let noaccents :String = "aaaaaaaaaaaeeeeeeeeiiiiiiiioooooooooouuuuuuuccnn"
        let accepted  :String = "abcdefghijklmnopqrstuvxywz1234567890"

        for letter in self.lowercaseString
        {
            if let accept = accepted.rangeOfString( String( letter ) )?.startIndex
            {
                result += String(letter)
            } else if let pos = accents.rangeOfString( String( letter ) )?.startIndex
            {
                result += String(noaccents[pos])
            } else if letter == " " {
                result += replace
            }
        }
        return result
    }
    
    /**
    * Function to remove extra white spaces
    *
    * @param nil
    * @return clean STRING
    */
    func trim() -> String
    {
        return self.stringByTrimmingCharactersInSet(.whitespaceAndNewlineCharacterSet())
    }
    
    /**
    * Function to cut string
    *
    * @param location: Int, length: Int
    * @return cut STRING
    */
    func substring(location:Int, length:Int) -> String!
    {
        return (self as NSString).substringWithRange(NSMakeRange(location, length))
    }
    
    /**
    * Function return position of contained other string
    *
    * @param other: String
    * @return INT position
    */
    func location(other: String) -> Int
    {
        return (self as NSString).rangeOfString(other).location
    }
    
    /**
    * Function check if a string contains another
    *
    * @param other: String
    * @return BOOL if contains
    */
    func contains(other: String) -> Bool
    {
        return (self as NSString).containsString(other)
    }
    
    /**
    * Subscript to return character from position
    *
    * @param index: Int
    * @return pos String
    */
    subscript(index: Int) -> String! {
        get {
            return self.substring(index, length: 1)
        }
    }
}
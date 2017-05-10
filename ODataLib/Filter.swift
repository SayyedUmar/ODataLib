//
//  Filter.swift
//  ODataLib
//
//  Created by Celusion on 5/10/17.
//  Copyright © 2017 Celusion. All rights reserved.
//

import Foundation
public class Filter {
    
    public init (){
        
    }
   
    var filterUrl = "&$filter="
    public func buildUrl() -> String{
        return filterUrl
    }
    
    public func or () {
        filterUrl += " or "
    }
    
    public func and () {
        filterUrl += " and "
    }
    
    public func not () {
        filterUrl += " not "
    }
    
    
    
    
    public func typeCheck (propertyName:String, op:String, value:AnyObject) {
        if let str = value as? String {
            filterUrl += (propertyName + " "  + op + " '" + str + "' ")
        } else if let str = value as? Float {
            filterUrl += (propertyName + " " + op + " \(str) ")
        } else if let str = value as? Int {
            filterUrl += (propertyName + " " + op + " \(str) ")
        } else if let str = value as? Double {
            filterUrl += (propertyName + " " + op + " \(str) ")
        }
    }
    
    public func filterBy (propertyName:String, op: OP, value:AnyObject)  {
        typeCheck(propertyName: propertyName, op: op.rawValue, value: value)
    }
    
    public func equals (propertyName:String, value:AnyObject)  {
        typeCheck(propertyName: propertyName, op: OP.EqaulTo.rawValue, value: value)
    }
    
    
    public func notEqual (propertyName:String, value:AnyObject)  {
        typeCheck(propertyName: propertyName, op: OP.NotEqualTo.rawValue, value: value)
    }
    
    public func greaterThan (propertyName:String, value:AnyObject)  {
        //        filterUrl += (propertyName  + OP.GreaterThan.rawValue + "'" + value + "' ")
        typeCheck(propertyName: propertyName, op: OP.GreaterThan.rawValue, value: value)
    }
    
    public func greaterThanEqualTo (propertyName:String, value:AnyObject)  {
        typeCheck(propertyName: propertyName, op: OP.GreaterThanOrEqualTo.rawValue, value: value)
    }
    
    public func lessThan (propertyName:String, value:AnyObject)  {
        typeCheck(propertyName: propertyName, op: OP.LessThan.rawValue, value: value)
    }
    
    func lessThanEqualTo (propertyName:String, value:AnyObject)  {
        typeCheck(propertyName: propertyName, op: OP.LessThanOrEqualTo.rawValue, value: value)
    }
    
    
    
    public func startsWith(propertyName:String, value:String)  {
        filterUrl += ("startswith(" + propertyName + ",'" + value + "') ")
    }
    
    public func notStartsWith(propertyName:String, value:String) {
        filterUrl += ("not startswith(" + propertyName + ",'" + value + "') ")
    }
    
    public func endsWith(propertyName:String, value:String) {
        filterUrl += ("endswith(" + propertyName + ",'" + value + "') ")
    }
    
    public func notEndsWith(propertyName:String, value:String) {
        filterUrl += ( "not endswith(" + propertyName + ",'" + value + "') ")
    }
    
    public func toLower(propertyName:String) -> String {
        return "tolower(" + propertyName + ") "
    }
    
    public func toUpper(propertyName:String) -> String {
        return "toupper(" + propertyName + ") "
    }
    
    public func trim(propertyName:String) -> String {
        return "trim(" + propertyName + ") "
    }
    
    public func substring(propertyName:String, indexTo:Int) -> String {
        return "substring(" + propertyName + ") "
    }
    
    public func contains(propertyName:String, checkFor:String) -> String {
        return "contains(" + propertyName + ",'" + checkFor + "') "
    }
    
    public func substring(propertyName:String, searchStartIndex:Int) -> String {
        return "substring(" + propertyName + ",\(searchStartIndex)) "
    }
    
    public func substring(propertyName:String, searchStartIndex:Int, searchEndIndex:Int) -> String {
        return "substring(" + propertyName + ",\(searchStartIndex),\(searchEndIndex)) "
    }
}

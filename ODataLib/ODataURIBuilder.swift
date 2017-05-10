//
//  ODataURIBuilder.swift
//  TestingODataLib
//
//  Created by Celusion on 5/9/17.
//  Copyright © 2017 Celusion. All rights reserved.
//
import Foundation
public class ODataURIBuilder {

    let SERVICE_ROOT = "http://180.151.160.124:8090/NewAPI/"
    var url = ""
    let SLASH = "/"
    
    public init ( ) {
        
    }

    public func get (entity:String) {
        url = SERVICE_ROOT + "" + entity + "?"
    }
    
    private func byId (id:Int32) {
        url = url + "(" + String(id) + ")"
    }
    
    public func get(entity:String,withID id:Int32) {
        get(entity:entity)
        byId(id: id)
    }
    
    public func getCountAll () {
        url = url + SLASH + "$count";
    }

    public func filter(by filterURL: String) {
        
        url += filterURL
    }
    
    public func select(propertyNames: String...) {
        
        var selectURL = "&$select="
        for prop in propertyNames {
            selectURL += prop + ","
        }
        
        url += selectURL
    }
    
    public func expand(propertyNames: String...) {
        
        var selectURL = "&$expand="
        for prop in propertyNames {
            selectURL += prop + ","
        }
        
        url += selectURL
    }
    
    public func top(records:Int32) {
        let orderbyURL = "&$top=\(records)"
        url += orderbyURL
    }
    
    public func skip(records:Int32) {
        let orderbyURL = "&$skip=\(records)"
        url += orderbyURL
    }
    
    public func orderBy(propertyNames: String...) {
        
        var orderbyURL = "&$orderby="
        for prop in propertyNames {
            orderbyURL += prop + ","
        }
        
        url += orderbyURL
    }
    
    public func buildUrl () -> String {
        let allowedCharacterSet = (CharacterSet(charactersIn: "' ").inverted)
        url = url.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)!
        return url
    }
    
    public func buildUrl (usingFilterUrl filterURL:String) -> String {
        url += filterURL
        let allowedCharacterSet = (CharacterSet(charactersIn: "' ").inverted)
        url = url.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)!
        return url
    }
    
}

public enum OP:String {
    case EqaulTo = "eq"
    case NotEqualTo = "ne"
    case GreaterThan = "gt"
    case GreaterThanOrEqualTo = "ge"
    case LessThan = "lt"
    case LessThanOrEqualTo = "le"
//    case StartsWith = "startswith"
//    case EndsWith = "endswith"
//    case NotEndsWith = "not endswith"
//    case NotStartsWith = "not startswith"
    case OR = "or"
    case AND = "and"
    case NOT = "not"
//    case Has = "has"
    
    var description: String {
        return self.rawValue
    }

}



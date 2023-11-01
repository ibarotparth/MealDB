//
//  EndPointType.swift
//  MealDB
//
//  Created by csuftitan on 10/28/23.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointType {
    var path: String { get }
    var baseURL: String { get }
    var url: String { get }
    var method: HTTPMethods { get }
}

enum EndPointItems {
    case desserts
    case lookup(id: String)
}

extension EndPointItems: EndPointType {
    var path: String {
        switch self {
        case .desserts:
            return "api/json/v1/1/filter.php?c=Dessert"
        case .lookup(id: let id):
            return "api/json/v1/1/lookup.php?i=\(id)"
        }
    }
    
    var baseURL: String {
        return "https://themealdb.com/"
    }
    
    var url: String {
        return "\(baseURL)\(path)"
    }
    
    var method: HTTPMethods {
        switch self {
        case .desserts:
            return .get
        case .lookup:
            return .get
        }
    }
    
}

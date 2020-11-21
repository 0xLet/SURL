//
//  String+.swift
//  
//
//  Created by Zach Eriksen on 11/20/20.
//

import Foundation

public extension String {
    var url: URL? {
        URL(string: self)
    }
}

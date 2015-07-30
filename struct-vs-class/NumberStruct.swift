//
//  DateStruct.swift
//  struct-vs-class
//
//  Created by Mark Aron Szulyovszky on 30/07/2015.
//  Copyright (c) 2015 Mark Aron Szulyovszky. All rights reserved.
//

import Foundation


struct NumberStruct: Comparable {
  
  var index: Int?
  var number: Int?
  var text: String?
  
}

func ==(lhs: NumberStruct, rhs: NumberStruct) -> Bool {
  return lhs.index == rhs.index
}

func <=(lhs: NumberStruct, rhs: NumberStruct) -> Bool {
  return lhs.index <= rhs.index
}

func <(lhs: NumberStruct, rhs: NumberStruct) -> Bool {
  return lhs.index < rhs.index
}

func >=(lhs: NumberStruct, rhs: NumberStruct) -> Bool {
  return lhs.index >= rhs.index
}

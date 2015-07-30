//
//  Test.swift
//  struct-vs-class
//
//  Created by Mark Aron Szulyovszky on 30/07/2015.
//  Copyright (c) 2015 Mark Aron Szulyovszky. All rights reserved.
//

import Foundation

struct Test {
  
  typealias TimeElapsed = Double
  
  enum ArrayOperation {
    case InsertAtBeginning
    case Append
  }
  
  
  static func measureCreatingStructs(#size: Int, method: ArrayOperation) -> (array: [NumberStruct], time: TimeElapsed) {
    var structs = [NumberStruct]()
    var measure = Measure()
    
    for index in 1...size {
      var number = NumberStruct()
      number.index = index
      number.number = index
      number.text = "\(index)"
      
      switch method {
      case .Append:
        structs.append(number)
      case .InsertAtBeginning:
        structs.insert(number, atIndex: 0)
      }
    }
    
    return (structs, measure.finish())
  }
  
  
  
  static func measureCreatingClasses(#size: Int, method: ArrayOperation) -> (array: [NumberClass], time: TimeElapsed) {
    var classes = [NumberClass]()
    var measure = Measure()
    
    for index in 1...size {
      var number = NumberClass()
      number.index = index
      number.number = index
      number.text = "\(index)"
      switch method {
      case .Append:
        classes.append(number)
      case .InsertAtBeginning:
        classes.insert(number, atIndex: 0)
      }
    }
    return (classes, measure.finish())
  }
  
  
  static func measureSort<T: Comparable>(array: [T]) -> (array: [T], time: TimeElapsed) {
    
    var measure = Measure()
    var sorted = array.sorted { $0 > $1 }
    return (sorted, measure.finish())
  }
  
}
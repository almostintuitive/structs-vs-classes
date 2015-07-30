//
//  Measure.swift
//  struct-vs-class
//
//  Created by Mark Aron Szulyovszky on 30/07/2015.
//  Copyright (c) 2015 Mark Aron Szulyovszky. All rights reserved.
//

import Foundation

func measure(title: String, block: (() -> ()) -> ()) {
  
  let startTime = CFAbsoluteTimeGetCurrent()
  
  block {
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    println("\(title):: Time: \(timeElapsed)")
  }
}


class Measure {
  
  var startTime: CFAbsoluteTime
  
  init() {
    self.startTime = CFAbsoluteTimeGetCurrent()
  }
  
  func finish() -> Double {
    return CFAbsoluteTimeGetCurrent() - startTime
  }
  
}
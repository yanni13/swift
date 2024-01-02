//
//  Stopwatch.swift
//  stopwatch
//
//  Created by 아우신얀 on 2023/09/14.
//

import Foundation

class Stopwatch: NSObject {
  var counter: Double
  var timer: Timer
  
  override init() {
    counter = 0.0
    timer = Timer()
  }
}

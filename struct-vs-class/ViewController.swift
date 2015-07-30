//
//  ViewController.swift
//  struct-vs-class
//
//  Created by Mark Aron Szulyovszky on 30/07/2015.
//  Copyright (c) 2015 Mark Aron Szulyovszky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var results = [TestResult]() {
    didSet {
      tableView.reloadData()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let size = 50000
    
    let resultStructInsert = Test.measureCreatingStructs(size: size, method: Test.ArrayOperation.InsertAtBeginning)
    results.append(TestResult(name: "STRUCTS: Creating an array (\(size) items) by inserting items at zero index", result: resultStructInsert.time))
    
    let resultStructAppend = Test.measureCreatingStructs(size: size, method: Test.ArrayOperation.Append)
    results.append(TestResult(name: "STRUCTS: Create array (\(size) items) of classes by appending items", result: resultStructAppend.time))

    let resultStructSort = Test.measureSort(resultStructAppend.array)
    results.append(TestResult(name: "STRUCTS: Sorting", result: resultStructSort.time))


    
    let resultClassInsert = Test.measureCreatingClasses(size: size, method: Test.ArrayOperation.InsertAtBeginning)
    results.append(TestResult(name: "CLASSES: Create array (\(size) items) by inserting items at zero index", result: resultClassInsert.time))
    
    let resultClassAppend = Test.measureCreatingClasses(size: size, method: Test.ArrayOperation.Append)
    results.append(TestResult(name: "CLASSES: Create array (\(size) items) of classes by appending items", result: resultClassAppend.time))
    
    let resultClassSort = Test.measureSort(resultClassAppend.array)
    results.append(TestResult(name: "CLASSES: Sorting", result: resultClassSort.time))
    
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return results.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
    let testResult = results[indexPath.row]
    cell.textLabel?.text = testResult.name + "\n" + "\(testResult.result)"
    cell.textLabel?.numberOfLines = 0
    return cell
  }
  
}




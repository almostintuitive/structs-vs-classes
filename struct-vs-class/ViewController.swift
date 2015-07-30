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
    results.append(TestResult(name: "Creating an array (\(size) items) of structs by inserting items at the beginning", result: resultStructInsert.time))
    
    let resultStructAppend = Test.measureCreatingStructs(size: size, method: Test.ArrayOperation.Append)
    results.append(TestResult(name: "Creating an array (\(size) items) of structs by appending items", result: resultStructAppend.time))

    let resultStructSort = Test.measureSort(resultStructAppend.array)
    results.append(TestResult(name: "Sorting an array (\(size) items) of structs", result: resultStructSort.time))


    
    let resultClassInsert = Test.measureCreatingClasses(size: size, method: Test.ArrayOperation.InsertAtBeginning)
    results.append(TestResult(name: "Creating an array (\(size) items) of classes by inserting items at the beginning", result: resultClassInsert.time))
    
    let resultClassAppend = Test.measureCreatingClasses(size: size, method: Test.ArrayOperation.Append)
    results.append(TestResult(name: "Creating an array (\(size) items) of classes by appending items", result: resultClassAppend.time))
    
    let resultClassSort = Test.measureSort(resultClassAppend.array)
    results.append(TestResult(name: "Sorting an array (\(size) items) of classes:", result: resultClassSort.time))
    
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




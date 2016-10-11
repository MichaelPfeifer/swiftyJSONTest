//
//  ViewController.swift
//  SwiftyJsonTest
//
//  Created by Michael Pfeifer on 08.10.16.
//  Copyright © 2016 Michael Pfeifer. All rights reserved.
//

import Cocoa
import SwiftyJSON




class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

 
    @IBOutlet weak var tableView: NSTableView!
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    loadJSON()
    
      print(names)
     }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return names.count
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let column = tableColumn {
            if let cellView = tableView.make(withIdentifier: column.identifier, owner: nil) as? NSTableCellView {
                
                
                if (column.identifier == "servoname") {
                   let name = names[row]
                    cellView.textField?.stringValue = name
                    return cellView
                }
                else if (column.identifier == "busnummer") {
                    let number = numbers[row]
                    cellView.textField?.stringValue = number
                    return cellView
                }
                
                return cellView
            }
        }
        return nil
    }
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }

}


    
  



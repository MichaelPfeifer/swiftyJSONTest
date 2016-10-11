//
//  LoadJSON.swift
//  SwiftyJsonTest
//
//  Created by Michael Pfeifer on 11.10.16.
//  Copyright © 2016 Michael Pfeifer. All rights reserved.
//

import Foundation
import SwiftyJSON

 var names = [String]()
    


func loadJSON()  {
    if let path = Bundle.main.path(forResource: "ServoListe", ofType: "json") {
        do {
            let data = try NSData(contentsOf: URL(fileURLWithPath: path), options: NSData.ReadingOptions.mappedIfSafe)
            let jsonObj = JSON(data: data as Data)
            if jsonObj != JSON.null {
                //                 print("jsonData:\(jsonObj)")
                let name = jsonObj["listen"]["servo1"]["servoname"]
                
                //             print("\(name)")
                names.append("\(name)")
            } else {
                print("Could not get json from file, make sure that file contains valid json.")
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    } else {
        print("Invalid filename/path.")
    }
    
}

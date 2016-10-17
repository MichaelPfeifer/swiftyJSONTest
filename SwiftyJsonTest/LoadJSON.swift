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
var numbers = [String]()
var servomins = [String]()
var servomaxs = [String]()
var servohomes = [String]()
var beschreibungs = [String]()
var NumberofRows = 0


func loadJSON()  {
    if let path = Bundle.main.path(forResource: "ServoListe", ofType: "json") {
        do {
            let data = try NSData(contentsOf: URL(fileURLWithPath: path), options: NSData.ReadingOptions.mappedIfSafe)
            let jsonObj = JSON(data: data as Data)
            if jsonObj != JSON.null {
                
                NumberofRows = jsonObj["listen"].count
                
                for i in 1...NumberofRows {
                    var servo = "servo"
                    servo += "\(i)"
                    let name = jsonObj["listen"][servo]["servoname"]
                    let number = jsonObj["listen"][servo]["busnummer"]
                    let servomin = jsonObj["listen"][servo]["servomin"]
                    let servomax = jsonObj["listen"][servo]["servomax"]
                    let servohome = jsonObj["listen"][servo]["servohome"]
                    let beschreibung = jsonObj["listen"][servo]["beschreibung"]
                    names.append("\(name)")
                    numbers.append("\(number)")
                    servomins.append("\(servomin)")
                    servomaxs.append("\(servomax)")
                    servohomes.append("\(servohome)")
                    beschreibungs.append("\(beschreibung)")
                }
                
                
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

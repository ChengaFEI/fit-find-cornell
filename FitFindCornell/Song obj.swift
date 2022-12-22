//
//  Song obj.swift
//  FitFindCornell
//
//  Created by Cheng Fei on 10/24/22.
//

import Foundation
import UIKit

class GYM{
    var gympic: String
    var gymName: String
  
    
    init(gympic: String, name: String) {
        self.gympic = gympic
        self.gymName = name
       
    }
    
    
}
struct Reservation: Codable{
    var time: String
    var date: String
    var gym: String
    
    init(time: String, date: String, gym: String) {
        self.time = time
        self.date = date
        self.gym = gym
    }
    
}

struct User: Codable{
    var email: String
    var password: String
    
    
    init(email: String, password: String) {
        self.email  = email
        self.password = password
        
    }
    
}

struct user : Codable{
    let email : String
    let password :String
//    let reservatons : [locaton_id, facility_id, datetime]
}

struct Location: Codable{
    let id : String
    let name: String
    let week_day_operaating_time : [String]
    let week_end_operaating_time : [String]
    let adress : String
    let holiday: [String]
    init(id: String, name: String, week_day_operaating_time: [String], week_end_operaating_time: [String], adress: String, holiday: [String]) {
        self.id = id
        self.name = name
        self.week_day_operaating_time = week_day_operaating_time
        self.week_end_operaating_time = week_end_operaating_time
        self.adress = adress
        self.holiday = holiday
    }
    
}

struct Facility: Codable{
    
    let id: String
    let name: String
    
    var reserved: Reserved
}

struct Reserved: Codable{
    let Netid: String
    let Name: String
    let datetime : String
    
}

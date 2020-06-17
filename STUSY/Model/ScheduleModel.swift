//
//  ScheduleModel.swift
//  STUSY
//
//  Created by Ramin Akhmad on 16.06.2020.
//  Copyright © 2020 Ramin Akhmad. All rights reserved.
//

import Foundation

struct University {
    let name: String
    let groups: [Group]
}

struct Group {
    let name: String
    let weekdays: [Weekday]
}

struct Weekday {
    let weekday: Weekday
    let arrayLessons: [Lesson]
    
    enum Weekday {
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        
        var name: String {
            switch self {
            case .monday:
                return "monday"
            case .tuesday:
                return "tuesday"
            case .wednesday:
                return "wednesday"
            case .thursday:
                return "thursday"
            case .friday:
                return "friday"
            }
        }
    }
}

struct Lesson {
    let name: String
    let lector: String
    let classRoom: String
}

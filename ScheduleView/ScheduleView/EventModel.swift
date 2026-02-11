//
//  EventModel.swift
//  ScheduleView
//
//  Created by next on 11/02/26.
//

import Foundation
struct ScheduleEvent: Identifiable {
    let id = UUID()
    let title: String
    let time: String
    let type: EventType
}

enum EventType {
    case join
    case active
}

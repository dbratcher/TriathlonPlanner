//
//  TimeModel.swift
//  TriathlonPlanner
//
//  Created by Drew Bratcher on 7/10/22.
//

struct TimeModel {
    let hours: Int
    let minutes: Int
    let seconds: Int
    
    init(hours: Int, minutes: Int, seconds: Int) {
        assert(hours >= 0, "Hours must be greater than or equal to 0 for a time")
        assert(minutes >= 0, "Minutes must be greater than or equal to 0 for a time")
        assert(minutes < 60, "Minutes must be less than 60 for a time")
        assert(seconds >= 0, "Seconds must be greater than or equal to 0 for a time")
        assert(seconds < 60, "Seconds must be less than 60 for a time")
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }
    
    var mm_ss_format: String {
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var hh_mm_ss_format: String {
        return String(format: "%d:%02d:%02d", hours, minutes, seconds)
    }
}

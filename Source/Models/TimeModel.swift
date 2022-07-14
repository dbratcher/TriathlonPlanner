//
//  TimeModel.swift
//  TriathlonPlanner
//
//  Created by Drew Bratcher on 7/10/22.
//

import Combine

class TimeModel: ObservableObject {
    @Published var hours: Int
    @Published var minutes: Int
    @Published var seconds: Int
    
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
        return String(format: "%d:%02d", minutes, seconds)
    }
    
    var hh_mm_ss_format: String {
        return String(format: "%d:%02d:%02d", hours, minutes, seconds)
    }
    
    func divideBy(_ multiple: Float) -> TimeModel {
        assert(multiple > 0, "Can only divide by numbers larger than 0")
        
        let newHours = Float(hours) / multiple
        let newMinutes = Float(minutes) / multiple + (newHours - Float(Int(newHours))) * 60
        let newSeconds = Float(seconds) / multiple + (newMinutes - Float(Int(newMinutes))) * 60
        
        return TimeModel(hours: Int(newHours), minutes: Int(newMinutes), seconds: Int(newSeconds))
    }
    
    func times(_ multiple: Float) -> TimeModel {
        assert(multiple > 0, "Can only multiply by numbers larger than 0")
        
        let newSeconds: Int = Int(Float(seconds) * multiple) % 60
        let totalMinutes: Int = Int(Float(minutes) * multiple) + Int(Float(seconds) * multiple) / 60
        let newMinutes: Int = totalMinutes % 60
        let newHours = Int(Float(hours) * multiple) + totalMinutes / 60
        
        return TimeModel(hours: newHours, minutes: newMinutes, seconds: newSeconds)
    }
}

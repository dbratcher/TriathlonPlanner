//
//  TimeButtonView.swift
//  TriathlonPlanner
//
//  Created by Drew Bratcher on 7/10/22.
//

import SwiftUI

struct TimeButtonView: View {
    @ObservedObject var time: TimeModel
    var showHours: Bool = false
    
    @State private var showingPopover = false
    
    var timeDisplay: String {
        if showHours {
            return time.hh_mm_ss_format
        } else {
            return time.mm_ss_format
        }
    }
    
    var body: some View {
        Button(timeDisplay) {
            showingPopover = true
        }
        .popover(isPresented: $showingPopover) {
            TimePickerView(showHours: showHours, time: time)
        }
    }
}

struct TimeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TimeButtonView(time: TimeModel(hours: 1, minutes: 1, seconds: 1))
    }
}


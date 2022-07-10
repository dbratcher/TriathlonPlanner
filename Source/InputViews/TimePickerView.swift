//
//  TimePickerView.swift
//  TriathlonPlanner
//
//  Created by Drew Bratcher on 7/10/22.
//

import SwiftUI

// hack to fix picker view touch targets for smaller sizes
// see - https://developer.apple.com/forums/thread/687986
extension UIPickerView {
    open override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: super.intrinsicContentSize.height)
    }
}

struct TimePickerView: View {
    var showHours: Bool = false
    
    @ObservedObject var time: TimeModel
    
    private let hoursArray = [Int](0..<24)
    private let minutesArray = [Int](0..<60)
    private let secondsArray = [Int](0..<60)
    
    var body: some View {
        VStack {
            if showHours {
                Text(time.hh_mm_ss_format)
                    .font(.title)
            } else {
                Text(time.mm_ss_format)
                    .font(.title)
            }
            HStack {
                if showHours {
                    HStack {
                        Picker("Hours", selection: $time.hours) {
                            ForEach(hoursArray, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: 70)
                        .labelsHidden()
                        .compositingGroup()
                        .clipped()
                        
                        Text("hours")
                    }
                }
                
                HStack {
                    Picker("Minutes", selection: $time.minutes) {
                        ForEach(minutesArray, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 70)
                    .labelsHidden()
                    .compositingGroup()
                    .clipped()
                    
                    Text("min")
                }
                
                HStack {
                    Picker("Seconds", selection: $time.seconds) {
                        ForEach(secondsArray, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.wheel)
                    .labelsHidden()
                    .frame(width: 70)
                    .compositingGroup()
                    .clipped()
                    
                    Text("sec")
                }
            }
        }
    }
}

struct TimePickerView_Previews: PreviewProvider {
    static var previews: some View {
        TimePickerView(time: TimeModel(hours: 1, minutes: 1, seconds: 1))
    }
}


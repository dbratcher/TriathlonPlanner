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
    
    private let hoursArray = [Int](0..<24)
    private let minutesArray = [Int](0..<60)
    private let secondsArray = [Int](0..<60)
    
    @State var hourSelection: Int = 0
    @State var minutesSelection: Int = 0
    @State var secondsSelection: Int = 0
    
    var time: TimeModel {
        return TimeModel(hours: hourSelection, minutes: minutesSelection, seconds: secondsSelection)
    }
    
    var body: some View {
        VStack {
            Text(time.hh_mm_ss_format)
                .font(.title)
            HStack {
                
                HStack {
                    Picker("Hours", selection: $hourSelection) {
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
                
                HStack {
                    Picker("Minutes", selection: $minutesSelection) {
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
                    Picker("Seconds", selection: $secondsSelection) {
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
        TimePickerView()
    }
}


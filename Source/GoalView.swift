//
//  GoalView.swift
//  TriathlonPlanner
//
//  Created by Drew Bratcher on 7/9/22.
//

import SwiftUI

struct EditableTimeView: View {
    var time: String
    
    var body: some View {
        Text(time)
            .foregroundColor(.accentColor)
            .underline()
    }
}

struct HeaderView: View {
    var body: some View {
        Label("Goals", systemImage: "timer")
            .font(.title)
    }
}

struct RaceTypeView: View {
    @Binding var raceType: RaceTypeModel
    
    var body: some View {
        HStack {
            Text("Race Type:")
                .font(.headline)
            Picker("Race Type", selection: $raceType) {
                ForEach(RaceTypeModel.raceTypes, id: \.self) {
                    Text($0.name)
                }
            }
            .frame(width:100)
        }
        .frame(maxWidth:200)
    }
}

struct SportView: View {
    var sportName: String
    var distance: String
    
    var body: some View {
        VStack {
            HStack {
                Text(sportName)
                    .font(.headline)
                Spacer()
                Text(distance)
                    .font(.subheadline)
            }
            HStack {
                EditableTimeView(time: "TBD")
                Text("/ 50yds")
                Spacer()
                Text("Total:")
                EditableTimeView(time: "TBD")
            }
        }
        .frame(maxWidth: 350)
    }
}

struct TransitionView: View {
    var transition: TransitionModel
    
    var body: some View {
        HStack {
            Text(transition.name)
                .foregroundColor(.secondary)
                .font(.headline)
            EditableTimeView(time: transition.time)
        }
    }
}

struct TotalTimeView: View {
    var body: some View {
        HStack {
            Text("Total Time:")
            Text("10:00:00")
        }
    }
}

struct AllLegsView: View {
    @Binding var raceType: RaceTypeModel
    var body: some View {
        SportView(sportName: "Swim", distance: raceType.swimDistance)
        Spacer()
        TransitionView(transition: TransitionModel(name: "Transition 1", time: "05:00"))
        Spacer()
        SportView(sportName: "Bike", distance: raceType.bikeDistance)
        Spacer()
        TransitionView(transition: TransitionModel(name: "Transition 2", time: "05:00"))
        Spacer()
        SportView(sportName: "Run", distance: raceType.runDistance)
    }
}

struct GoalView: View {
    @State private var raceType: RaceTypeModel = RaceTypeModel.raceTypes[0]
    
    var body: some View {
        VStack {
            HeaderView()
            Spacer()
            RaceTypeView(raceType: $raceType)
            Spacer()
            AllLegsView(raceType: $raceType)
            Spacer()
            TotalTimeView()
        }
        .frame(maxHeight: 450)
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView()
    }
}

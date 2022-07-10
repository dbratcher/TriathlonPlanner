//
//  GoalView.swift
//  TriathlonPlanner
//
//  Created by Drew Bratcher on 7/9/22.
//

import SwiftUI


struct HeaderView: View {
    var body: some View {
        Label("Goals", systemImage: "timer")
            .font(.title)
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
            EditableTimeView(time: transition.time.mm_ss_format)
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
        TransitionView(transition: TransitionModel(name: "Transition 1", time: TimeModel(hours: 0, minutes: 5, seconds: 0)))
        Spacer()
        SportView(sportName: "Bike", distance: raceType.bikeDistance)
        Spacer()
        TransitionView(transition: TransitionModel(name: "Transition 2", time: TimeModel(hours: 0, minutes: 5, seconds: 0)))
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

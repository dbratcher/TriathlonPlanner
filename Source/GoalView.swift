//
//  GoalView.swift
//  TriathlonPlanner
//
//  Created by Drew Bratcher on 7/9/22.
//

import SwiftUI

struct RaceTypeModel: Hashable {
    var name: String
    var swimDistance: String
    var bikeDistance: String
    var runDistance: String
    
    static let raceTypes = [
        RaceTypeModel(
            name: "Iron Man",
            swimDistance: "2.4 miles",
            bikeDistance: "112 miles",
            runDistance: "26.2 miles"
        ),
        RaceTypeModel(
            name: "Half Iron Man",
            swimDistance: "1.2 miles",
            bikeDistance: "56 miles",
            runDistance: "13.1 miles"
        ),
        RaceTypeModel(
            name: "Olympic",
            swimDistance: "0.93 miles",
            bikeDistance: "24.8 miles",
            runDistance: "6.2 miles"
        ),
        RaceTypeModel(
            name: "Sprint",
            swimDistance: "0.5 miles",
            bikeDistance: "12.4 miles",
            runDistance: "3.1 miles"
        ),
        RaceTypeModel(
            name: "Custom",
            swimDistance: "100 yards",
            bikeDistance: "5 miles",
            runDistance: "1 mile"
        )
    ]
}



struct EditableTimeView: View {
    var body: some View {
        Text("02:00")
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
                EditableTimeView()
                Text("/ 50yds")
                Spacer()
                Text("Total:")
                EditableTimeView()
            }
        }
        .frame(maxWidth: 350)
    }
}

struct TransitionView: View {
    var body: some View {
        HStack {
            Text("Transition 1")
                .foregroundColor(.secondary)
                .font(.headline)
            EditableTimeView()
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
        TransitionView()
        Spacer()
        SportView(sportName: "Bike", distance: raceType.bikeDistance)
        Spacer()
        TransitionView()
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

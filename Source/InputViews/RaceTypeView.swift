//
//  RaceTypeView.swift
//  TriathlonPlanner
//
//  Created by Drew Bratcher on 7/10/22.
//

import SwiftUI

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

struct RaceTypeView_Previews: PreviewProvider {
    static var previews: some View {
        RaceTypeView(raceType: .constant(RaceTypeModel(name: "Swim", swimDistance: "2.4 miles", bikeDistance: "112 miles", runDistance: "26.2 miles")))
    }
}

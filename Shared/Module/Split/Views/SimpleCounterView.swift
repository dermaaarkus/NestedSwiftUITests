//
//  SplitAView.swift
//  NestedSwiftUITests (iOS)
//
//  Created by Markus Faßbender on 21.09.22.
//

import SwiftUI

struct SimpleCounterView: View {

    let title: String

    @State private var count: Int = 0

    var body: some View {
        VStack {
            Text(title)

            Stepper("\(count)") {
                count += 1
            } onDecrement: {
                count -= 1
            }
        }
        .padding()
        .background(Color.lightRandom())
    }
}

struct SplitSimpleCounterView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleCounterView(title: "Preview")
    }
}


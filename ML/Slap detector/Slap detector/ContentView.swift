//
//  ContentView.swift
//  Slap detector
//
//  Created by Ludovic Ollagnier on 08/06/2021.
//

import SwiftUI
import CoreML

struct ContentView: View {

    var detector = try? SlappingDetector(configuration: MLModelConfiguration())

    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                SlappingDetectorOutput(labelProbability: <#T##[String : Double]#>, label: <#T##String#>, stateOut: <#T##MLMultiArray#>)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

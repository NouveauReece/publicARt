//
//  ContentView.swift
//  publicARt
//
//  Created by Reece Needham on 4/22/24.
//

import RealityKit
import SwiftUI

struct ContentView : View {
    @ObservedObject var arViewModel : ARViewModel = ARViewModel()
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("Is Image Recognized?")
                switch arViewModel.imageRecognizedVar {
                case false: Text("No").foregroundColor(.red)
                case true: Text("Yes").foregroundColor(.green)
                }
                if arViewModel.isAttemptingLoad {
                    Text("Loading Model...")
                }
            }.foregroundStyle(.white)
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    var arViewModel: ARViewModel
    
    func makeUIView(context: Context) -> ARView {
        arViewModel.startSessionDelegate()
        return arViewModel.arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

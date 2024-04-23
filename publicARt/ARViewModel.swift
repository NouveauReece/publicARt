//
//  ARLogic.swift
//  publicARt
//
//  Created by Reece Needham
//  Informatics Department
//  Indiana University Bloomington
//

import Foundation
import RealityKit
import ARKit

class ARViewModel: UIViewController, ObservableObject,  ARSessionDelegate {
    @Published private var model : ARModel = ARModel()
    
    var arView : ARView {
        model.arView
    }
    
    var imageRecognizedVar : Bool {
        model.imageRecognizedVar
    }
    
    var isAttemptingLoad : Bool {
        model.isAttemptingLoad
    }
    
    func startSessionDelegate() {
        model.arView.session.delegate = self
    }
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        model.imageRecognized(anchors: anchors)
    }
    
}

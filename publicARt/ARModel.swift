//
//  ARModel.swift
//  publicARt
//
//  Created by Reece Needham on 4/22/24.
//

import Foundation
import RealityKit
import ARKit

struct ARModel {
    private(set) var arView : ARView
    
    var imageRecognizedVar = false
    var isAttemptingLoad = false
    
    init() {
        arView = ARView(frame: .zero)
        
        guard let trackerImage = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }

        let configuration = ARWorldTrackingConfiguration()
        configuration.detectionImages = trackerImage
        arView.session.run(configuration)
    }
    
    mutating func imageRecognized(anchors: [ARAnchor]) {
        
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }
        
        for anchor in anchors {
            guard let imageAnchor = anchor as? ARImageAnchor else { return }
            imageRecognizedVar = true
            
            
            guard var entity = try? Entity.loadAnchor(
              named: "statue"
            ) else {
              // failed to load entity
              return
            }
            
            var imgAE = AnchorEntity(anchor: imageAnchor)
            let scale = Transform(scale: SIMD3<Float>(0.001,0.001,0.001))
            entity.transform = scale
            imgAE.addChild(entity)
            isAttemptingLoad = true
            arView.scene.addAnchor(imgAE)

            
        }
    }
}

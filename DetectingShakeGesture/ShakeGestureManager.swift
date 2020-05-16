//
//  ShakeGestureManager.swift
//  DetectingShakeGesture
//
//  Created by Ramill Ibragimov on 16.05.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI
import Combine

let messagePublisher = PassthroughSubject<Void, Never>()

class ShakableViewController: UIViewController {

    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        messagePublisher.send()
    }
    
}

struct ShakableViewRepresentable: UIViewControllerRepresentable {
      
    func makeUIViewController(context: Context) -> ShakableViewController {
        ShakableViewController()
    }
    
    func updateUIViewController(_ uiViewController: ShakableViewController, context: Context) {
        
    }
}
